# the following library is required to avoid "undefined reference to `__aeabi_uidiv'" issue
find_library(LIBGCC
  NAMES libgcc.a
  HINTS /usr/lib /usr/lib/gcc/arm-none-eabi/10.3.1
  REQUIRED)

add_library(embedded-gcov gcov_gcc.c gcov_printf.c gcov_public.c)
target_include_directories(embedded-gcov PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_link_libraries(embedded-gcov ${LIBGCC})
