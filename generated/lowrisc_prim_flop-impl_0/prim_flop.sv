// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file is auto-generated.

`ifndef PRIM_DEFAULT_IMPL
  `define PRIM_DEFAULT_IMPL prim_pkg::ImplGeneric
`endif

module prim_flop

#(

  parameter int Width      = 1,
  localparam int WidthSubOne = Width-1,
  parameter logic [WidthSubOne:0] ResetValue = 0

) (
  input clk_i,
  input rst_ni,
  input [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);
  parameter prim_pkg::impl_e Impl = `PRIM_DEFAULT_IMPL;

 if (1) begin : gen_generic
prim_generic_flop #(
.ResetValue(ResetValue), .Width(Width)) u_impl_generic (
  .*
);

end

endmodule
