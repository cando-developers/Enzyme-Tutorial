#include <stdio.h>


extern double __enzyme_autodiff(void*, ...);

double foo(double x) {
  return x*x*x;
}

double grad_foo(double x) {
  return __enzyme_autodiff(foo, x);
}

int main(int argc, const char* argv[]) {
  printf("foo(4) = %f\n", foo(4.0));
  printf("grad_foo(4) = %f\n", grad_foo(4.0));
}
