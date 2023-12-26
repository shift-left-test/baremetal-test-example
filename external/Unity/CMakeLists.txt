add_library(Unity unity.c)
target_include_directories(Unity PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_compile_definitions(Unity PRIVATE UNITY_EXCLUDE_SETJMP_H)
