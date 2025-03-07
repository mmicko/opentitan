// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package flash_ctrl_reg_pkg;

  // Param list
  parameter int NBanks = 2;
  parameter int NumRegions = 8;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////
  typedef struct packed {
    struct packed {
      logic        q;
    } prog_empty;
    struct packed {
      logic        q;
    } prog_lvl;
    struct packed {
      logic        q;
    } rd_full;
    struct packed {
      logic        q;
    } rd_lvl;
    struct packed {
      logic        q;
    } op_done;
    struct packed {
      logic        q;
    } op_error;
  } flash_ctrl_reg2hw_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } prog_empty;
    struct packed {
      logic        q;
    } prog_lvl;
    struct packed {
      logic        q;
    } rd_full;
    struct packed {
      logic        q;
    } rd_lvl;
    struct packed {
      logic        q;
    } op_done;
    struct packed {
      logic        q;
    } op_error;
  } flash_ctrl_reg2hw_intr_enable_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } prog_empty;
    struct packed {
      logic        q;
      logic        qe;
    } prog_lvl;
    struct packed {
      logic        q;
      logic        qe;
    } rd_full;
    struct packed {
      logic        q;
      logic        qe;
    } rd_lvl;
    struct packed {
      logic        q;
      logic        qe;
    } op_done;
    struct packed {
      logic        q;
      logic        qe;
    } op_error;
  } flash_ctrl_reg2hw_intr_test_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } start;
    struct packed {
      logic [1:0]  q;
    } op;
    struct packed {
      logic        q;
    } erase_sel;
    struct packed {
      logic        q;
    } partition_sel;
    struct packed {
      logic [11:0] q;
    } num;
  } flash_ctrl_reg2hw_control_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } flash_ctrl_reg2hw_addr_reg_t;

  typedef struct packed {
    logic        q;
  } flash_ctrl_reg2hw_scramble_en_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } en;
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic [8:0]  q;
    } base;
    struct packed {
      logic [8:0]  q;
    } size;
    struct packed {
      logic        q;
    } partition;
  } flash_ctrl_reg2hw_mp_region_cfg_mreg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
  } flash_ctrl_reg2hw_default_region_reg_t;

  typedef struct packed {
    logic        q;
  } flash_ctrl_reg2hw_mp_bank_cfg_mreg_t;

  typedef struct packed {
    logic [31:0] q;
  } flash_ctrl_reg2hw_scratch_reg_t;

  typedef struct packed {
    struct packed {
      logic [4:0]  q;
    } prog;
    struct packed {
      logic [4:0]  q;
    } rd;
  } flash_ctrl_reg2hw_fifo_lvl_reg_t;

  typedef struct packed {
    logic        q;
  } flash_ctrl_reg2hw_fifo_rst_reg_t;


  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } prog_empty;
    struct packed {
      logic        d;
      logic        de;
    } prog_lvl;
    struct packed {
      logic        d;
      logic        de;
    } rd_full;
    struct packed {
      logic        d;
      logic        de;
    } rd_lvl;
    struct packed {
      logic        d;
      logic        de;
    } op_done;
    struct packed {
      logic        d;
      logic        de;
    } op_error;
  } flash_ctrl_hw2reg_intr_state_reg_t;

  typedef struct packed {
    logic        d;
  } flash_ctrl_hw2reg_ctrl_regwen_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } start;
  } flash_ctrl_hw2reg_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } done;
    struct packed {
      logic        d;
      logic        de;
    } err;
  } flash_ctrl_hw2reg_op_status_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
    } rd_full;
    struct packed {
      logic        d;
    } rd_empty;
    struct packed {
      logic        d;
    } prog_full;
    struct packed {
      logic        d;
    } prog_empty;
    struct packed {
      logic        d;
    } init_wip;
    struct packed {
      logic [8:0]  d;
    } error_page;
    struct packed {
      logic        d;
    } error_bank;
  } flash_ctrl_hw2reg_status_reg_t;


  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////
  typedef struct packed {
    flash_ctrl_reg2hw_intr_state_reg_t intr_state; // [305:300]
    flash_ctrl_reg2hw_intr_enable_reg_t intr_enable; // [299:294]
    flash_ctrl_reg2hw_intr_test_reg_t intr_test; // [293:282]
    flash_ctrl_reg2hw_control_reg_t control; // [281:265]
    flash_ctrl_reg2hw_addr_reg_t addr; // [264:233]
    flash_ctrl_reg2hw_scramble_en_reg_t scramble_en; // [232:232]
    flash_ctrl_reg2hw_mp_region_cfg_mreg_t [7:0] mp_region_cfg; // [231:48]
    flash_ctrl_reg2hw_default_region_reg_t default_region; // [47:45]
    flash_ctrl_reg2hw_mp_bank_cfg_mreg_t [1:0] mp_bank_cfg; // [44:43]
    flash_ctrl_reg2hw_scratch_reg_t scratch; // [42:11]
    flash_ctrl_reg2hw_fifo_lvl_reg_t fifo_lvl; // [10:1]
    flash_ctrl_reg2hw_fifo_rst_reg_t fifo_rst; // [0:0]
  } flash_ctrl_reg2hw_t;

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////
  typedef struct packed {
    flash_ctrl_hw2reg_intr_state_reg_t intr_state; // [33:28]
    flash_ctrl_hw2reg_ctrl_regwen_reg_t ctrl_regwen; // [27:28]
    flash_ctrl_hw2reg_control_reg_t control; // [27:11]
    flash_ctrl_hw2reg_op_status_reg_t op_status; // [10:11]
    flash_ctrl_hw2reg_status_reg_t status; // [10:11]
  } flash_ctrl_hw2reg_t;

  // Register Address
  parameter logic [6:0] FLASH_CTRL_INTR_STATE_OFFSET = 7'h 0;
  parameter logic [6:0] FLASH_CTRL_INTR_ENABLE_OFFSET = 7'h 4;
  parameter logic [6:0] FLASH_CTRL_INTR_TEST_OFFSET = 7'h 8;
  parameter logic [6:0] FLASH_CTRL_CTRL_REGWEN_OFFSET = 7'h c;
  parameter logic [6:0] FLASH_CTRL_CONTROL_OFFSET = 7'h 10;
  parameter logic [6:0] FLASH_CTRL_ADDR_OFFSET = 7'h 14;
  parameter logic [6:0] FLASH_CTRL_SCRAMBLE_EN_OFFSET = 7'h 18;
  parameter logic [6:0] FLASH_CTRL_REGION_CFG_REGWEN_OFFSET = 7'h 1c;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG0_OFFSET = 7'h 20;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG1_OFFSET = 7'h 24;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG2_OFFSET = 7'h 28;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG3_OFFSET = 7'h 2c;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG4_OFFSET = 7'h 30;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG5_OFFSET = 7'h 34;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG6_OFFSET = 7'h 38;
  parameter logic [6:0] FLASH_CTRL_MP_REGION_CFG7_OFFSET = 7'h 3c;
  parameter logic [6:0] FLASH_CTRL_DEFAULT_REGION_OFFSET = 7'h 40;
  parameter logic [6:0] FLASH_CTRL_BANK_CFG_REGWEN_OFFSET = 7'h 44;
  parameter logic [6:0] FLASH_CTRL_MP_BANK_CFG_OFFSET = 7'h 48;
  parameter logic [6:0] FLASH_CTRL_OP_STATUS_OFFSET = 7'h 4c;
  parameter logic [6:0] FLASH_CTRL_STATUS_OFFSET = 7'h 50;
  parameter logic [6:0] FLASH_CTRL_SCRATCH_OFFSET = 7'h 54;
  parameter logic [6:0] FLASH_CTRL_FIFO_LVL_OFFSET = 7'h 58;
  parameter logic [6:0] FLASH_CTRL_FIFO_RST_OFFSET = 7'h 5c;

  // Window parameter
  parameter logic [6:0] FLASH_CTRL_PROG_FIFO_OFFSET = 7'h 60;
  parameter logic [6:0] FLASH_CTRL_PROG_FIFO_SIZE   = 7'h 4;
  parameter logic [6:0] FLASH_CTRL_RD_FIFO_OFFSET = 7'h 64;
  parameter logic [6:0] FLASH_CTRL_RD_FIFO_SIZE   = 7'h 4;

  // Register Index
  typedef enum int {
    FLASH_CTRL_INTR_STATE,
    FLASH_CTRL_INTR_ENABLE,
    FLASH_CTRL_INTR_TEST,
    FLASH_CTRL_CTRL_REGWEN,
    FLASH_CTRL_CONTROL,
    FLASH_CTRL_ADDR,
    FLASH_CTRL_SCRAMBLE_EN,
    FLASH_CTRL_REGION_CFG_REGWEN,
    FLASH_CTRL_MP_REGION_CFG0,
    FLASH_CTRL_MP_REGION_CFG1,
    FLASH_CTRL_MP_REGION_CFG2,
    FLASH_CTRL_MP_REGION_CFG3,
    FLASH_CTRL_MP_REGION_CFG4,
    FLASH_CTRL_MP_REGION_CFG5,
    FLASH_CTRL_MP_REGION_CFG6,
    FLASH_CTRL_MP_REGION_CFG7,
    FLASH_CTRL_DEFAULT_REGION,
    FLASH_CTRL_BANK_CFG_REGWEN,
    FLASH_CTRL_MP_BANK_CFG,
    FLASH_CTRL_OP_STATUS,
    FLASH_CTRL_STATUS,
    FLASH_CTRL_SCRATCH,
    FLASH_CTRL_FIFO_LVL,
    FLASH_CTRL_FIFO_RST
  } flash_ctrl_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] FLASH_CTRL_PERMIT [24] = '{
    4'b 0001, // index[ 0] FLASH_CTRL_INTR_STATE
    4'b 0001, // index[ 1] FLASH_CTRL_INTR_ENABLE
    4'b 0001, // index[ 2] FLASH_CTRL_INTR_TEST
    4'b 0001, // index[ 3] FLASH_CTRL_CTRL_REGWEN
    4'b 1111, // index[ 4] FLASH_CTRL_CONTROL
    4'b 1111, // index[ 5] FLASH_CTRL_ADDR
    4'b 0001, // index[ 6] FLASH_CTRL_SCRAMBLE_EN
    4'b 0001, // index[ 7] FLASH_CTRL_REGION_CFG_REGWEN
    4'b 1111, // index[ 8] FLASH_CTRL_MP_REGION_CFG0
    4'b 1111, // index[ 9] FLASH_CTRL_MP_REGION_CFG1
    4'b 1111, // index[10] FLASH_CTRL_MP_REGION_CFG2
    4'b 1111, // index[11] FLASH_CTRL_MP_REGION_CFG3
    4'b 1111, // index[12] FLASH_CTRL_MP_REGION_CFG4
    4'b 1111, // index[13] FLASH_CTRL_MP_REGION_CFG5
    4'b 1111, // index[14] FLASH_CTRL_MP_REGION_CFG6
    4'b 1111, // index[15] FLASH_CTRL_MP_REGION_CFG7
    4'b 0001, // index[16] FLASH_CTRL_DEFAULT_REGION
    4'b 0001, // index[17] FLASH_CTRL_BANK_CFG_REGWEN
    4'b 0001, // index[18] FLASH_CTRL_MP_BANK_CFG
    4'b 0001, // index[19] FLASH_CTRL_OP_STATUS
    4'b 0111, // index[20] FLASH_CTRL_STATUS
    4'b 1111, // index[21] FLASH_CTRL_SCRATCH
    4'b 0011, // index[22] FLASH_CTRL_FIFO_LVL
    4'b 0001  // index[23] FLASH_CTRL_FIFO_RST
  };
endpackage

