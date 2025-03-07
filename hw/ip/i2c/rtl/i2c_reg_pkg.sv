// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package i2c_reg_pkg;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////
  typedef struct packed {
    struct packed {
      logic        q;
    } fmt_watermark;
    struct packed {
      logic        q;
    } rx_watermark;
    struct packed {
      logic        q;
    } fmt_overflow;
    struct packed {
      logic        q;
    } rx_overflow;
    struct packed {
      logic        q;
    } nak;
    struct packed {
      logic        q;
    } scl_interference;
    struct packed {
      logic        q;
    } sda_interference;
    struct packed {
      logic        q;
    } stretch_timeout;
    struct packed {
      logic        q;
    } sda_unstable;
  } i2c_reg2hw_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } fmt_watermark;
    struct packed {
      logic        q;
    } rx_watermark;
    struct packed {
      logic        q;
    } fmt_overflow;
    struct packed {
      logic        q;
    } rx_overflow;
    struct packed {
      logic        q;
    } nak;
    struct packed {
      logic        q;
    } scl_interference;
    struct packed {
      logic        q;
    } sda_interference;
    struct packed {
      logic        q;
    } stretch_timeout;
    struct packed {
      logic        q;
    } sda_unstable;
  } i2c_reg2hw_intr_enable_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } fmt_watermark;
    struct packed {
      logic        q;
      logic        qe;
    } rx_watermark;
    struct packed {
      logic        q;
      logic        qe;
    } fmt_overflow;
    struct packed {
      logic        q;
      logic        qe;
    } rx_overflow;
    struct packed {
      logic        q;
      logic        qe;
    } nak;
    struct packed {
      logic        q;
      logic        qe;
    } scl_interference;
    struct packed {
      logic        q;
      logic        qe;
    } sda_interference;
    struct packed {
      logic        q;
      logic        qe;
    } stretch_timeout;
    struct packed {
      logic        q;
      logic        qe;
    } sda_unstable;
  } i2c_reg2hw_intr_test_reg_t;

  typedef struct packed {
    logic        q;
  } i2c_reg2hw_ctrl_reg_t;

  typedef struct packed {
    logic [7:0]  q;
    logic        re;
  } i2c_reg2hw_rdata_reg_t;

  typedef struct packed {
    struct packed {
      logic [7:0]  q;
      logic        qe;
    } fbyte;
    struct packed {
      logic        q;
      logic        qe;
    } start;
    struct packed {
      logic        q;
      logic        qe;
    } stop;
    struct packed {
      logic        q;
      logic        qe;
    } read;
    struct packed {
      logic        q;
      logic        qe;
    } rcont;
    struct packed {
      logic        q;
      logic        qe;
    } nakok;
  } i2c_reg2hw_fdata_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } rxrst;
    struct packed {
      logic        q;
      logic        qe;
    } fmtrst;
    struct packed {
      logic [2:0]  q;
      logic        qe;
    } rxilvl;
    struct packed {
      logic [1:0]  q;
      logic        qe;
    } fmtilvl;
  } i2c_reg2hw_fifo_ctrl_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } txovrden;
    struct packed {
      logic        q;
    } sclval;
    struct packed {
      logic        q;
    } sdaval;
  } i2c_reg2hw_ovrd_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } thigh;
    struct packed {
      logic [15:0] q;
    } tlow;
  } i2c_reg2hw_timing0_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } t_r;
    struct packed {
      logic [15:0] q;
    } t_f;
  } i2c_reg2hw_timing1_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } tsu_sta;
    struct packed {
      logic [15:0] q;
    } thd_sta;
  } i2c_reg2hw_timing2_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } tsu_dat;
    struct packed {
      logic [15:0] q;
    } thd_dat;
  } i2c_reg2hw_timing3_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } tsu_sto;
    struct packed {
      logic [15:0] q;
    } t_buf;
  } i2c_reg2hw_timing4_reg_t;

  typedef struct packed {
    struct packed {
      logic [30:0] q;
    } val;
    struct packed {
      logic        q;
    } en;
  } i2c_reg2hw_timeout_ctrl_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } i2c_reg2hw_dummy_reg_t;


  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } fmt_watermark;
    struct packed {
      logic        d;
      logic        de;
    } rx_watermark;
    struct packed {
      logic        d;
      logic        de;
    } fmt_overflow;
    struct packed {
      logic        d;
      logic        de;
    } rx_overflow;
    struct packed {
      logic        d;
      logic        de;
    } nak;
    struct packed {
      logic        d;
      logic        de;
    } scl_interference;
    struct packed {
      logic        d;
      logic        de;
    } sda_interference;
    struct packed {
      logic        d;
      logic        de;
    } stretch_timeout;
    struct packed {
      logic        d;
      logic        de;
    } sda_unstable;
  } i2c_hw2reg_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
    } fmtfull;
    struct packed {
      logic        d;
    } rxfull;
    struct packed {
      logic        d;
    } fmtempty;
    struct packed {
      logic        d;
    } hostidle;
    struct packed {
      logic        d;
    } targetidle;
    struct packed {
      logic        d;
    } rxempty;
  } i2c_hw2reg_status_reg_t;

  typedef struct packed {
    logic [7:0]  d;
  } i2c_hw2reg_rdata_reg_t;

  typedef struct packed {
    struct packed {
      logic [5:0]  d;
    } fmtlvl;
    struct packed {
      logic [5:0]  d;
    } rxlvl;
  } i2c_hw2reg_fifo_status_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] d;
    } scl_rx;
    struct packed {
      logic [15:0] d;
    } sda_rx;
  } i2c_hw2reg_val_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } i2c_hw2reg_dummy_reg_t;


  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////
  typedef struct packed {
    i2c_reg2hw_intr_state_reg_t intr_state; // [303:295]
    i2c_reg2hw_intr_enable_reg_t intr_enable; // [294:286]
    i2c_reg2hw_intr_test_reg_t intr_test; // [285:268]
    i2c_reg2hw_ctrl_reg_t ctrl; // [267:267]
    i2c_reg2hw_rdata_reg_t rdata; // [266:258]
    i2c_reg2hw_fdata_reg_t fdata; // [257:239]
    i2c_reg2hw_fifo_ctrl_reg_t fifo_ctrl; // [238:228]
    i2c_reg2hw_ovrd_reg_t ovrd; // [227:225]
    i2c_reg2hw_timing0_reg_t timing0; // [224:193]
    i2c_reg2hw_timing1_reg_t timing1; // [192:161]
    i2c_reg2hw_timing2_reg_t timing2; // [160:129]
    i2c_reg2hw_timing3_reg_t timing3; // [128:97]
    i2c_reg2hw_timing4_reg_t timing4; // [96:65]
    i2c_reg2hw_timeout_ctrl_reg_t timeout_ctrl; // [64:33]
    i2c_reg2hw_dummy_reg_t dummy; // [32:0]
  } i2c_reg2hw_t;

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////
  typedef struct packed {
    i2c_hw2reg_intr_state_reg_t intr_state; // [108:100]
    i2c_hw2reg_status_reg_t status; // [99:100]
    i2c_hw2reg_rdata_reg_t rdata; // [99:91]
    i2c_hw2reg_fifo_status_reg_t fifo_status; // [90:91]
    i2c_hw2reg_val_reg_t val; // [90:91]
    i2c_hw2reg_dummy_reg_t dummy; // [90:58]
  } i2c_hw2reg_t;

  // Register Address
  parameter logic [6:0] I2C_INTR_STATE_OFFSET = 7'h 0;
  parameter logic [6:0] I2C_INTR_ENABLE_OFFSET = 7'h 4;
  parameter logic [6:0] I2C_INTR_TEST_OFFSET = 7'h 8;
  parameter logic [6:0] I2C_CTRL_OFFSET = 7'h c;
  parameter logic [6:0] I2C_STATUS_OFFSET = 7'h 10;
  parameter logic [6:0] I2C_RDATA_OFFSET = 7'h 14;
  parameter logic [6:0] I2C_FDATA_OFFSET = 7'h 18;
  parameter logic [6:0] I2C_FIFO_CTRL_OFFSET = 7'h 1c;
  parameter logic [6:0] I2C_FIFO_STATUS_OFFSET = 7'h 20;
  parameter logic [6:0] I2C_OVRD_OFFSET = 7'h 24;
  parameter logic [6:0] I2C_VAL_OFFSET = 7'h 28;
  parameter logic [6:0] I2C_TIMING0_OFFSET = 7'h 2c;
  parameter logic [6:0] I2C_TIMING1_OFFSET = 7'h 30;
  parameter logic [6:0] I2C_TIMING2_OFFSET = 7'h 34;
  parameter logic [6:0] I2C_TIMING3_OFFSET = 7'h 38;
  parameter logic [6:0] I2C_TIMING4_OFFSET = 7'h 3c;
  parameter logic [6:0] I2C_TIMEOUT_CTRL_OFFSET = 7'h 40;
  parameter logic [6:0] I2C_DUMMY_OFFSET = 7'h 44;


  // Register Index
  typedef enum int {
    I2C_INTR_STATE,
    I2C_INTR_ENABLE,
    I2C_INTR_TEST,
    I2C_CTRL,
    I2C_STATUS,
    I2C_RDATA,
    I2C_FDATA,
    I2C_FIFO_CTRL,
    I2C_FIFO_STATUS,
    I2C_OVRD,
    I2C_VAL,
    I2C_TIMING0,
    I2C_TIMING1,
    I2C_TIMING2,
    I2C_TIMING3,
    I2C_TIMING4,
    I2C_TIMEOUT_CTRL,
    I2C_DUMMY
  } i2c_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] I2C_PERMIT [18] = '{
    4'b 0011, // index[ 0] I2C_INTR_STATE
    4'b 0011, // index[ 1] I2C_INTR_ENABLE
    4'b 0011, // index[ 2] I2C_INTR_TEST
    4'b 0001, // index[ 3] I2C_CTRL
    4'b 0001, // index[ 4] I2C_STATUS
    4'b 0001, // index[ 5] I2C_RDATA
    4'b 0011, // index[ 6] I2C_FDATA
    4'b 0001, // index[ 7] I2C_FIFO_CTRL
    4'b 0111, // index[ 8] I2C_FIFO_STATUS
    4'b 0001, // index[ 9] I2C_OVRD
    4'b 1111, // index[10] I2C_VAL
    4'b 1111, // index[11] I2C_TIMING0
    4'b 1111, // index[12] I2C_TIMING1
    4'b 1111, // index[13] I2C_TIMING2
    4'b 1111, // index[14] I2C_TIMING3
    4'b 1111, // index[15] I2C_TIMING4
    4'b 1111, // index[16] I2C_TIMEOUT_CTRL
    4'b 1111  // index[17] I2C_DUMMY
  };
endpackage

