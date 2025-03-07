// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class pattgen_common_vseq extends pattgen_base_vseq;
  `uvm_object_utils(pattgen_common_vseq)

  constraint num_trans_c {
    num_trans inside {[1:2]};
  }
  `uvm_object_new

  virtual task body();
  endtask : body

endclass
