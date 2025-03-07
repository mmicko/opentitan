// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//

module lifecycle
  import lifecycle_pkg::*;
(
  input clk_i,
  input rst_ni,

  // TL-UL interface
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,

  // pwrmgr interface
  input  pwrmgr_pkg::pwr_lc_req_t pwrmgr_i,
  output pwrmgr_pkg::pwr_lc_rsp_t pwrmgr_o,

  // OTP interface
  output otp_ctrl_pkg::lc_otp_program_req_t otp_program_o,
  input  otp_ctrl_pkg::lc_otp_program_rsp_t otp_program_i,

  input  otp_ctrl_pkg::otp_lc_data_t otp_data_i,

  // Broadcasting signal
  output lc_tx_t dft_o,
  output lc_tx_t hw_debug_o,
  output lc_tx_t nvm_debug_o,
  output lc_tx_t cpu_o,
  output lc_tx_t provision_o,
  output lc_tx_t keymgr_o,

  output pinmux_pkg::lc_strap_req_t strap_sample_o,
  input  pinmux_pkg::lc_strap_rsp_t strap_sample_i//,

  //output flash_ctrl_pkg::flash_erase_req_t flash_erase_o,
  //input  flash_ctrl_pkg::flash_erase_rsp_t flash_erase_i//,

  //input devmode_i // Need later
);

  import lifecycle_reg_pkg::*;

  lifecycle_reg2hw_t reg2hw;
  lifecycle_hw2reg_t hw2reg;

  logic idle;
  logic lc_init; // from pwrmgr
  logic lc_done; // to pwrmgr

  assign pwrmgr_o = '{lc_done: lc_done, lc_idle: idle};
  assign lc_init = pwrmgr_i.lc_init;
  // BEGIN: Dummy impl here



  // END: Dummy impl here

  // Register interface
  logic devmode_i;
  assign devmode_i = 1'b1;

  lifecycle_reg_top u_reg (
    .clk_i,
    .rst_ni,

    .tl_i,
    .tl_o,

    .reg2hw,
    .hw2reg,

    .devmode_i (devmode_i)
  );

  // TODO: Remove after bronze
  prim_gate_gen #(
    .NumGates(2000)
  ) u_random_gates (
    .clk_i,
    .rst_ni,
    .valid_i (reg2hw.dummy_gate.qe),
    .data_i  (reg2hw.dummy_gate.q),
    .valid_o (hw2reg.dummy_gate.de),
    .data_o  (hw2reg.dummy_gate.d)
  );

  // Dummy assign
  assign otp_program_o = '{
    update: reg2hw.cmd.qe & reg2hw.cmd.q,
    command: reg2hw.dummy_otp.q
  };
  assign hw2reg.status.update_done.de = otp_program_i.done;
  assign hw2reg.status.update_done.d = 1'b1;

  assign dft_o.state       = reg2hw.dummy_ctrl.dft_en.q;
  assign hw_debug_o.state  = reg2hw.dummy_ctrl.hw_dbg_en.q;
  assign nvm_debug_o.state = reg2hw.dummy_ctrl.nvm_dbg_en.q;
  assign cpu_o.state       = reg2hw.dummy_ctrl.cpu_en.q;
  assign provision_o.state = reg2hw.dummy_ctrl.provision_en.q;
  assign keymgr_o.state    = reg2hw.dummy_ctrl.keymgr_en.q;

endmodule

