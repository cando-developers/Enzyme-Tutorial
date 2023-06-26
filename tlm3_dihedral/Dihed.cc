#include <iostream>
#include <iomanip>
#include <cstdio>
#include <string>
#include <cmath>

#define PI 3.1415926535

#define TENM3 10e-3
#define MIN(XXX,YYY) ((XXX<YYY)?XXX:YYY)
#define MAX(XXX,YYY) ((XXX<YYY)?YYY:XXX)

void	sinNPhiCosNPhi(int n, float* sinNPhi, float* cosNPhi,
                       float sinPhi, float cosPhi )
{
  float	sinNm1Phi, cosNm1Phi;
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

template <int N, typename Real>
struct SinCos {
  static void sinNPhiCosNPhi(Real& sinNPhi, Real& cosNPhi,
                      Real sinPhi, Real cosPhi ) {
    Real sinNm1Phi;
    Real cosNm1Phi;
    SinCos<N-1,Real>::sinNPhiCosNPhi(sinNm1Phi,cosNm1Phi,sinPhi,cosPhi);
    sinNPhi = cosPhi*sinNm1Phi+sinPhi*cosNm1Phi;
    cosNPhi = cosPhi*cosNm1Phi-sinPhi*sinNm1Phi;
  }
};

template <>
struct SinCos<1,float> {
  static void sinNPhiCosNPhi(float& sinNPhi, float& cosNPhi,
                      float sinPhi, float cosPhi ) {
    sinNPhi = sinPhi;
    cosNPhi = cosPhi;
  }
};

template <>
struct SinCos<1,double> {
  static void sinNPhiCosNPhi(double& sinNPhi, double& cosNPhi,
                      double sinPhi, double cosPhi ) {
    sinNPhi = sinPhi;
    cosNPhi = cosPhi;
  }
};

int enzyme_dup;
int enzyme_out;
int enzyme_const;

struct Dihedral {
  float sinPhase;
  float cosPhase;
  float V;
  float DN;
  int   IN;
  int   I1;
  int   I2;
  int   I3;
  int   I4;
};



 extern double __enzyme_autodiff(void*, ...);

void  dump_vec(const std::string& msg, float* deriv, size_t num) {
  std::cout << std::setw(20) << msg << " ";
  for ( int i=0; i<num; i++ ) {
    std::cout << std::setprecision(4) << std::fixed << std::setw(8) << deriv[i] << " ";
  }
  std::cout << "\n";
}

#define power2(VAR) (VAR*VAR)
#define mysqrt(VAR) (std::sqrt(VAR))
#define reciprocal(VAR) (1.0/VAR)

double old_simple_dihedral_energy_gradient( double sinPhase, double cosPhase, double V, double DN, int IN, int I1, int I2, int I3, int I4, float* pos, float* deriv ) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) double VAR;
#define Real double
  double EraseLinearDihedral;
  double x1, y1, z1;
  double x2, y2, z2;
  double x3, y3, z3;
  double x4, y4, z4;
#include "_Dihedral_termDeclares.cc"
#define DIHEDRAL_SET_PARAMETER(VAR) {}
#define DIHEDRAL_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define DIHEDRAL_ENERGY_ACCUMULATE(VAR) { result += VAR; }
#define DIHEDRAL_FORCE_ACCUMULATE(IDX,OFFSET,VAR) { deriv[IDX+OFFSET] -= VAR; }
  double result = 0.0;
  double SinNPhi;
  double CosNPhi;
  bool calcForce = true;
#define DIHEDRAL_CALC_FORCE 1
#include "_Dihedral_termCode.cc"
#undef Real
#undef DECLARE_FLOAT
#undef DIHEDRAL_SET_PARAMETER
#undef DIHEDRAL_SET_POSITION
#undef DIHEDRAL_ENERGY_ACCUMULATE
#undef DIHEDRAL_FORCE_ACCUMULATE
  return result;
}

double simple_dihedral_energy( double sinPhase, double cosPhase, double V, double DN, int IN, int I1, int I2, int I3, int I4, float* pos ) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) double VAR;
#define Real double
  double EraseLinearDihedral;
  double x1, y1, z1;
  double x2, y2, z2;
  double x3, y3, z3;
  double x4, y4, z4;
