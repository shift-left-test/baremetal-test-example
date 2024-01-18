add_library(embedded-gcov gcov_gcc.c gcov_printf.c gcov_public.c)
target_include_directories(embedded-gcov PUBLIC ${CMAKE_CURRENT_LIST_DIR})
