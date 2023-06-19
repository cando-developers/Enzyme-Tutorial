#include "<stdio.h>"

int enzyme_dup;
int enzyme_out;
int enzyme_const;

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
#define STRETCH_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define STRETCH_ENERGY_ACCUMULATE(VAR) { result += VAR; }
  int I1;
  int I2;
  float result;
#include "_StretchEnergy_termCode.cc"
  return result;
}


extern double __enzyme_autodiff(void*, ...);

void  dump_vec(const std::string& msg, float* deriv, size_t num) {
  std::cout << msg;
  for ( int i=0; i<num; i++ ) {
    std::cout << deriv[i] << " ";
  }
  std::cout "\n";
}

void grad_stretch_energy(Stretch* stretch_begin, Stretch* stretch_end, float* pos, float* deriv ) {
  for ( auto stretch = stretch_begin; stretch < stretch_end; stretch++ ) {
    __enzyme_autodiff( stretch_energy,
                       enzyme_const, stretch,
                       enzyme_dup, pos, deriv,
                       enzyme_const num);
  }
}


int main( int argc, const char* argv[] ) {
  float pos[12] = {0.0, 0.0, 0.0, 10.0, 0.0, 0.0,
                   20.0, 0.0, 0.0, 25.0, 0.0, 0.0 };
  float deriv[12];
  Stretch stretch = { 10.0, 2.0, 0, 3, 20.0, 3.0, 6, 9 };

  for (int i=0; i<12; i++ ) {
    deriv[i] = 0.0;
  }
  grad_stretch_energy( &stretch[0], &stretch[1], pos, deriv );

  dump_vec("pos", pos, 12);
  dump_vec("deriv", deriv, 12);

}