#include "_DihedralEnergy_termDeclares.cc"
#define DIHEDRAL_SET_PARAMETER(VAR) {}
#define DIHEDRAL_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define DIHEDRAL_ENERGY_ACCUMULATE(VAR) { result += VAR; }
  double result = 0.0;
  double SinNPhi;
  double CosNPhi;
#include "_DihedralEnergy_termCode.cc"
#undef Real
#undef DECLARE_FLOAT
#undef DIHEDRAL_SET_PARAMETER
#undef DIHEDRAL_SET_POSITION
#undef DIHEDRAL_ENERGY_ACCUMULATE
  return result;
}

void simple_dihedral_gradient( double sinPhase, double cosPhase, double V, double DN, int IN, int I1, int I2, int I3, int I4, float* pos, float* grad ) {
  __enzyme_autodiff( (void*)simple_dihedral_energy,
                     enzyme_const, sinPhase,
                     enzyme_const, cosPhase,
                     enzyme_const, V,
                     enzyme_const, DN,
                     enzyme_const, IN,
                     enzyme_const, I1,
                     enzyme_const, I2,
                     enzyme_const, I3,
                     enzyme_const, I4,
                     enzyme_dup, pos, grad );
}

template <typename Real>
float dihedral_energy(Dihedral* dihedral_begin, Dihedral* dihedral_end, float* pos) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) Real VAR;
  Real EraseLinearDihedral;
  Real sinPhase;
  Real cosPhase;
  Real V;
  Real DN;
  int IN;
  Real x1, y1, z1;
  Real x2, y2, z2;
  Real x3, y3, z3;
  Real x4, y4, z4;
#include "_DihedralEnergy_termDeclares.cc"
#define DIHEDRAL_SET_PARAMETER(VAR) { VAR = dihedral->VAR; }
#define DIHEDRAL_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define DIHEDRAL_ENERGY_ACCUMULATE(VAR) { result += VAR; }
  int I1;
  int I2;
  int I3;
  int I4;
  Real result = 0.0;
  Real SinNPhi;
  Real CosNPhi;
  for ( auto dihedral = dihedral_begin; dihedral < dihedral_end; dihedral++ ) {
#include "_DihedralEnergy_termCode.cc"
  }
#undef DECLARE_FLOAT
#undef DIHEDRAL_SET_PARAMETER
#undef DIHEDRAL_SET_POSITION
#undef DIHEDRAL_ENERGY_ACCUMULATE
  return result;
}

template <typename Real>
__attribute__((noinline)) void grad_dihedral_energy(Dihedral* dihedral_begin, Dihedral* dihedral_end, float* pos, float* deriv ) {
  __enzyme_autodiff( (void*)dihedral_energy<Real>,
                     enzyme_const, dihedral_begin,
                     enzyme_const, dihedral_end,
                     enzyme_dup, pos, deriv );
}

void finite_diff_dihedral_energy(Dihedral* dihedral_begin, Dihedral* dihedral_end, float* pos, float* deriv)
{
  // Calculate the energy using the dihedral_energy function
  float energy_old = dihedral_energy<float>(dihedral_begin, dihedral_end, pos);

  // Iterate over each position in the pos array
    
  for (int i = 0; i < 12; i++)
  {
    float posp[12];
    float posm[12];
    for(int j = 0; j<12; j++)
      {
        posp[j] = pos[j];
        posm[j] = pos[j];
      }
    posp[i] = pos[i] + TENM3;
    posm[i] = pos[i] - TENM3;
    
    float energy_new_p = dihedral_energy<float>(dihedral_begin, dihedral_end, posp);
    float energy_new_m = dihedral_energy<float>(dihedral_begin, dihedral_end, posm);

    // Calculate the derivative using finite differences
    deriv[i] = (energy_new_p - energy_new_m) / (2.0*TENM3);
  }
}

