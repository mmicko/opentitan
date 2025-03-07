// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package otp_ctrl_reg_pkg;

  // Param list
  parameter int NumLcPartitionWords = 4;
  parameter int NumSecretPartitionWords = 32;
  parameter int NumHwCfgWords = 8;
  parameter int NumHwCfgReservedRegs = 6;
  parameter int NumSwCfgPartitionWords = 212;
  parameter int NumSwCfgWindowWords = 256;
  parameter int NumDebugWindowWords = 16;
  parameter int DIRECT_ACCESS_WDATA = 2;
  parameter int DIRECT_ACCESS_RDATA = 2;
  parameter int LC_STATE = 6;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////
  typedef struct packed {
    struct packed {
      logic        q;
    } otp_access_done;
    struct packed {
      logic        q;
    } otp_ctrl_err;
  } otp_ctrl_reg2hw_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } otp_access_done;
    struct packed {
      logic        q;
    } otp_ctrl_err;
  } otp_ctrl_reg2hw_intr_enable_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } otp_access_done;
    struct packed {
      logic        q;
      logic        qe;
    } otp_ctrl_err;
  } otp_ctrl_reg2hw_intr_test_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } read;
    struct packed {
      logic        q;
      logic        qe;
    } write;
  } otp_ctrl_reg2hw_direct_access_cmd_reg_t;

  typedef struct packed {
    logic [9:0] q;
  } otp_ctrl_reg2hw_direct_access_address_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } otp_ctrl_reg2hw_direct_access_size_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } otp_ctrl_reg2hw_direct_access_wdata_mreg_t;

  typedef struct packed {
    logic        q;
  } otp_ctrl_reg2hw_secret_integrity_digest_calc_reg_t;

  typedef struct packed {
    logic        q;
  } otp_ctrl_reg2hw_hw_cfg_integrity_digest_calc_reg_t;

  typedef struct packed {
    logic        q;
  } otp_ctrl_reg2hw_sw_cfg_integrity_digest_calc_reg_t;


  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } otp_access_done;
    struct packed {
      logic        d;
      logic        de;
    } otp_ctrl_err;
  } otp_ctrl_hw2reg_intr_state_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } otp_ctrl_hw2reg_status_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } otp_ctrl_hw2reg_err_code_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } otp_ctrl_hw2reg_direct_access_rdata_mreg_t;

  typedef struct packed {
    logic [31:0] d;
  } otp_ctrl_hw2reg_secret_integrity_digest_reg_t;

  typedef struct packed {
    logic [31:0] d;
  } otp_ctrl_hw2reg_hw_cfg_integrity_digest_reg_t;

  typedef struct packed {
    logic [31:0] d;
  } otp_ctrl_hw2reg_sw_cfg_integrity_digest_reg_t;

  typedef struct packed {
    logic [7:0]  d;
    logic        de;
  } otp_ctrl_hw2reg_lc_state_mreg_t;

  typedef struct packed {
    logic [7:0]  d;
    logic        de;
  } otp_ctrl_hw2reg_id_state_reg_t;

  typedef struct packed {
    struct packed {
      logic [7:0]  d;
      logic        de;
    } test_state_cnt;
    struct packed {
      logic [7:0]  d;
      logic        de;
    } test_unlock_cnt;
    struct packed {
      logic [7:0]  d;
      logic        de;
    } test_exit_cnt;
    struct packed {
      logic [7:0]  d;
      logic        de;
    } xxx_unlock_cnt;
  } otp_ctrl_hw2reg_test_xxx_cnt_reg_t;

  typedef struct packed {
    logic [15:0] d;
    logic        de;
  } otp_ctrl_hw2reg_transition_cnt_reg_t;

  typedef struct packed {
    struct packed {
      logic [2:0]  d;
    } test_tokens_lock;
    struct packed {
      logic [4:0]  d;
    } xxx_token_lock;
  } otp_ctrl_hw2reg_hw_cfg_lock_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } otp_ctrl_hw2reg_hw_cfg_mreg_t;


  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////
  typedef struct packed {
    otp_ctrl_reg2hw_intr_state_reg_t intr_state; // [92:91]
    otp_ctrl_reg2hw_intr_enable_reg_t intr_enable; // [90:89]
    otp_ctrl_reg2hw_intr_test_reg_t intr_test; // [88:85]
    otp_ctrl_reg2hw_direct_access_cmd_reg_t direct_access_cmd; // [84:81]
    otp_ctrl_reg2hw_direct_access_address_reg_t direct_access_address; // [80:71]
    otp_ctrl_reg2hw_direct_access_size_reg_t direct_access_size; // [70:69]
    otp_ctrl_reg2hw_direct_access_wdata_mreg_t [1:0] direct_access_wdata; // [68:3]
    otp_ctrl_reg2hw_secret_integrity_digest_calc_reg_t secret_integrity_digest_calc; // [2:2]
    otp_ctrl_reg2hw_hw_cfg_integrity_digest_calc_reg_t hw_cfg_integrity_digest_calc; // [1:1]
    otp_ctrl_reg2hw_sw_cfg_integrity_digest_calc_reg_t sw_cfg_integrity_digest_calc; // [0:0]
  } otp_ctrl_reg2hw_t;

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////
  typedef struct packed {
    otp_ctrl_hw2reg_intr_state_reg_t intr_state; // [553:552]
    otp_ctrl_hw2reg_status_reg_t status; // [551:552]
    otp_ctrl_hw2reg_err_code_reg_t err_code; // [551:552]
    otp_ctrl_hw2reg_direct_access_rdata_mreg_t [1:0] direct_access_rdata; // [551:486]
    otp_ctrl_hw2reg_secret_integrity_digest_reg_t secret_integrity_digest; // [485:486]
    otp_ctrl_hw2reg_hw_cfg_integrity_digest_reg_t hw_cfg_integrity_digest; // [485:486]
    otp_ctrl_hw2reg_sw_cfg_integrity_digest_reg_t sw_cfg_integrity_digest; // [485:486]
    otp_ctrl_hw2reg_lc_state_mreg_t [5:0] lc_state; // [485:432]
    otp_ctrl_hw2reg_id_state_reg_t id_state; // [431:432]
    otp_ctrl_hw2reg_test_xxx_cnt_reg_t test_xxx_cnt; // [431:432]
    otp_ctrl_hw2reg_transition_cnt_reg_t transition_cnt; // [431:432]
    otp_ctrl_hw2reg_hw_cfg_lock_reg_t hw_cfg_lock; // [431:432]
    otp_ctrl_hw2reg_hw_cfg_mreg_t [5:0] hw_cfg; // [431:234]
  } otp_ctrl_hw2reg_t;

  // Register Address
  parameter logic [11:0] OTP_CTRL_INTR_STATE_OFFSET = 12'h 0;
  parameter logic [11:0] OTP_CTRL_INTR_ENABLE_OFFSET = 12'h 4;
  parameter logic [11:0] OTP_CTRL_INTR_TEST_OFFSET = 12'h 8;
  parameter logic [11:0] OTP_CTRL_STATUS_OFFSET = 12'h c;
  parameter logic [11:0] OTP_CTRL_ERR_CODE_OFFSET = 12'h 10;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_CMD_OFFSET = 12'h 14;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_ADDRESS_OFFSET = 12'h 18;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_SIZE_OFFSET = 12'h 1c;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_WDATA0_OFFSET = 12'h 20;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_WDATA1_OFFSET = 12'h 24;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_RDATA0_OFFSET = 12'h 28;
  parameter logic [11:0] OTP_CTRL_DIRECT_ACCESS_RDATA1_OFFSET = 12'h 2c;
  parameter logic [11:0] OTP_CTRL_SECRET_INTEGRITY_DIGEST_CALC_OFFSET = 12'h 50;
  parameter logic [11:0] OTP_CTRL_HW_CFG_INTEGRITY_DIGEST_CALC_OFFSET = 12'h 54;
  parameter logic [11:0] OTP_CTRL_SW_CFG_INTEGRITY_DIGEST_CALC_OFFSET = 12'h 58;
  parameter logic [11:0] OTP_CTRL_SECRET_INTEGRITY_DIGEST_OFFSET = 12'h 5c;
  parameter logic [11:0] OTP_CTRL_HW_CFG_INTEGRITY_DIGEST_OFFSET = 12'h 60;
  parameter logic [11:0] OTP_CTRL_SW_CFG_INTEGRITY_DIGEST_OFFSET = 12'h 64;
  parameter logic [11:0] OTP_CTRL_LC_STATE0_OFFSET = 12'h 100;
  parameter logic [11:0] OTP_CTRL_LC_STATE1_OFFSET = 12'h 104;
  parameter logic [11:0] OTP_CTRL_ID_STATE_OFFSET = 12'h 108;
  parameter logic [11:0] OTP_CTRL_TEST_XXX_CNT_OFFSET = 12'h 10c;
  parameter logic [11:0] OTP_CTRL_TRANSITION_CNT_OFFSET = 12'h 110;
  parameter logic [11:0] OTP_CTRL_HW_CFG_LOCK_OFFSET = 12'h 200;
  parameter logic [11:0] OTP_CTRL_HW_CFG0_OFFSET = 12'h 204;
  parameter logic [11:0] OTP_CTRL_HW_CFG1_OFFSET = 12'h 208;
  parameter logic [11:0] OTP_CTRL_HW_CFG2_OFFSET = 12'h 20c;
  parameter logic [11:0] OTP_CTRL_HW_CFG3_OFFSET = 12'h 210;
  parameter logic [11:0] OTP_CTRL_HW_CFG4_OFFSET = 12'h 214;
  parameter logic [11:0] OTP_CTRL_HW_CFG5_OFFSET = 12'h 218;

  // Window parameter
  parameter logic [11:0] OTP_CTRL_SW_CFG_OFFSET = 12'h 400;
  parameter logic [11:0] OTP_CTRL_SW_CFG_SIZE   = 12'h 400;
  parameter logic [11:0] OTP_CTRL_TEST_ACCESS_OFFSET = 12'h 800;
  parameter logic [11:0] OTP_CTRL_TEST_ACCESS_SIZE   = 12'h 40;

  // Register Index
  typedef enum int {
    OTP_CTRL_INTR_STATE,
    OTP_CTRL_INTR_ENABLE,
    OTP_CTRL_INTR_TEST,
    OTP_CTRL_STATUS,
    OTP_CTRL_ERR_CODE,
    OTP_CTRL_DIRECT_ACCESS_CMD,
    OTP_CTRL_DIRECT_ACCESS_ADDRESS,
    OTP_CTRL_DIRECT_ACCESS_SIZE,
    OTP_CTRL_DIRECT_ACCESS_WDATA0,
    OTP_CTRL_DIRECT_ACCESS_WDATA1,
    OTP_CTRL_DIRECT_ACCESS_RDATA0,
    OTP_CTRL_DIRECT_ACCESS_RDATA1,
    OTP_CTRL_SECRET_INTEGRITY_DIGEST_CALC,
    OTP_CTRL_HW_CFG_INTEGRITY_DIGEST_CALC,
    OTP_CTRL_SW_CFG_INTEGRITY_DIGEST_CALC,
    OTP_CTRL_SECRET_INTEGRITY_DIGEST,
    OTP_CTRL_HW_CFG_INTEGRITY_DIGEST,
    OTP_CTRL_SW_CFG_INTEGRITY_DIGEST,
    OTP_CTRL_LC_STATE0,
    OTP_CTRL_LC_STATE1,
    OTP_CTRL_ID_STATE,
    OTP_CTRL_TEST_XXX_CNT,
    OTP_CTRL_TRANSITION_CNT,
    OTP_CTRL_HW_CFG_LOCK,
    OTP_CTRL_HW_CFG0,
    OTP_CTRL_HW_CFG1,
    OTP_CTRL_HW_CFG2,
    OTP_CTRL_HW_CFG3,
    OTP_CTRL_HW_CFG4,
    OTP_CTRL_HW_CFG5
  } otp_ctrl_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] OTP_CTRL_PERMIT [30] = '{
    4'b 0001, // index[ 0] OTP_CTRL_INTR_STATE
    4'b 0001, // index[ 1] OTP_CTRL_INTR_ENABLE
    4'b 0001, // index[ 2] OTP_CTRL_INTR_TEST
    4'b 1111, // index[ 3] OTP_CTRL_STATUS
    4'b 1111, // index[ 4] OTP_CTRL_ERR_CODE
    4'b 0001, // index[ 5] OTP_CTRL_DIRECT_ACCESS_CMD
    4'b 0011, // index[ 6] OTP_CTRL_DIRECT_ACCESS_ADDRESS
    4'b 0001, // index[ 7] OTP_CTRL_DIRECT_ACCESS_SIZE
    4'b 1111, // index[ 8] OTP_CTRL_DIRECT_ACCESS_WDATA0
    4'b 1111, // index[ 9] OTP_CTRL_DIRECT_ACCESS_WDATA1
    4'b 1111, // index[10] OTP_CTRL_DIRECT_ACCESS_RDATA0
    4'b 1111, // index[11] OTP_CTRL_DIRECT_ACCESS_RDATA1
    4'b 0001, // index[12] OTP_CTRL_SECRET_INTEGRITY_DIGEST_CALC
    4'b 0001, // index[13] OTP_CTRL_HW_CFG_INTEGRITY_DIGEST_CALC
    4'b 0001, // index[14] OTP_CTRL_SW_CFG_INTEGRITY_DIGEST_CALC
    4'b 1111, // index[15] OTP_CTRL_SECRET_INTEGRITY_DIGEST
    4'b 1111, // index[16] OTP_CTRL_HW_CFG_INTEGRITY_DIGEST
    4'b 1111, // index[17] OTP_CTRL_SW_CFG_INTEGRITY_DIGEST
    4'b 1111, // index[18] OTP_CTRL_LC_STATE0
    4'b 0011, // index[19] OTP_CTRL_LC_STATE1
    4'b 0001, // index[20] OTP_CTRL_ID_STATE
    4'b 1111, // index[21] OTP_CTRL_TEST_XXX_CNT
    4'b 0011, // index[22] OTP_CTRL_TRANSITION_CNT
    4'b 0001, // index[23] OTP_CTRL_HW_CFG_LOCK
    4'b 1111, // index[24] OTP_CTRL_HW_CFG0
    4'b 1111, // index[25] OTP_CTRL_HW_CFG1
    4'b 1111, // index[26] OTP_CTRL_HW_CFG2
    4'b 1111, // index[27] OTP_CTRL_HW_CFG3
    4'b 1111, // index[28] OTP_CTRL_HW_CFG4
    4'b 1111  // index[29] OTP_CTRL_HW_CFG5
  };
endpackage

