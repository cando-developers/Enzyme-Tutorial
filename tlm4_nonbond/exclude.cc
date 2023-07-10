#include <cmath>
#include <iostream>

inline float van_der_waals(float distance, float dA, float dC) {
  return dA*std::pow(distance, -12) - dC*std::pow(distance, -6);
}

inline float electrostatic(float distance, float dQ1Q2) {
  return dQ1Q2/distance;
}

float energy(int natoms, float coords[], float charges[],
             int ntypes, int types[], float cn1[], float cn2[],
             int nexcluded[], int excluded_indices[]) {
  float energy_vdw = 0.0;
  float energy_electrostatic = 0.0;
  int excludedAtomIndex = 0;
  for (size_t index1 = 0; index1 < natoms - 1; ++index1) {
    int numberOfExcludedAtomsRemaining = nexcluded[index1];
    float charge11 = charges[index1];
    int type1 = types[index1];
    float x1 = coords[index1*3+0],
      y1 = coords[index1*3+1],
      z1 = coords[index1*3+2];
    for (size_t index2 = index1+1; index2 < natoms; ++index2) {
      int maybe_excluded_atom = excluded_indices[excludedAtomIndex];
      if (numberOfExcludedAtomsRemaining > 0
          && maybe_excluded_atom == index2) {
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
      energy_vdw += van_der_waals(distance, dA, dC);
      energy_electrostatic += electrostatic(distance, dQ1Q2);
    }
  }
  return energy_vdw + energy_electrostatic;
}

const size_t NATOMS = 8*8 + 1;
const float MAXCOORD = 100.0;
const float MAXCHARGE = 2.0;

void initialize_positions(float pos[]) {
  for (size_t n = 0; n < NATOMS*3; ++n)
    pos[n] = MAXCOORD * (float)rand()/(float)RAND_MAX;
}

void initialize_charges(float charges[]) {
  for (size_t n = 0; n < NATOMS; ++n)
    // Try to spread on both sides of zero.
    charges[n] = MAXCHARGE * (float)rand()/(float)RAND_MAX - MAXCHARGE/2;
}

void initialize_types(int types[]) {
  for (size_t n = 0; n < NATOMS; ++n)
    types[n] = rand() % 2;
}

void initialize_exclusions(int nexcluded[], int excluded_indices[]) {
  // nonrandom: just exclude each atom from its next.
  size_t excluded_atom_index = 0;
  for (size_t n = 0; n < NATOMS; ++n) {
    nexcluded[n] = 1;
    excluded_indices[excluded_atom_index++] = (n+1) % NATOMS;
  }
}

void display_atoms(float pos[], float charge[], int types[]) {
  for (size_t n = 0; n < NATOMS; ++n) {
    std::cout << "Atom #" << n << ": ";
    std::cout << "Type " << types[n] << " @ ";
    std::cout << "(" << pos[3*n+0] << "," << pos[3*n+1] << "," << pos[3*n+2] << ") ";
    std::cout << "Charge " << charge[n] << std::endl;
  }
}

int main() {
  float pos[NATOMS*3];
  float charge[NATOMS];
  int types[NATOMS];
  float cn1[4] = {0.05, 0.07, 0.07, 0.08};
  float cn2[4] = {0.01, 0.03, 0.03, 0.04};
  int nexcluded[NATOMS];
  int excluded_indices[NATOMS];

  initialize_positions(pos);
  initialize_charges(charge);
  initialize_types(types);
  initialize_exclusions(nexcluded, excluded_indices);

  //display_atoms(pos, charge, types);

  float tenergy = energy(NATOMS, pos, charge, 2, types, cn1, cn2,
                         nexcluded, excluded_indices);
  std::cout << "Energy: " << tenergy << std::endl;
  return 0;
}
