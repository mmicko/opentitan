// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class pattgen_base_test extends dv_base_test #(
    .CFG_T(pattgen_env_cfg),
    .ENV_T(pattgen_env)
  );

  `uvm_component_utils(pattgen_base_test)
  `uvm_component_new

  // the base class dv_base_test creates the following instances:
  // pattgen_env_cfg: cfg
  // pattgen_env:     env

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg.has_ral = 1'b0;
  endfunction

  // the base class also looks up UVM_TEST_SEQ plusarg to create and run that seq in
  // the run_phase; as such, nothing more needs to be done

endclass : pattgen_base_test

