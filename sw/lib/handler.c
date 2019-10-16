// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "handler.h"

#include "sw/lib/common.h"
#include "sw/lib/uart.h"

/**
 * Default exception handler. Can be overidden.
 */
void handler_exception(void) __attribute__((aligned(4), interrupt, weak));

/**
 * SW IRQ handler. Can be overidden.
 */
void handler_irq_software(void) __attribute__((aligned(4), interrupt, weak));

/**
 * Timer IRQ handler. Can be overidden.
 */
void handler_irq_timer(void) __attribute__((aligned(4), interrupt, weak));

/**
 * external IRQ handler. Can be overidden.
 */
void handler_irq_external(void) __attribute__((aligned(4), interrupt, weak));

/**
 * Instruction access fault. Can be overriden.
 */
void handler_instr_acc_fault(void) __attribute__((aligned(4), interrupt, weak));

/**
 * Illegal Instruction fault. Can be overriden.
 */
void handler_instr_ill_fault(void) __attribute__((aligned(4), interrupt, weak));
;

/**
 * Breakpoint handler. Can be overriden.
 */
void handler_bkpt(void) __attribute__((aligned(4), interrupt, weak));

/**
 * Load store unit fault. Can be overriden.
 */
void handler_lsu_fault(void) __attribute__((aligned(4), interrupt, weak));

/**
 * Exception call handler. Can be overriden.
 */
void handler_ecall(void) __attribute__((aligned(4), interrupt, weak));

/**
 * Return value of mtval
 */
static uint32_t get_mtval(void) {
  uint32_t mtval;
  asm volatile("csrr %0, mtval" : "=r"(mtval) : :);
  return mtval;
}

/**
 * Default Error Handling
 * @param error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
  const uint32_t mtval = get_mtval();
  uart_send_str((char *)msg);
  uart_send_str("MTVAL value is ");
  uart_send_uint(mtval, 32);
  uart_send_str("\n");
  while (1) {
  };
}

// Below functions are default weak exception handlers meant to be overriden
void handler_exception(void) {
  uint32_t mcause;
  exc_id_t exc_cause;

  asm volatile("csrr %0 , mcause" : "=r"(mcause) : :);
  exc_cause = (exc_id_t)(mcause & kIdMax);

  switch (exc_cause) {
    case kInstMisa:
      handler_instr_acc_fault();
      break;
    case kInstAccFault:
      handler_instr_acc_fault();
      break;
    case kInstIllegalFault:
      handler_instr_ill_fault();
      break;
    case kBkpt:
      handler_bkpt();
      break;
    case kLoadAccFault:
      handler_lsu_fault();
      break;
    case kStrAccFault:
      handler_lsu_fault();
      break;
    case kECall:
      handler_ecall();
      break;
    default:
      while (1) {
      };
  }
}

void handler_irq_software(void) {
  uart_send_str("Software IRQ triggered!\n");
  while (1) {
  }
}

void handler_irq_timer(void) {
  uart_send_str("Timer IRQ triggered!\n");
  while (1) {
  }
}

void handler_irq_external(void) {
  uart_send_str("External IRQ triggered!\n");
  while (1) {
  }
}

void handler_instr_acc_fault(void) {
  const char fault_msg[] =
      "Instruction access fault, mtval shows fault address\n";
  print_exc_msg(fault_msg);
}

void handler_instr_ill_fault(void) {
  const char fault_msg[] =
      "Illegal Instruction fault, mtval shows instruction content\n";
  print_exc_msg(fault_msg);
}

void handler_bkpt(void) {
  const char exc_msg[] =
      "Breakpoint triggerd, mtval shows the breakpoint address\n";
  print_exc_msg(exc_msg);
}

void handler_lsu_fault(void) {
  const char exc_msg[] = "Load/Store fault, mtval shows the fault address\n";
  print_exc_msg(exc_msg);
}

void handler_ecall(void) {
  uart_send_str("Environment call encountered\n");
  while (1) {
  }
}
