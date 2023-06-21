#include <iostream>
#include <cstdio>
#include <string>
#include <cmath>

#define TENM3 10e-3
#define MIN(XXX,YYY) ((XXX<YYY)?XXX:YYY)
#define MAX(XXX,YYY) ((XXX<YYY)?YYY:XXX)

void	sinNPhiCosNPhi(int n, double* sinNPhi, double* cosNPhi,
                       double sinPhi, double cosPhi )
{
  double	sinNm1Phi, cosNm1Phi;
  if ( n==1 ) {
    *sinNPhi = sinPhi;
    *cosNPhi = cosPhi;
    return;
  };
  sinNPhiCosNPhi(n-1,&sinNm1Phi,&cosNm1Phi,sinPhi,cosPhi);
  *sinNPhi = cosPhi*sinNm1Phi+sinPhi*cosNm1Phi;
  *cosNPhi = cosPhi*cosNm1Phi-sinPhi*sinNm1Phi;
  return;
}


int enzyme_dup;
int enzyme_out;
int enzyme_const;

struct Dihedral {
  float sinPhase;
  float cosPhase;
  float V;
  float DN;
  float IN;
  int   I1;
  int   I2;
  int   I3;
  int   I4;
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

float dihedral_energy(Dihedral* dihedral_begin, Dihedral* dihedral_end, float* pos) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) float VAR;
  float EraseLinearDihedral;
  float sinPhase;
  float cosPhase;
  float V;
  float DN;
  float IN;
  float x1, y1, z1;
  float x2, y2, z2;
  float x3, y3, z3;
  float x4, y4, z4;
#include "_DihedralEnergy_termDeclares.cc"
#define DIHEDRAL_SET_PARAMETER(VAR) { VAR = dihedral->VAR; }
#define DIHEDRAL_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define DIHEDRAL_ENERGY_ACCUMULATE(VAR) { result += VAR; }
  int I1;
  int I2;
  int I3;
  int I4;
  float result = 0.0;
  float SinNPhi;
  float CosNPhi;
  for ( auto dihedral = dihedral_begin; dihedral < dihedral_end; dihedral++ ) {
#include "_DihedralEnergy_termCode.cc"
  }
#undef DECLARE_FLOAT
#undef DIHEDRAL_SET_PARAMETER
#undef DIHEDRAL_SET_POSITION
#undef DIHEDRAL_ENERGY_ACCUMULATE
  return result;
}

void grad_dihedral_energy(Dihedral* dihedral_begin, Dihedral* dihedral_end, float* pos, float* deriv ) {
  __enzyme_autodiff( (void*)stretch_energy,
                     enzyme_const, dihedral_begin,
                     enzyme_const, dihedral_end,
                     enzyme_dup, pos, deriv );
}

float old_dihedral_energy(Dihedral* dihedral_begin, Dihedral*dihedral_end, float* pos, float* deriv) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) float VAR;
  float sinPhase;
  float cosPhase;
  float V;
  float DN;
  float IN;
  float x1, y1, z1;
  float x2, y2, z2;
  float x3, y3, z3;
  float x4, y4, z4;
#include "_Dihedral_termDeclares.cc"
#define DIHEDRAL_SET_PARAMETER(VAR) { VAR = dihedral->VAR; }
#define DIHEDRAL_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define DIHEDRAL_ENERGY_ACCUMULATE(VAR) { result += VAR; }
#define DIHEDRAL_FORCE_ACCUMULATE(IDX,OFFSET,VAR) { deriv[IDX+OFFSET] += VAR; }
  int I1;
  int I2;
  int I3;
  int I4;
  float result = 0.0;
  bool calcForce = true;
#define DIHEDRAL_CALC_FORCE 1
  for ( auto dihedral = dihedral_begin; dihedral<dihedral_end; dihedral++ ) {
#include "_Dihedral_termCode.cc"
  }
#undef DECLARE_FLOAT
#undef DIHEDRAL_SET_PARAMETER
#undef DIHEDRAL_SET_POSITION
#undef DIHEDRAL_ENERGY_ACCUMULATE
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
      zeroVec(deriv,12);
      grad_dihedral_energy( &dihedral[0], &dihedral[2], pos, deriv);
    }
  } else {
    std::cout << "Old method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(deriv,12);
      energy = old_dihedral_energy( &dihedral[0], &dihedral[2], pos, deriv );
    }
  }
  std::cout << "Energy = " << energy << "\n";
  dump_vec("deriv", deriv, 12);

}
