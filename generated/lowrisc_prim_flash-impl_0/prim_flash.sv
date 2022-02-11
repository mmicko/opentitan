// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file is auto-generated.

`ifndef PRIM_DEFAULT_IMPL
  `define PRIM_DEFAULT_IMPL prim_pkg::ImplGeneric
`endif

module prim_flash

#(

  parameter int InfosPerBank = 1,   // info pages per bank
  parameter int PagesPerBank = 256, // data pages per bank
  parameter int WordsPerPage = 256, // words per page
  parameter int DataWidth   = 32,   // bits per word
  parameter int MetaDataWidth = 12, // this is a temporary parameter to work around ECC issues
  parameter bit SkipInit = 1,       // this is an option to reset flash to all F's at reset

  //Do not touch - Derived parameters
  localparam int PageW = $clog2(PagesPerBank),
  localparam int WordW = $clog2(WordsPerPage),
  localparam int AddrW = PageW + WordW

) (
  input                              clk_i,
  input                              rst_ni,
  input                              rd_i,
  input                              prog_i,
  // the generic model does not make use of program types
  input flash_ctrl_pkg::flash_prog_e prog_type_i,
  input                              pg_erase_i,
  input                              bk_erase_i,
  input [AddrW-1:0]                  addr_i,
  input flash_ctrl_pkg::flash_part_e part_i,
  input [DataWidth-1:0]              prog_data_i,
  output logic [flash_ctrl_pkg::ProgTypes-1:0] prog_type_avail_o,
  output logic                       ack_o,
  output logic [DataWidth-1:0]       rd_data_o,
  output logic                       init_busy_o,

  input                              tck_i,
  input                              tdi_i,
  input                              tms_i,
  output logic                       tdo_o,
  input                              scanmode_i,
  input                              scan_reset_ni,
  input                              flash_power_ready_hi,
  input                              flash_power_down_hi,
  inout [3:0]                        flash_test_mode_ai,
  inout                              flash_test_voltage_hi
);
  parameter prim_pkg::impl_e Impl = `PRIM_DEFAULT_IMPL;

 if (1) begin : gen_generic
prim_generic_flash #(
.DataWidth(DataWidth), .WordsPerPage(WordsPerPage), .InfosPerBank(InfosPerBank), .PagesPerBank(PagesPerBank), .MetaDataWidth(MetaDataWidth), .SkipInit(SkipInit)) u_impl_generic (
  .*
);

end

endmodule
