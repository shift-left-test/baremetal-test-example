#include <gcov_public.h>

/* QEMU versatile machine memory map */
volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;

/* Put each character on UART0 */
void putchar_uart0(const char* s) {
  *UART0DR = (unsigned int)(*s);
}

/* Put characters on UART0 */
void print_uart0(const char* s) {
  while(*s != '\0') {
    putchar_uart0(s);
    s++;
  }
}

/* Entry function from startup_arm.s */
void main() {
  __gcov_call_constructors();
  print_uart0("Hello world!\n");
  __gcov_exit();
}
