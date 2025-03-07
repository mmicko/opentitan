// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
module tb;
  // dep packages
  import uvm_pkg::*;
  import dv_utils_pkg::*;
  import aes_env_pkg::*;
  import aes_test_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  wire clk, rst_n;
  wire [NUM_MAX_INTERRUPTS-1:0] interrupts;
  prim_alert_pkg::alert_rx_t [aes_pkg::NumAlerts-1:0] alert_rx;
  assign alert_rx[0] = 4'b0101;

  // interfaces
  clk_rst_if clk_rst_if(.clk(clk), .rst_n(rst_n));
  pins_if #(NUM_MAX_INTERRUPTS) intr_if(interrupts);

  pins_if #(1) devmode_if();
  tl_if tl_if(.clk(clk), .rst_n(rst_n));

  // dut
  aes dut (
    .clk_i                (clk        ),
    .rst_ni               (rst_n      ),

    .keymgr_key_i         ( '0        ),

    .tl_i                 (tl_if.h2d  ),
    .tl_o                 (tl_if.d2h  ),

    .alert_rx_i           ( alert_rx  ),
    .alert_tx_o           (           )
  );

  initial begin
    // drive clk and rst_n from clk_if
    clk_rst_if.set_active();
    uvm_config_db#(virtual clk_rst_if)::set(null, "*.env", "clk_rst_vif", clk_rst_if);
    uvm_config_db#(intr_vif)::set(null, "*.env", "intr_vif", intr_if);
    uvm_config_db#(devmode_vif)::set(null, "*.env", "devmode_vif", devmode_if);
    uvm_config_db#(virtual tl_if)::set(null, "*.env.m_tl_agent*", "vif", tl_if);
    $timeformat(-12, 0, " ps", 12);
    run_test();
  end

endmodule
