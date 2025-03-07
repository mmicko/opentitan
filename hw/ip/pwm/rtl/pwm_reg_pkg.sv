// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package pwm_reg_pkg;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////
  typedef struct packed {
    struct packed {
      logic [8:0]  q;
    } pwm_en;
    struct packed {
      logic        q;
    } cntr_en;
  } pwm_reg2hw_cfg_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_period_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_0_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_0_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_1_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_1_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_2_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_2_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_3_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_3_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_4_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_4_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_5_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_5_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_6_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_6_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_7_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_7_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_posedge_val_8_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_negedge_val_8_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } pwm_reg2hw_incr_reg_t;



  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////
  typedef struct packed {
    pwm_reg2hw_cfg_reg_t cfg; // [649:640]
    pwm_reg2hw_period_reg_t period; // [639:608]
    pwm_reg2hw_posedge_val_0_reg_t posedge_val_0; // [607:576]
    pwm_reg2hw_negedge_val_0_reg_t negedge_val_0; // [575:544]
    pwm_reg2hw_posedge_val_1_reg_t posedge_val_1; // [543:512]
    pwm_reg2hw_negedge_val_1_reg_t negedge_val_1; // [511:480]
    pwm_reg2hw_posedge_val_2_reg_t posedge_val_2; // [479:448]
    pwm_reg2hw_negedge_val_2_reg_t negedge_val_2; // [447:416]
    pwm_reg2hw_posedge_val_3_reg_t posedge_val_3; // [415:384]
    pwm_reg2hw_negedge_val_3_reg_t negedge_val_3; // [383:352]
    pwm_reg2hw_posedge_val_4_reg_t posedge_val_4; // [351:320]
    pwm_reg2hw_negedge_val_4_reg_t negedge_val_4; // [319:288]
    pwm_reg2hw_posedge_val_5_reg_t posedge_val_5; // [287:256]
    pwm_reg2hw_negedge_val_5_reg_t negedge_val_5; // [255:224]
    pwm_reg2hw_posedge_val_6_reg_t posedge_val_6; // [223:192]
    pwm_reg2hw_negedge_val_6_reg_t negedge_val_6; // [191:160]
    pwm_reg2hw_posedge_val_7_reg_t posedge_val_7; // [159:128]
    pwm_reg2hw_negedge_val_7_reg_t negedge_val_7; // [127:96]
    pwm_reg2hw_posedge_val_8_reg_t posedge_val_8; // [95:64]
    pwm_reg2hw_negedge_val_8_reg_t negedge_val_8; // [63:32]
    pwm_reg2hw_incr_reg_t incr; // [31:0]
  } pwm_reg2hw_t;

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////

  // Register Address
  parameter logic [6:0] PWM_CFG_OFFSET = 7'h 0;
  parameter logic [6:0] PWM_PERIOD_OFFSET = 7'h 4;
  parameter logic [6:0] PWM_POSEDGE_VAL_0_OFFSET = 7'h 8;
  parameter logic [6:0] PWM_NEGEDGE_VAL_0_OFFSET = 7'h c;
  parameter logic [6:0] PWM_POSEDGE_VAL_1_OFFSET = 7'h 10;
  parameter logic [6:0] PWM_NEGEDGE_VAL_1_OFFSET = 7'h 14;
  parameter logic [6:0] PWM_POSEDGE_VAL_2_OFFSET = 7'h 18;
  parameter logic [6:0] PWM_NEGEDGE_VAL_2_OFFSET = 7'h 1c;
  parameter logic [6:0] PWM_POSEDGE_VAL_3_OFFSET = 7'h 20;
  parameter logic [6:0] PWM_NEGEDGE_VAL_3_OFFSET = 7'h 24;
  parameter logic [6:0] PWM_POSEDGE_VAL_4_OFFSET = 7'h 28;
  parameter logic [6:0] PWM_NEGEDGE_VAL_4_OFFSET = 7'h 2c;
  parameter logic [6:0] PWM_POSEDGE_VAL_5_OFFSET = 7'h 30;
  parameter logic [6:0] PWM_NEGEDGE_VAL_5_OFFSET = 7'h 34;
  parameter logic [6:0] PWM_POSEDGE_VAL_6_OFFSET = 7'h 38;
  parameter logic [6:0] PWM_NEGEDGE_VAL_6_OFFSET = 7'h 3c;
  parameter logic [6:0] PWM_POSEDGE_VAL_7_OFFSET = 7'h 40;
  parameter logic [6:0] PWM_NEGEDGE_VAL_7_OFFSET = 7'h 44;
  parameter logic [6:0] PWM_POSEDGE_VAL_8_OFFSET = 7'h 48;
  parameter logic [6:0] PWM_NEGEDGE_VAL_8_OFFSET = 7'h 4c;
  parameter logic [6:0] PWM_INCR_OFFSET = 7'h 50;


  // Register Index
  typedef enum int {
    PWM_CFG,
    PWM_PERIOD,
    PWM_POSEDGE_VAL_0,
    PWM_NEGEDGE_VAL_0,
    PWM_POSEDGE_VAL_1,
    PWM_NEGEDGE_VAL_1,
    PWM_POSEDGE_VAL_2,
    PWM_NEGEDGE_VAL_2,
    PWM_POSEDGE_VAL_3,
    PWM_NEGEDGE_VAL_3,
    PWM_POSEDGE_VAL_4,
    PWM_NEGEDGE_VAL_4,
    PWM_POSEDGE_VAL_5,
    PWM_NEGEDGE_VAL_5,
    PWM_POSEDGE_VAL_6,
    PWM_NEGEDGE_VAL_6,
    PWM_POSEDGE_VAL_7,
    PWM_NEGEDGE_VAL_7,
    PWM_POSEDGE_VAL_8,
    PWM_NEGEDGE_VAL_8,
    PWM_INCR
  } pwm_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] PWM_PERMIT [21] = '{
    4'b 1111, // index[ 0] PWM_CFG
    4'b 1111, // index[ 1] PWM_PERIOD
    4'b 1111, // index[ 2] PWM_POSEDGE_VAL_0
    4'b 1111, // index[ 3] PWM_NEGEDGE_VAL_0
    4'b 1111, // index[ 4] PWM_POSEDGE_VAL_1
    4'b 1111, // index[ 5] PWM_NEGEDGE_VAL_1
    4'b 1111, // index[ 6] PWM_POSEDGE_VAL_2
    4'b 1111, // index[ 7] PWM_NEGEDGE_VAL_2
    4'b 1111, // index[ 8] PWM_POSEDGE_VAL_3
    4'b 1111, // index[ 9] PWM_NEGEDGE_VAL_3
    4'b 1111, // index[10] PWM_POSEDGE_VAL_4
    4'b 1111, // index[11] PWM_NEGEDGE_VAL_4
    4'b 1111, // index[12] PWM_POSEDGE_VAL_5
    4'b 1111, // index[13] PWM_NEGEDGE_VAL_5
    4'b 1111, // index[14] PWM_POSEDGE_VAL_6
    4'b 1111, // index[15] PWM_NEGEDGE_VAL_6
    4'b 1111, // index[16] PWM_POSEDGE_VAL_7
    4'b 1111, // index[17] PWM_NEGEDGE_VAL_7
    4'b 1111, // index[18] PWM_POSEDGE_VAL_8
    4'b 1111, // index[19] PWM_NEGEDGE_VAL_8
    4'b 1111  // index[20] PWM_INCR
  };
endpackage

