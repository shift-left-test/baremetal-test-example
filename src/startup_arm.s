.section .startup, "ax"  /* Declare boot section */
.global _Reset
_Reset:
    LDR sp, =stack_top  /* Initialize the stack which is defined in arm.ld script */
    BL entry  /* Call entry function */
    B .  /* Loop endlessly */
