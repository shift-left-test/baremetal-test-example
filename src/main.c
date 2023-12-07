/* QEMU versatile machine memory map */
volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;

/* Put each character on UART0 */
void print_uart0(const char *str) {
  while(*str != '\0') {
    *UART0DR = (unsigned int)(*str);
    str++;
  }
}

/* Entry function from startup_arm.s */
void main() {
  print_uart0("Hello world!\n");
}
