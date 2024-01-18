# the following library is required to avoid "undefined reference to `__aeabi_uidiv'" issue
find_library(LIBGCC
  NAMES libgcc.a
  HINTS /usr/lib /usr/lib/gcc/arm-none-eabi/10.3.1
  REQUIRED)

add_library(Unity unity.c)
target_include_directories(Unity PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_compile_definitions(Unity PRIVATE UNITY_EXCLUDE_SETJMP_H)
target_link_libraries(Unity PUBLIC ${LIBGCC})
