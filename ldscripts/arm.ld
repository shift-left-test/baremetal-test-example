ENTRY(_Reset)
SECTIONS {
    . = 0x10000;  /* QEMU with -kernel option adds an offset of 0x00010000 for 32bit ARM */
    .startup . : { crt0:startup.s.o(.text) }  /* Put startup code of crt0 library at the beginning */
    .text : { *(.text) }
    .data : { *(.data) }
    .bss : { *(.bss COMMON) }  /* Put common symbols on the bss section */
    . = ALIGN(8);
    . = . + 0x1000;  /* Use 4kB of stack memory */
    stack_top = .;
}
