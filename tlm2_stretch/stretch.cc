#include <iostream>
#include <cstdio>
#include <string>
#include <cmath>

int enzyme_dup;
int enzyme_out;
int enzyme_const;

struct Stretch {
  float kb;
  float r0;
  int   I1;
  int   I2;
};



extern double __enzyme_autodiff(void*, ...);

void  dump_vec(const std::string& msg, float* deriv, size_t num) {
  std::cout << msg << " ";
  for ( int i=0; i<num; i++ ) {
    std::cout << deriv[i] << " ";
  }
  std::cout << "\n";
}

#define power2(VAR) (VAR*VAR)
#define mysqrt(VAR) (std::sqrt(VAR))
#define reciprocal(VAR) (1.0/VAR)

float stretch_energy(Stretch* stretch_begin, Stretch* stretch_end, float* pos) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) float VAR;
  float kb;
  float r0;
  float x1, y1, z1;
  float x2, y2, z2;
#include "_StretchEnergy_termDeclares.cc"
#define STRETCH_SET_PARAMETER(VAR) { VAR = stretch->VAR; }
#define STRETCH_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define STRETCH_ENERGY_ACCUMULATE(VAR) { result += VAR; }
  int I1;
  int I2;
  float result = 0.0;
  for ( auto stretch = stretch_begin; stretch < stretch_end; stretch++ ) {
#include "_StretchEnergy_termCode.cc"
  }
#undef DECLARE_FLOAT
#undef STRETCH_SET_PARAMETER
#undef STRETCH_SET_POSITION
#undef STRETCH_ENERGY_ACCUMULATE
  return result;
}

void grad_stretch_energy(Stretch* stretch_begin, Stretch* stretch_end, float* pos, float* deriv ) {
  __enzyme_autodiff( (void*)stretch_energy,
                     enzyme_const, stretch_begin,
                     enzyme_const, stretch_end,
                     enzyme_dup, pos, deriv );
}

float old_stretch_energy(Stretch* stretch_begin, Stretch* stretch_end, float* pos, float* deriv) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) float VAR;
  float kb;
  float r0;
  float x1, y1, z1;
  float x2, y2, z2;
#include "_Stretch_termDeclares.cc"
#define STRETCH_SET_PARAMETER(VAR) { VAR = stretch->VAR; }
#define STRETCH_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define STRETCH_ENERGY_ACCUMULATE(VAR) { result += VAR; }
#define STRETCH_FORCE_ACCUMULATE(IDX,OFFSET,VAR) { deriv[IDX+OFFSET] += VAR; }
  int I1;
  int I2;
  float result = 0.0;
  bool calcForce = true;
#define STRETCH_CALC_FORCE 1
  for ( auto stretch = stretch_begin; stretch<stretch_end; stretch++ ) {
#include "_Stretch_termCode.cc"
  }
#undef DECLARE_FLOAT
#undef STRETCH_SET_PARAMETER
#undef STRETCH_SET_POSITION
#undef STRETCH_ENERGY_ACCUMULATE
  return result;
}

void zeroVec(float* deriv, size_t num) {
  for (int i=0; i<num; i++ ) {
    deriv[i] = 0.0;
  }
}
int main( int argc, const char* argv[] ) {
  float pos[12] = {0.0, 19.0, 3.0, 10.0, 7.0, 80.0,
                   20.0, 15.0, 17.0, 25.0, 44.0, 23.0 };
  float deriv[12];
  Stretch stretch[] = { {10.0, 2.0, 0, 3}, {20.0, 3.0, 6, 9} };
  
  dump_vec("pos", pos, 12);
  float energy = 0.0;
  std::string arg1(argv[1]);
  bool donew = (arg1 == "new");
  size_t num = atoi(argv[2]);
  if (donew) {
    std::cout << "New method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      //      energy = stretch_energy( &stretch[0], &stretch[2], pos );
      zeroVec(deriv,12);
      grad_stretch_energy( &stretch[0], &stretch[2], pos, deriv );
    }
  } else {
    std::cout << "Old method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(deriv,12);
      energy = old_stretch_energy( &stretch[0], &stretch[2], pos, deriv );
    }
  }
  std::cout << "Energy = " << energy << "\n";
  dump_vec("deriv", deriv, 12);

}
