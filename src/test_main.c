#include <gcov_public.h>
#include <unity.h>
#include "print.h"

void setUp() {
}

void tearDown() {
}

int add(int x, int y) {
  return x + y;
}

void test_add() {
  TEST_ASSERT_EQUAL(3, add(1, 2));
}

/* Entry function from startup_arm.s */
void main() {
  __gcov_call_constructors();

  print_uart0("Hello world!\n");

  UNITY_BEGIN();
  RUN_TEST(test_add);
  UNITY_END();

  __gcov_exit();
}
