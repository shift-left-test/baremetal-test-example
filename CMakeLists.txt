# Copyright (c) 2023 LG Electronics Inc.
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

# This project consists of C and assembly code
project(baremetal-sample LANGUAGES C ASM)

# Auxiliary options
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

# Cross-compiler options for embedded systems
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CROSS_COMPILE arm-none-eabi-)

set(CMAKE_ASM_COMPILER ${CROSS_COMPILE}as)
set(CMAKE_C_COMPILER ${CROSS_COMPILE}gcc)
set(CMAKE_LINKER ${CROSS_COMPILE}ld)
set(CMAKE_AR ${CROSS_COMPILE}ar)
set(CMAKE_RANLIB ${CROSS_COMPILE}ranlib)
set(CMAKE_OBJCOPY ${CROSS_COMPILE}objcopy)

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mcpu=arm926ej-s")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=arm926ej-s --specs=nano.specs")

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> -nostdlib -Map <TARGET>.map -T ${CMAKE_SOURCE_DIR}/ldscripts/arm.ld <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

# Add external libraries
add_subdirectory(external/Unity)
add_subdirectory(external/embedded-gcov)

# Add the source directory
add_subdirectory(src)
