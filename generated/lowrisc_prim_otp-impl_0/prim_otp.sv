// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file is auto-generated.

`ifndef PRIM_DEFAULT_IMPL
  `define PRIM_DEFAULT_IMPL prim_pkg::ImplGeneric
`endif

module prim_otp
import prim_otp_pkg::*;
#(

  // Native OTP word size. This determines the size_i granule.
  parameter  int Width       = 16,
  parameter  int Depth       = 1024,
  // This determines the maximum number of native words that
  // can be transferred accross the interface in one cycle.
  parameter  int SizeWidth   = 2,
  // Width of the power sequencing signal.
  parameter  int PwrSeqWidth = 2,
  // Number of Test TL-UL words
  parameter  int TlDepth     = 16,
  // Derived parameters
  localparam int AddrWidth   = prim_util_pkg::vbits(Depth),
  localparam int IfWidth     = 2**SizeWidth*Width,
  // VMEM file to initialize the memory with
  parameter      MemInitFile = ""

) (
  input                          clk_i,
  input                          rst_ni,
  // Macro-specific power sequencing signals to/from AST
  output logic [PwrSeqWidth-1:0] pwr_seq_o,
  input        [PwrSeqWidth-1:0] pwr_seq_h_i,
  // Test interface
  input  tlul_pkg::tl_h2d_t      test_tl_i,
  output tlul_pkg::tl_d2h_t      test_tl_o,
  // Ready valid handshake for read/write command
  output logic                   ready_o,
  input                          valid_i,
  input [SizeWidth-1:0]          size_i, // #(Native words)-1, e.g. size == 0 for 1 native word.
  input  cmd_e                   cmd_i,  // 00: read command, 01: write command, 11: init command
  input [AddrWidth-1:0]          addr_i,
  input [IfWidth-1:0]            wdata_i,
  // Response channel
  output logic                   valid_o,
  output logic [IfWidth-1:0]     rdata_o,
  output err_e                   err_o
);
  parameter prim_pkg::impl_e Impl = `PRIM_DEFAULT_IMPL;

 if (1) begin : gen_generic
prim_generic_otp #(
.TlDepth(TlDepth), .Width(Width), .Depth(Depth), .MemInitFile(MemInitFile), .SizeWidth(SizeWidth), .PwrSeqWidth(PwrSeqWidth)) u_impl_generic (
  .*
);

end

endmodule
