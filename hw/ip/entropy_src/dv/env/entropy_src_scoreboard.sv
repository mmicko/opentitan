// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class entropy_src_scoreboard extends cip_base_scoreboard
  #(
    .CFG_T(entropy_src_env_cfg),
    .RAL_T(entropy_src_reg_block),
    .COV_T(entropy_src_env_cov)
  );
  import entropy_src_pkg::*;

  `uvm_component_utils(entropy_src_scoreboard)

  // used by collect_entropy to determine the FSMs phase
  int seed_idx           = 0;
  int entropy_data_reads = 0;

  // local variables
  bit [31:0]                       entropy_data_q[$];
  bit [FIPS_CSRNG_BUS_WIDTH - 1:0] fips_csrng_q[$];

  // TLM agent fifos
  uvm_tlm_analysis_fifo#(push_pull_item#(.HostDataWidth(FIPS_CSRNG_BUS_WIDTH)))
      csrng_fifo;
  uvm_tlm_analysis_fifo#(push_pull_item#(.HostDataWidth(RNG_BUS_WIDTH)))
      rng_fifo;

  `uvm_component_new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    rng_fifo   = new("rng_fifo", this);
    csrng_fifo = new("csrng_fifo", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    if (cfg.en_scb) begin
      fork
        collect_entropy();
        process_csrng();
      join_none
    end
  endtask

  virtual task process_tl_access(tl_seq_item item, tl_channels_e channel, string ral_name);
    uvm_reg csr;
    // TODO: Add conditioning prediction, still TBD in design
    bit do_read_check       = 1'b1;
    bit write               = item.is_write();
    uvm_reg_addr_t csr_addr = cfg.ral_models[ral_name].get_word_aligned_addr(item.a_addr);

    // if access was to a valid csr, get the csr handle
    if (csr_addr inside {cfg.ral_models[ral_name].csr_addrs}) begin
      csr = cfg.ral_models[ral_name].default_map.get_reg_by_offset(csr_addr);
      `DV_CHECK_NE_FATAL(csr, null)
    end else begin
      `uvm_fatal(`gfn, $sformatf("Access unexpected addr 0x%0h", csr_addr))
    end

    if (channel == AddrChannel) begin
      // if incoming access is a write to a valid csr, then make updates right away
      if (write) begin
        void'(csr.predict(.value(item.a_data), .kind(UVM_PREDICT_WRITE), .be(item.a_mask)));
      end
    end

    // process the csr req
    // for write, update local variable and fifo at address phase
    // for read, update predication at address phase and compare at data phase
    case (csr.get_name())
      // add individual case item for each csr
      "intr_state": begin
        // TODO
        do_read_check = 1'b0;
      end
      "intr_enable": begin
      end
      "intr_test": begin
      end
      "regwen": begin
      end
      "conf": begin
      end
      "rev": begin
      end
      "rate": begin
      end
      "entropy_control": begin
      end
      "entropy_data": begin
      end
      "health_test_windows": begin
      end
      "repcnt_thresholds": begin
      end
      "adaptp_hi_thresholds": begin
      end
      "adaptp_lo_thresholds": begin
      end
      "bucket_thresholds": begin
      end
      "markov_thresholds": begin
      end
      "repcnt_hi_watermarks": begin
      end
      "adaptp_hi_watermarks": begin
      end
      "adaptp_lo_watermarks": begin
      end
      "bucket_hi_watermarks": begin
      end
      "markov_hi_watermarks": begin
      end
      "repcnt_total_fails": begin
      end
      "adaptp_hi_total_fails": begin
      end
      "adaptp_lo_total_fails": begin
      end
      "bucket_total_fails": begin
      end
      "markov_total_fails": begin
      end
      "alert_threshold": begin
      end
      "alert_fail_counts": begin
      end
      "debug_status": begin
      end
      "seed": begin
      end
      default: begin
        `uvm_fatal(`gfn, $sformatf("invalid csr: %0s", csr.get_full_name()))
      end
    endcase

    // On reads, if do_read_check is set, then check mirrored_value against item.d_data
    if (!write && channel == DataChannel) begin
      if (do_read_check) begin
        case (csr.get_name())
          "entropy_data": begin
            bit [31:0] ed_pred_data = entropy_data_q.pop_front();
            `uvm_info(`gfn, $sformatf("entropy_data_prediction: %08h\n", ed_pred_data), UVM_MEDIUM)
            `uvm_info(`gfn, $sformatf("Actual value:            %08h", item.d_data), UVM_HIGH)
            `DV_CHECK_FATAL(csr.predict(.value(ed_pred_data), .kind(UVM_PREDICT_READ)))
            entropy_data_reads++;
            `uvm_info(`gfn, $sformatf("entropy_data_reads: %3d\n", entropy_data_reads), UVM_MEDIUM);
          end
        endcase

        `DV_CHECK_EQ(csr.get_mirrored_value(), item.d_data,
                     $sformatf("reg name: %0s", csr.get_full_name()))
      end
    end
  endtask

  function bit [FIPS_BUS_WIDTH - 1:0] get_fips_compliance(
      bit [FIPS_CSRNG_BUS_WIDTH - 1:0] fips_csrng);
    return fips_csrng[CSRNG_BUS_WIDTH +: FIPS_BUS_WIDTH];
  endfunction

  function bit [CSRNG_BUS_WIDTH - 1:0] get_csrng_seed(bit [FIPS_CSRNG_BUS_WIDTH - 1:0] fips_csrng);
    return fips_csrng[0 +: CSRNG_BUS_WIDTH];
  endfunction

  // Note: this routine is destructive in that it empties the input argument
  function bit [FIPS_CSRNG_BUS_WIDTH - 1:0] predict_fips_csrng(queue_of_rng_val_t sample);
    bit [FIPS_CSRNG_BUS_WIDTH - 1:0] fips_csrng_data;
    bit [CSRNG_BUS_WIDTH - 1:0]      csrng_data;
    bit [FIPS_BUS_WIDTH - 1:0]       fips_data;
    entropy_phase_e                  dut_phase;
    bit                              predict_conditioned;

    int                              sample_rng_frames;
    int                              pass_cnt_threshold;
    int                              pass_cnt;

    dut_phase = convert_seed_idx_to_phase(seed_idx,
                                          cfg.boot_bypass_disable == prim_mubi_pkg::MuBi4True);

    sample_rng_frames = sample.size();

    `uvm_info(`gfn, $sformatf("processing %01d frames", sample_rng_frames), UVM_FULL)

    predict_conditioned = (cfg.type_bypass != prim_mubi_pkg::MuBi4True) && (dut_phase != BOOT);

    // TODO: for now assume that data is fips certified if it has been conditioned
    //       need to check that no other conditions apply for released data.
    fips_data    = predict_conditioned;

    if (predict_conditioned) begin
      int rng_per_byte = 8 / RNG_BUS_WIDTH;

      bit [7:0] sha_msg[];
      bit [7:0] sha_digest[CSRNG_BUS_WIDTH / 8];
      longint msg_len = 0;

      sha_msg = new[sample.size() / rng_per_byte];

      while (sample.size() > 0) begin
        bit [7:0] sha_byte = '0;
        for (int i = 0; i < rng_per_byte; i++) begin
          sha_byte = (sha_byte >> RNG_BUS_WIDTH);
          sha_byte = sha_byte | (sample.pop_front() << (8 - RNG_BUS_WIDTH));
        end
        `uvm_info(`gfn, $sformatf("msglen: %04h, byte: %02h", msg_len, sha_byte), UVM_FULL)
        sha_msg[msg_len] = sha_byte;
        msg_len++;
      end

      `uvm_info(`gfn, $sformatf("DIGESTION COMMENCING of %d bytes", msg_len), UVM_FULL)

      digestpp_dpi_pkg::c_dpi_sha3_384(sha_msg, msg_len, sha_digest);

      `uvm_info(`gfn, "DIGESTING COMPLETE", UVM_FULL)

      csrng_data = '0;
      for(int i = 0; i < CSRNG_BUS_WIDTH / 8; i++) begin
        bit [7:0] sha_byte = sha_digest[i];

        `uvm_info(`gfn, $sformatf("repacking: %02d", i), UVM_FULL)

        csrng_data = (csrng_data >> 8) | (sha_byte << (CSRNG_BUS_WIDTH - 8));
      end
      `uvm_info(`gfn, $sformatf("Conditioned data: %096h", csrng_data), UVM_HIGH)

    end else begin

      while (sample.size() > 0) begin
        rng_val_t rng_val = sample.pop_back();
        // Since the queue is read from back to front
        // earlier rng bits occupy the less significant bits of csrng_data
        csrng_data = (csrng_data << RNG_BUS_WIDTH) + rng_val;
      end
      `uvm_info(`gfn, $sformatf("Unconditioned data: %096h", csrng_data), UVM_HIGH)

    end
    fips_csrng_data = {fips_data, csrng_data};

    return fips_csrng_data;
  endfunction

  task collect_entropy();

    bit [15:0]                window_size;
    entropy_phase_e           dut_fsm_phase;
    push_pull_item#(.HostDataWidth(RNG_BUS_WIDTH))  rng_item;
    rng_val_t                 rng_val;
    // TODO rename window to "sample"
    queue_of_rng_val_t        window;
    queue_of_rng_val_t        sample;
    int                       window_rng_frames;
    int                       pass_requirement, pass_cnt;
    int                       retry_limit, retry_cnt;

    retry_cnt = 0;
    pass_cnt  = 0;

    window.delete();
    sample.delete();

    forever begin : collect_entropy_loop

      dut_fsm_phase = convert_seed_idx_to_phase(seed_idx,
          cfg.boot_bypass_disable == prim_mubi_pkg::MuBi4True);

      case (dut_fsm_phase)
        BOOT: begin
          pass_requirement = 1;
          retry_limit = cfg.boot_mode_retry_limit;
        end
        STARTUP: begin
          pass_requirement = 2;
          retry_limit = 2;
        end
        CONTINUOUS: begin
          pass_requirement = 0;
          retry_limit = 2;
        end
        default: begin
          `uvm_fatal(`gfn, "Invalid predicted dut state (bug in environment)")
        end
      endcase

      `uvm_info(`gfn, $sformatf("phase: %s\n", dut_fsm_phase.name), UVM_HIGH)

      window_size = rng_window_size(seed_idx, cfg.type_bypass == prim_mubi_pkg::MuBi4True,
                                    cfg.boot_bypass_disable == prim_mubi_pkg::MuBi4True,
                                    cfg.fips_window_size);

      `uvm_info(`gfn, $sformatf("window_size: %08d\n", window_size), UVM_HIGH)

      // Note on RNG bit enable and window frame count:
      // When rng_bit_enable is selected, the function below repacks the data so that
      // the selected bit fills a whole frame.
      // This mirrors the DUT's behavior of repacking the data before the health checks
      //
      // Thus the number of (repacked) window frames is the same regardless of whether
      // the bit select is enabled.

      window_rng_frames = window_size / RNG_BUS_WIDTH;

      window.delete();
      if(dut_fsm_phase != STARTUP) begin
        sample.delete();
      end

      while (window.size() < window_rng_frames) begin
        if (cfg.rng_bit_enable == prim_mubi_pkg::MuBi4True) begin
          for (int i = 0; i < RNG_BUS_WIDTH; i++) begin
            rng_fifo.get(rng_item);
            rng_val[i] = rng_item.h_data[cfg.rng_bit_sel];
          end
        end else begin
          rng_fifo.get(rng_item);
          rng_val = rng_item.h_data;
        end
        window.push_back(rng_val);
      end


     `uvm_info(`gfn, "FULL_WINDOW", UVM_FULL)
      if (health_check_rng_data(window)) begin
        retry_cnt++;
        pass_cnt = 0;
      end else begin
        retry_cnt = 0;
        pass_cnt++;
      end

      // Now that the window has been tested, add it to the running sample.
      while(window.size() > 0) begin
        sample.push_back(window.pop_front());
      end

      `uvm_info(`gfn, $sformatf("pass_cnt: %01d, retry_cnt: %01d", pass_cnt, retry_cnt), UVM_HIGH)
      `uvm_info(`gfn, $sformatf("pass_requirement: %01d", pass_requirement), UVM_HIGH)
      `uvm_info(`gfn, $sformatf("retry_limit: %01d", retry_limit), UVM_HIGH)
      `uvm_info(`gfn, $sformatf("sample.size: %01d", sample.size()), UVM_HIGH)

      // TODO: Update health check stats.
      if (retry_cnt >= retry_limit) begin
        // TODO: Alert state
        `uvm_info(`gfn, "TODO: manage alerts", UVM_FULL)
      end else if (pass_cnt >= pass_requirement) begin
        bit [FIPS_CSRNG_BUS_WIDTH - 1:0] fips_csrng;

        fips_csrng = predict_fips_csrng(sample);

        // update counters for processing next seed:
        retry_cnt = 0;
        pass_cnt  = 0;
        seed_idx++;

        // package data for routing to SW or to CSRNG:
        if (cfg.route_software == prim_mubi_pkg::MuBi4True) begin
          bit [CSRNG_BUS_WIDTH - 1:0] csrng_seed = get_csrng_seed(fips_csrng);
          for (int i = 0; i < CSRNG_BUS_WIDTH / TL_DW; i++) begin
            bit [TL_DW - 1:0] entropy_slice = csrng_seed[i * TL_DW +: TL_DW];
            entropy_data_q.push_back(entropy_slice);
          end
        end else if (cfg.route_software == prim_mubi_pkg::MuBi4False) begin
          fips_csrng_q.push_back(fips_csrng);
        end
      end else begin
        // Inconsequential health check failure
      end

    end : collect_entropy_loop

  endtask

  virtual task process_csrng();
    push_pull_item#(.HostDataWidth(FIPS_CSRNG_BUS_WIDTH))  item;
    bit [FIPS_CSRNG_BUS_WIDTH - 1:0]   fips_csrng_data;

   `uvm_info(`gfn, "task \"process_csrng\" starting\n", UVM_FULL)

    forever begin
      csrng_fifo.get(item);
      fips_csrng_data = item.d_data;
      `uvm_info(`gfn, "process_csrng: new item: %096h\n", UVM_MEDIUM)
      `DV_CHECK_EQ_FATAL(fips_csrng_data, fips_csrng_q[0])
      fips_csrng_q.pop_front();
    end
  endtask

  virtual function void reset(string kind = "HARD");
    super.reset(kind);
    // reset local fifos queues and variables
  endfunction

  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    // post test checks - ensure that all local fifos and queues are empty
  endfunction

endclass
