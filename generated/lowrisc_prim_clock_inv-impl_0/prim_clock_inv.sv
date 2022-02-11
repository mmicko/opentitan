// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file is auto-generated.

`ifndef PRIM_DEFAULT_IMPL
  `define PRIM_DEFAULT_IMPL prim_pkg::ImplGeneric
`endif

module prim_clock_inv

#(

  parameter bit HasScanMode = 1'b1

) (
  input        clk_i,
  input        scanmode_i,
  output logic clk_no      // Inverted
);
  parameter prim_pkg::impl_e Impl = `PRIM_DEFAULT_IMPL;

 if (1) begin : gen_generic
prim_generic_clock_inv #(
.HasScanMode(HasScanMode)) u_impl_generic (
  .*
);

end

endmodule
