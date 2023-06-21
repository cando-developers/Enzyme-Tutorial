#include <iostream>
#include <cstdio>
#include <string>
#include <cmath>

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
  __enzyme_autodiff( (void*)dihedral_energy,
                     enzyme_const, dihedral_begin,
                     enzyme_const, dihedral_end,
                     enzyme_dup, pos, deriv );
}

void finite_diff_dihedral_energy(Dihedral* dihedral_begin, Dihedral* dihedral_end, float* pos, float* deriv)
{
  // Calculate the energy using the dihedral_energy function
  float energy_old = dihedral_energy(dihedral_begin, dihedral_end, pos);

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
    
    float energy_new_p = dihedral_energy(dihedral_begin, dihedral_end, posp);
    float energy_new_m = dihedral_energy(dihedral_begin, dihedral_end, posm);

    // Calculate the derivative using finite differences
    deriv[i] = (energy_new_p - energy_new_m) / (2.0*TENM3);
  }
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
  float SinNPhi;
  float CosNPhi;
  float result = 0.0;
  bool calcForce = true;
#define DIHEDRAL_CALC_FORCE 1
  float EraseLinearDihedral; 
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
  int donew = 0;
  
  if(arg1 == "new")
    donew = 1;
  else if(arg1 == "fin")
    donew = 2;
  else
    donew = 3;
  
  size_t num = atoi(argv[2]);
  if (donew == 1)// for new
    {
    std::cout << "New method" << "\n";
    // energy = dihedral_energy( &dihedral[0], &dihedral[1], pos );
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(deriv,12);
      grad_dihedral_energy( &dihedral[0], &dihedral[1], pos, deriv);
    }
  }
  
  else if (donew == 2)// for finite diff
      {
        for ( size_t nn = 0; nn<num; nn++ ) {
          zeroVec(deriv,12);
          finite_diff_dihedral_energy(&dihedral[0], &dihedral[1], pos, deriv);
        }   
      }
 

  else//for old
   {
    std::cout << "Old method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      zeroVec(deriv,12);
      energy = old_dihedral_energy( &dihedral[0], &dihedral[1], pos, deriv );
    }
  }
  std::cout << "Energy = " << energy << "\n";
  dump_vec("deriv", deriv, 12);

}
