// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
# PINMUX register template
#
# Parameter (given by Python tool)
#  - n_mio_periph_in:     Number of muxed peripheral inputs
#  - n_mio_periph_out:    Number of muxed peripheral outputs
#  - n_mio_pads:          Number of muxed IO pads
#  - n_dio_periph_in:     Number of dedicated peripheral inputs
#  - n_dio_periph_out:    Number of dedicated peripheral outputs
#  - n_dio_pads:          Number of dedicated IO pads
#  - n_wkup_detect:       Number of wakeup condition detectors
#  - wkup_cnt_width:      Width of wakeup counters
# <% import math %>
{
  name: "PINMUX",
  clock_primary: "clk_i",
  reset_primary: "rst_ni",
  other_clock_list: [
    "clk_aon_i",
  ],
  other_reset_list:
  [
    "rst_aon_ni"
  ],
  bus_device: "tlul",
  regwidth: "32",

  wakeup_list: [
    { name: "aon_wkup_req",
      desc: "pin wake request"
    }
  ],

  inter_signal_list: [
    // Define lc <-> pinmux signal for strap sampling
    { struct:  "lc_strap",
      type:    "req_rsp",
      name:    "lc_pinmux_strap",
      act:     "rsp",
      package: "pinmux_pkg",
      default: "'0"
    }
    // Testmode signals to AST
    { struct:  "dft_strap_test",
      type:    "uni",
      name:    "dft_strap_test",
      act:     "req",
      package: "pinmux_pkg",
      default: "'0"
    }
    // IO POK signal from AST
    { struct:  "ast_status",
      type:    "uni",
      name:    "io_pok",
      act:     "rcv",
      package: "ast_wrapper_pkg",
    }
    // Define pwr mgr <-> pinmux signals
    { struct:  "logic",
      type:    "uni",
      name:    "sleep_en",
      act:     "rcv",
      package: "",
      default: "1'b0"
    },
    { struct:  "logic",
      type:    "uni",
      name:    "aon_wkup_req",
      act:     "req",
      package: "",
      default: "1'b0"
    },
  ]

  param_list: [
    { name: "NMioPeriphIn",
      desc: "Number of muxed peripheral inputs",
      type: "int",
      default: "${n_mio_periph_in}",
      local: "true"
    },
    { name: "NMioPeriphOut",
      desc: "Number of muxed peripheral outputs",
      type: "int",
      default: "${n_mio_periph_out}",
      local: "true"
    },
    { name: "NMioPads",
      desc: "Number of muxed IO pads",
      type: "int",
      default: "${n_mio_pads}",
      local: "true"
    },
    { name: "NDioPads",
      desc: "Number of dedicated IO pads",
      type: "int",
      default: "${n_dio_pads}",
      local: "true"
    },
    { name: "NWkupDetect",
      desc: "Number of wakeup detectors",
      type: "int",
      default: "${n_wkup_detect}",
      local: "true"
    },
    { name: "WkupCntWidth",
      desc: "Number of wakeup counter bits",
      type: "int",
      default: "${wkup_cnt_width}",
      local: "true"
    },
    // TODO: Enable these once supported by topgen and the C header generation script.
    // These parameters are currently located in pinmux_pkg.sv
    // // If a bit is set to 1 in this vector, this MIO activates low power
    // // behavior when going to sleep.
    // { name: "MioPeriphHasSleepMode",
    //   desc: '''
    //         Indicates whether a MIO channel activates low power behavior
    //         when going to sleep.
    //         '''
    //   type: "logic [NMioPeriphOut-1:0]",
    //   // TODO: need to generate this via topgen
    //   default: "'1",
    //   local: "true"
    // },
    // // If a bit is set to 1 in this vector, this DIO activates low power
    // // behavior when going to sleep.
    // { name: "DioPeriphHasSleepMode",
    //   desc: '''
    //         Indicates whether a DIO channel activates low power behavior
    //         when going to sleep.
    //         ''',
    //   type: "logic [NDioPads-1:0]",
    //   // TODO: need to generate this via topgen
    //   default: "'1",
    //   local: "true"
    // },
    // // If a bit is set to 1 in this vector, wakeup detectors are connected
    // // to this DIO.
    // { name: "DioPeriphHasWkup",
    //   desc: "Indicates which DIOs shall be connected to the WakeupDetectors.",
    //   type: "logic [NDioPads-1:0]",
    //   // TODO: need to generate this via topgen
    //   default: "'1",
    //   local: "true"
    // },
  ],
  registers: [
    // TODO(#1412): this register enable signal should be split into multiregs such that
    // each pin / peripheral select can be locked down individually. this needs support
    // for compact, nested multireg enable registers in our regtool.
    { name: "REGEN",
      desc: '''
            Register write enable for all control registers.
            ''',
      swaccess: "rw0c",
      hwaccess: "none",
      fields: [
        {
            bits:   "0",
            name: "wen",
            desc: ''' When true, all configuration registers can be modified.
            When false, they become read-only. Defaults true, write zero to clear.
            '''
            resval: 1,
        },
      ]
    },
# inputs
    { multireg: { name:     "PERIPH_INSEL", // TODO: update this name to MIO_PERIPH_INSEL
                  desc:     "Mux select for peripheral inputs.",
                  count:    "NMioPeriphIn",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "IN",
                  fields: [
                    { bits: "${(n_mio_pads+1).bit_length()-1}:0",
                      name: "IN",
                      desc: '''
                      0: tie constantly to zero, 1: tie constantly to 1,
                      >=2: MIO pads (i.e., add 2 to the native MIO pad index).
                      '''
                      resval: 0,
                    }
                  ]
                }
    },
# outputs
    { multireg: { name:     "MIO_OUTSEL",
                  desc:     "Mux select for MIO outputs.",
                  count:    "NMioPads",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "OUT",
                  fields: [
                    { bits: "${(n_mio_periph_out+2).bit_length()-1}:0",
                      name: "OUT",
                      desc: '''
                      0: tie constantly to zero, 1: tie constantly to 1, 2: high-Z,
                      >=3: peripheral outputs (i.e., add 3 to the native peripheral pad index).
                      '''
                      resval: 2,
                    }
                  ]
                  // Random writes to this field may result in pad drive conflicts,
                  // which in turn leads to propagating Xes and assertion failures.
                  tags: ["excl:CsrNonInitTests:CsrExclWrite"]
                }
    },
# sleep behavior of MIO peripheral outputs
# TODO: add individual sleep disable bits
    { multireg: { name:     "MIO_OUT_SLEEP_VAL",
                  desc:     '''Defines sleep behavior of muxed output or inout. Note that
                            the MIO output will only switch into sleep mode if the the corresponding
                            !!MIO_OUTSEL is either set to 0-2, or if !!MIO_OUTSEL selects a peripheral
                            output that can go into sleep. If an always on peripheral is selected with
                            !!MIO_OUTSEL, the !!MIO_OUT_SLEEP_VAL configuration has no effect.
                            '''
                  count:    "NMioPads",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "OUT",
                  fields: [
                    { bits: "1:0",
                      name: "OUT",
                      resval: 2,
                      desc:"Value to drive in deep sleep."
                      enum: [
                        { value: "0",
                          name: "Tie-Low",
                          desc: "The pin is driven actively to zero in deep sleep mode."
                        },
                        { value: "1",
                          name: "Tie-High",
                          desc: "The pin is driven actively to one in deep sleep mode."
                        },
                        { value: "2",
                          name: "High-Z",
                          desc: '''
                            The pin is left undriven in deep sleep mode. Note that the actual
                            driving behavior during deep sleep will then depend on the pull-up/-down
                            configuration of padctrl.
                            '''
                        },
                        { value: "3",
                          name: "Keep",
                          desc: "Keep last driven value (including high-Z)."
                        },
                      ]
                    }
                  ]
                }
    },
# sleep behavior of DIO peripheral outputs
# TODO: add individual sleep disable bits
    { multireg: { name:     "DIO_OUT_SLEEP_VAL",
                  desc:     '''Defines sleep behavior of dedicated output or inout. Note this
                            register has WARL behavior since the sleep value settings are
                            meaningless for always-on and input-only DIOs. For these DIOs,
                            this register always reads 0.
                            '''
                  count:    "NDioPads",
                  swaccess: "rw",
                  hwaccess: "hrw",
                  hwext:    "true",
                  hwqe:     "true",
                  regwen:   "REGEN",
                  cname:    "OUT",
                  fields: [
                    { bits: "1:0",
                      name: "OUT",
                      resval: 2,
                      desc:"Value to drive in deep sleep."
                      enum: [
                        { value: "0",
                          name: "Tie-Low",
                          desc: "The pin is driven actively to zero in deep sleep mode."
                        },
                        { value: "1",
                          name: "Tie-High",
                          desc: "The pin is driven actively to one in deep sleep mode."
                        },
                        { value: "2",
                          name: "High-Z",
                          desc: '''
                            The pin is left undriven in deep sleep mode. Note that the actual
                            driving behavior during deep sleep will then depend on the pull-up/-down
                            configuration of padctrl.
                            '''
                        },
                        { value: "3",
                          name: "Keep",
                          desc: "Keep last driven value (including high-Z)."
                        },
                      ]
                    }
                  ]
                  // these CSRs have WARL behavior and may not
                  // read back the same value that was written to them.
                  tags: ["excl:CsrAllTests:CsrExclWriteCheck"]
                }
    },
# wakeup detector enables
    { multireg: { name:     "WKUP_DETECTOR_EN",
                  desc:     "Enables for the wakeup detectors."
                  count:    "NWkupDetect",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "DETECTOR",
                  fields: [
                    { bits: "0:0",
                      name: "EN",
                      resval: 0,
                      desc: '''
                      Setting this bit activates the corresponding wakeup detector.
                      The behavior is as specified in !!WKUP_DETECTOR,
                      !!WKUP_DETECTOR_CNT_TH and !!WKUP_DETECTOR_PADSEL.
                      '''
                    }
                  ]
                }

    },
# wakeup detector config
    { multireg: { name:     "WKUP_DETECTOR",
                  desc:     "Configuration of wakeup condition detectors."
                  count:    "NWkupDetect",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "DETECTOR",
                  fields: [
                    { bits: "2:0",
                      name: "MODE",
                      resval: 0,
                      desc: "Wakeup detection mode."
                      enum: [
                        { value: "0",
                          name: "Disabled",
                          desc: "Pin wakeup detector is disabled."
                        },
                        { value: "1",
                          name: "Negedge",
                          desc: "Trigger a wakeup request when observing a negative edge."
                        },
                        { value: "2",
                          name: "Posedge",
                          desc: "Trigger a wakeup request when observing a positive edge."
                        },
                        { value: "3",
                          name: "Edge",
                          desc: "Trigger a wakeup request when observing an edge in any direction."
                        },
                        { value: "4",
                          name: "TimedLow",
                          desc: '''
                            Trigger a wakeup request when pin is driven LOW for a certain amount
                            of always-on clock cycles as configured in !!WKUP_DETECTOR_CNT_TH.
                            '''
                        },
                        { value: "5",
                          name: "TimedHigh",
                          desc: '''
                            Trigger a wakeup request when pin is driven HIGH for a certain amount
                            of always-on clock cycles as configured in !!WKUP_DETECTOR_CNT_TH.
                            '''
                        },
                      ]
                    }
                    { bits: "3",
                      name: "FILTER",
                      resval: 0,
                      desc: '''0: signal filter disabled, 1: signal filter enabled. the signal must
                        be stable for 4 always-on clock cycles before the value is being forwarded.
                        can be used for debouncing.
                        '''
                    }
                    { bits: "4",
                      name: "MIODIO",
                      resval: 0,
                      desc: '''0: select index !!WKUP_DETECTOR_PADSEL from MIO pads,
                        1: select index !!WKUP_DETECTOR_PADSEL from DIO pads.
                        '''
                    }
                  ]
                }

    },
# wakeup detector count thresholds
    { multireg: { name:     "WKUP_DETECTOR_CNT_TH",
                  desc:     "Counter thresholds for wakeup condition detectors."
                  count:    "NWkupDetect",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "DETECTOR",
                  fields: [
                    { bits: "WkupCntWidth-1:0",
                      name: "TH",
                      resval: 0,
                      desc: '''Counter threshold for TimedLow and TimedHigh wakeup detector modes (see !!WKUP_DETECTOR).
                      The threshold is in terms of always-on clock cycles.
                      '''
                    }
                  ]
                }

    },
# wakeup detector pad selectors
    { multireg: { name:     "WKUP_DETECTOR_PADSEL",
                  desc:     "Pad selects for pad wakeup condition detectors."
                  count:    "NWkupDetect",
                  swaccess: "rw",
                  hwaccess: "hro",
                  regwen:   "REGEN",
                  cname:    "DETECTOR",
                  fields: [
                    { bits: "${max(n_mio_pads-1, n_dio_periph_in-1).bit_length()-1}:0",
                      name: "SEL",
                      resval: 0,
                      desc: '''Selects a specific MIO or DIO pad (depending on !!WKUP_DETECTOR configuration).
                      In case of MIO, the pad select index is the same as used for !!PERIPH_INSEL, meaning that index
                      0 and 1 just select constant 0, and the MIO pads live at indices >= 2. In case of DIO pads,
                      the pad select index corresponds 1:1 to the DIO pad to be selected.
                      '''
                    }
                  ]
                }

    },
# wakeup detector cause regs
    { multireg: { name:     "WKUP_CAUSE",
                  desc:     "Cause registers for wakeup detectors."
                  count:    "NWkupDetect",
                  swaccess: "rw0c",
                  hwaccess: "hrw",
                  hwext:    "true",
                  hwqe:     "true",
                  regwen:   "REGEN",
                  cname:    "DETECTOR",
                  fields: [
                    { bits: "0",
                      name: "CAUSE",
                      resval: 0,
                      desc: '''Set to 1 if the corresponding detector has detected a wakeup pattern. Write 0 to clear.
                      '''
                    }
                  ]
                  // these CSRs live in the slow AON clock domain and
                  // clearing them will be very slow and the changes
                  // are not immediately visible.
                  tags: ["excl:CsrAllTests:CsrExclWriteCheck"]
                }

    },
  ],
}
