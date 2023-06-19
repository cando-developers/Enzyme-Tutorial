struct Stretch {
  float kb;
  float r0;
  int   I1;
  int   I2;
};


float stretch_energy(Stretch* stretch, float* pos, size_t num) {
#define DECLARE_FLOAT(x) float x;
#include "_StretchEnergy_declareCode.cc"
#define STRETCH_SET_PARAMETER(VAR) { VAR = stretch->VAR; }
#define STRETCH_SET_POSITION(VAR,IDX,OFFSET) { var = pos[IDX+OFFSET]; }
#define STRETCH_ENERGY_ACCUMULATE(VAR) { result += VAR; }
#include "_StretchEnergy_termCode.cc"
  
  
}


extern double __enzyme_autodiff(void*, ...);

void grad_stretch_energy(Stretch* stretch, float* pos, float* deriv, size_t num) {
  __enzyme_autodiff( stretch,
                     enzyme_const, stretch,
                     enzyme_dup, pos, deriv,
                     enzyme_const num);
}


int main( int argc, const char* argv[] ) {
  float pos[6] = {0.0, 0.0, 0.0, 10.0, 0.0, 0.0 };
  float deriv[6] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
  Stretch stretch = { 10.0, 2.0, 0, 3 };

  grad_stretch_energy( &stretch, pos, deriv, 6 );

}
