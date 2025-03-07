// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:


package clkmgr_pkg;

  typedef struct packed {
    logic test_en;
  } clk_dft_t;

  parameter clk_dft_t CLK_DFT_DEFAULT = '{
    test_en: 1'b0
  };

  typedef struct packed {
  logic clk_io_div4_powerup;
  logic clk_aon_powerup;
  logic clk_main_powerup;
  logic clk_io_powerup;
  logic clk_usb_powerup;
  logic clk_io_div2_powerup;
  logic clk_aon_secure;
  logic clk_aon_peri;
  logic clk_main_aes;
  logic clk_main_hmac;
  logic clk_main_kmac;
  logic clk_main_keymgr;
  logic clk_main_csrng;
  logic clk_main_otbn;
  logic clk_main_infra;
  logic clk_io_infra;
  logic clk_io_div4_infra;
  logic clk_io_div4_secure;
  logic clk_main_secure;
  logic clk_io_div4_timers;
  logic clk_proc_main;
  logic clk_io_div4_peri;
  logic clk_io_div2_peri;
  logic clk_io_peri;
  logic clk_usb_peri;
  logic clk_main_peri;

  } clkmgr_out_t;

  typedef struct packed {
    logic [6-1:0] idle;
  } clk_hint_status_t;

  parameter clk_hint_status_t CLK_HINT_STATUS_DEFAULT = '{
    idle: {6{1'b1}}
  };


endpackage // clkmgr_pkg
