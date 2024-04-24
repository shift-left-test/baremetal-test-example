# Copyright (c) 2023 LG Electronics Inc.
# SPDX-License-Identifier: MIT

# This provides a convenient way to ensure that the startup code is correctly located in the linker script without manual path modification
add_library(crt0 startup_arm.s)

add_executable(unittest test_main.c print.c)
target_compile_options(unittest PRIVATE --coverage)
target_link_libraries(unittest crt0 embedded-gcov Unity)

# Create binary file using objcopy
add_custom_command(
  TARGET unittest POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} ARGS -O binary unittest.elf unittest.bin
  COMMENT "Convert the ELF file to a binary image")

# Run the binary using qemu-system
add_custom_target(run
  COMMAND qemu-system-arm -M versatilepb -m 128M -nographic -kernel unittest.bin
  COMMENT "Press Ctrl + A, X to exit qemu-system..."
  DEPENDS unittest
  USES_TERMINAL)