template <typename Real>
Real old_dihedral_energy(Dihedral* dihedral_begin, Dihedral*dihedral_end, float* pos, float* deriv) {
#define USE_EXPLICIT_DECLARES 1
#define DECLARE_FLOAT(VAR) Real VAR;
  Real sinPhase;
  Real cosPhase;
  Real V;
  Real DN;
  int IN;
  Real x1, y1, z1;
  Real x2, y2, z2;
  Real x3, y3, z3;
  Real x4, y4, z4;
#include "_Dihedral_termDeclares.cc"
#define DIHEDRAL_SET_PARAMETER(VAR) { VAR = dihedral->VAR; }
#define DIHEDRAL_SET_POSITION(VAR,IDX,OFFSET) { VAR = pos[IDX+OFFSET]; }
#define DIHEDRAL_ENERGY_ACCUMULATE(VAR) { result += VAR; }
#define DIHEDRAL_FORCE_ACCUMULATE(IDX,OFFSET,VAR) { deriv[IDX+OFFSET] -= VAR; }
  int I1;
  int I2;
  int I3;
  int I4;
  Real SinNPhi;
  Real CosNPhi;
  Real result = 0.0;
  bool calcForce = true;
#define DIHEDRAL_CALC_FORCE 1
  Real EraseLinearDihedral; 
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
void copyVec(float* result, float* val, size_t num) {
  for (int i=0; i<num; i++ ) {
    result[i] = val[i];
  }
}


int main( int argc, const char* argv[] ) {
  float ANG = 20.0*0.0174533;
  float pos[12] = {0.0, 0.0, 1.0,
                      0.0, 0.0, 0.0,
                      1.0, 0.0, 0.0,
                      1.0, (float)-sin(ANG), (float)cos(ANG) };
  float deriv[12];
  Dihedral dihedral[] = { {0.0, 1.0, 10.0, 2.0, 2, 0, 3, 6, 9 } };
  
  dump_vec("pos", pos, 12);
  float energy = 0.0;
  std::string arg1(argv[1]);
  
  size_t num = atoi(argv[2]);
  if (arg1 == "new-float") {
    std::cout << "New method" << "\n";
    // energy = dihedral_energy( &dihedral[0], &dihedral[1], pos );
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(deriv,12);
      grad_dihedral_energy<float>( &dihedral[0], &dihedral[1], pos, deriv);
    }
    dump_vec("new float deriv", deriv, 12);
  } else if (arg1 == "new-double") {
    std::cout << "New method" << "\n";
    // energy = dihedral_energy( &dihedral[0], &dihedral[1], pos );
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(deriv,12);
      grad_dihedral_energy<double>( &dihedral[0], &dihedral[1], pos, deriv);
    }
    dump_vec("new double deriv", deriv, 12);
  } else if ( arg1 == "fin") {
      for ( size_t nn = 0; nn<num; nn++ ) {
        zeroVec(deriv,12);
        finite_diff_dihedral_energy(&dihedral[0], &dihedral[1], pos, deriv);
      }
    dump_vec("fin deriv", deriv, 12);
  } else if (arg1 == "old-float") {
    float fenergy;
    float fderiv[12];
    float fpos[12];
    copyVec(fpos,pos,12);
    std::cout << "Old method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(fderiv,12);
      energy = old_dihedral_energy<float>( &dihedral[0], &dihedral[1], fpos, fderiv );
    }
    std::cout << "Energy = " << fenergy << "\n";
    dump_vec("deriv", fderiv, 12);
  } else if (arg1 == "old-double") {
    float fenergy;
    float fderiv[12];
    float fpos[12];
    copyVec(fpos,pos,12);
    std::cout << "Old method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(fderiv,12);
      energy = old_dihedral_energy<double>( &dihedral[0], &dihedral[1], fpos, fderiv );
    }
    std::cout << "Energy = " << fenergy << "\n";
    dump_vec("deriv", fderiv, 12);
  } else if (arg1 == "new-simple") {
    float fderiv[12];
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(fderiv,12);
      simple_dihedral_gradient( 0.0, 1.0, 10.0, 2.0, 2, 0, 3, 6, 9, pos, fderiv );
    }
    dump_vec("simple deriv via Enzyme", fderiv, 12 );
  } else if (arg1 == "old-simple") {
    float fderiv[12];
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(fderiv,12);
      old_simple_dihedral_energy_gradient( 0.0, 1.0, 10.0, 2.0, 2, 0, 3, 6, 9, pos, fderiv );
    }
    dump_vec("simple deriv old code  ", fderiv, 12 );
  }

}
