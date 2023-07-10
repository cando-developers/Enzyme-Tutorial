#include <cmath>
#include <iostream>

inline float van_der_waals(float distance, float dA, float dC) {
  return dA*std::pow(distance, -12) - dC*std::pow(distance, -6);
}

inline float electrostatic(float distance, float dQ1Q2) {
  return dQ1Q2/distance;
}

float energyold(int natoms, float coords[], float charges[],
             int ntypes, int types[], float cn1[], float cn2[],
             int nexcluded[], int excluded_indices[]) {
  float energy_vdw = 0.0;
  float energy_electrostatic = 0.0;
  int excludedAtomIndex = 0;
  int notExcluded = 1;
  for (size_t index1 = 0; index1 < natoms - 1; ++index1) {
    int numberOfExcludedAtomsRemaining = nexcluded[index1];
    float charge11 = charges[index1];
    int type1 = types[index1];
    float x1 = coords[index1*3+0],
      y1 = coords[index1*3+1],
      z1 = coords[index1*3+2];
    
    for (size_t index2 = index1+1; index2 < natoms; ++index2) {
      int maybe_excluded_atom = excluded_indices[excludedAtomIndex];
      
      if (numberOfExcludedAtomsRemaining > 0 && maybe_excluded_atom == index2) {
        ++excludedAtomIndex;
        --numberOfExcludedAtomsRemaining;
        continue;
      }
      
      float charge22 = charges[index2];
      int type2 = types[index2];
      float x2 = coords[index2*3+0],
        y2 = coords[index2*3+1],
        z2 = coords[index2*3+2];
      float dA = cn1[type1*ntypes + type2];
      float dC = cn2[type1*ntypes + type2];
      float dQ1Q2 = charge11*charge22;
      float xd = x1 - x2, yd = y1 - y2, zd = z1 - z2;
      float distance = std::sqrt(xd*xd + yd*yd + zd*zd);
      energy_vdw += van_der_waals(distance, dA, dC)*notExcluded;
      energy_electrostatic += electrostatic(distance, dQ1Q2)*notExcluded;
    }
   
  }
  return (energy_vdw + energy_electrostatic);
}


float energynew(int natoms, float coords[], float charges[],
             int ntypes, int types[], float cn1[], float cn2[],
             int nexcluded[], int excluded_indices[]) {
  float energy_vdw = 0.0;
  float energy_electrostatic = 0.0;
  int excludedAtomIndex = 0;
  int notExcluded = 1;
  for (size_t index1 = 0; index1 < natoms - 1; ++index1) {
    int numberOfExcludedAtomsRemaining = nexcluded[index1];
    float charge11 = charges[index1];
    int type1 = types[index1];
    float x1 = coords[index1*3+0],
      y1 = coords[index1*3+1],
      z1 = coords[index1*3+2];
    
    for (size_t index2 = index1+1; index2 < natoms; ++index2) {
      int maybe_excluded_atom = excluded_indices[excludedAtomIndex];
      notExcluded = !(numberOfExcludedAtomsRemaining > 0 && maybe_excluded_atom == index2);
      excludedAtomIndex += (numberOfExcludedAtomsRemaining > 0 && maybe_excluded_atom == index2);
      numberOfExcludedAtomsRemaining -= (numberOfExcludedAtomsRemaining > 0 && maybe_excluded_atom == index2); 
      float charge22 = charges[index2];
      int type2 = types[index2];
      float x2 = coords[index2*3+0],
        y2 = coords[index2*3+1],
        z2 = coords[index2*3+2];
      float dA = cn1[type1*ntypes + type2];
      float dC = cn2[type1*ntypes + type2];
      float dQ1Q2 = charge11*charge22;
      float xd = x1 - x2, yd = y1 - y2, zd = z1 - z2;
      float distance = std::sqrt(xd*xd + yd*yd + zd*zd);
      energy_vdw += van_der_waals(distance, dA, dC)*notExcluded;
      energy_electrostatic += electrostatic(distance, dQ1Q2)*notExcluded;
    }
   
  }
  return (energy_vdw + energy_electrostatic);
}



int main(int argc, const char* argv[]) {
  std::string arg1(argv[1]);
  bool donew = (arg1 == "new");
  size_t num = atoi(argv[2]);

  
  float pos[12] = {0.0, 19.0, 3.0, 10.0, 7.0, 80.0,
                   20.0, 15.0, 17.0, 25.0, 44.0, 23.0};                   
  float charge[4] = {0.85, 0.95, 1.05, 1.15};
  int types[4] = {0, 1, 1, 0};
  float cn1[2] = {0.5, 0.7};
  float cn2[2] = {0.3, 0.6};
  int nexcluded[4] = {1, 1, 1, 1};
  // just exclude self-interactions.
  int excluded_indices[4] = {1, 2, 3, 0};
  float tenergy = 0;
  if (donew) {
    std::cout << "New method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
      tenergy  = energynew(4, pos, charge, 2, types, cn1, cn2,
                         nexcluded, excluded_indices);
    }
  }

  else {
    std::cout << "Old method" << "\n";
    for ( size_t nn = 0; nn<num; nn++ ) {
  tenergy = energyold(4, pos, charge, 2, types, cn1, cn2,
                         nexcluded, excluded_indices);    
    }
  }
  
  std::cout << "Energy: " << tenergy << std::endl;
  return 0;
}
