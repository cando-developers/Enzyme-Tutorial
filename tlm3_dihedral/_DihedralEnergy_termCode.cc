// C-code
	DIHEDRAL_SET_PARAMETER(sinPhase);
	DIHEDRAL_SET_PARAMETER(cosPhase);
	DIHEDRAL_SET_PARAMETER(V);
	DIHEDRAL_SET_PARAMETER(DN);
	DIHEDRAL_SET_PARAMETER(IN);
	DIHEDRAL_SET_PARAMETER(I1);
	DIHEDRAL_SET_PARAMETER(I2);
	DIHEDRAL_SET_PARAMETER(I3);
	DIHEDRAL_SET_PARAMETER(I4);
	DIHEDRAL_SET_POSITION(x1,I1,0);
	DIHEDRAL_SET_POSITION(y1,I1,1);
	DIHEDRAL_SET_POSITION(z1,I1,2);
	DIHEDRAL_SET_POSITION(x2,I2,0);
	DIHEDRAL_SET_POSITION(y2,I2,1);
	DIHEDRAL_SET_POSITION(z2,I2,2);
	DIHEDRAL_SET_POSITION(x3,I3,0);
	DIHEDRAL_SET_POSITION(y3,I3,1);
	DIHEDRAL_SET_POSITION(z3,I3,2);
	DIHEDRAL_SET_POSITION(x4,I4,0);
	DIHEDRAL_SET_POSITION(y4,I4,1);
	DIHEDRAL_SET_POSITION(z4,I4,2);
	 tx69 = -(x2*y1); 		/* rule 22 */
	 tx70 = x3*y1; 		/* rule 23 */
	 tx71 = x1*y2; 		/* rule 24 */
	 tx72 = -(x3*y2); 		/* rule 25 */
	 tx73 = -(x1*y3); 		/* rule 26 */
	 tx74 = x2*y3; 		/* rule 27 */
	 tx75 = x2*z1; 		/* rule 28 */
	 tx76 = -(x3*z1); 		/* rule 29 */
	 tx77 = -(y2*z1); 		/* rule 30 */
	 tx78 = y3*z1; 		/* rule 31 */
	 tx79 = -(x1*z2); 		/* rule 32 */
	 tx80 = x3*z2; 		/* rule 33 */
	 tx81 = y1*z2; 		/* rule 34 */
	 tx82 = -(y3*z2); 		/* rule 35 */
	 tx83 = x1*z3; 		/* rule 36 */
	 tx84 = -(x2*z3); 		/* rule 37 */
	 tx85 = -(y1*z3); 		/* rule 38 */
	 tx86 = y2*z3; 		/* rule 39 */
	 tx87 = tx69 + tx70 + tx71 + tx72 + tx73 + tx74; 		/* rule 40 */
	 tx88 = tx75 + tx76 + tx79 + tx80 + tx83 + tx84; 		/* rule 41 */
	 tx89 = tx77 + tx78 + tx81 + tx82 + tx85 + tx86; 		/* rule 42 */
	 tx90 = power2(tx87); 		/* rule 43 */
	 tx91 = power2(tx88); 		/* rule 44 */
	 tx92 = power2(tx89); 		/* rule 45 */
	 tx93 = tx90 + tx91 + tx92; 		/* rule 46 */
	 LenA = mysqrt(tx93); 		/* rule 47 */
	 tx94 = x4*y2; 		/* rule 48 */
	 tx95 = -(x4*y3); 		/* rule 49 */
	 tx96 = -(x2*y4); 		/* rule 50 */
	 tx97 = x3*y4; 		/* rule 51 */
	 tx98 = -(x4*z2); 		/* rule 52 */
	 tx99 = y4*z2; 		/* rule 53 */
	 tx100 = x4*z3; 		/* rule 54 */
	 tx101 = -(y4*z3); 		/* rule 55 */
	 tx102 = x2*z4; 		/* rule 56 */
	 tx103 = -(x3*z4); 		/* rule 57 */
	 tx104 = -(y2*z4); 		/* rule 58 */
	 tx105 = y3*z4; 		/* rule 59 */
	 tx106 = tx72 + tx74 + tx94 + tx95 + tx96 + tx97; 		/* rule 60 */
	 tx107 = tx100 + tx102 + tx103 + tx80 + tx84 + tx98; 		/* rule 61 */
	 tx108 = tx101 + tx104 + tx105 + tx82 + tx86 + tx99; 		/* rule 62 */
	 tx109 = power2(tx106); 		/* rule 63 */
	 tx110 = power2(tx107); 		/* rule 64 */
	 tx111 = power2(tx108); 		/* rule 65 */
	 tx112 = tx109 + tx110 + tx111; 		/* rule 66 */
	 LenB = mysqrt(tx112); 		/* rule 67 */
	 ReciprocalLenA = reciprocal(LenA); 		/* rule 68 */
	 ReciprocalLenB = reciprocal(LenB); 		/* rule 69 */
	if (fabs(LenA)<TENM3) ReciprocalLenA = 0.0;
	if (fabs(LenB)<TENM3) ReciprocalLenB = 0.0;
	 RecLenARecLenB = ReciprocalLenA*ReciprocalLenB; 		/* rule 72 */
	EraseLinearDihedral = 1.0;
	if (RecLenARecLenB==0.0) EraseLinearDihedral = 0.0;
	 tx113 = tx106*tx87; 		/* rule 75 */
	 tx114 = tx107*tx88; 		/* rule 76 */
	 tx115 = tx108*tx89; 		/* rule 77 */
	 tx116 = tx113 + tx114 + tx115; 		/* rule 78 */
	 CosPhi = RecLenARecLenB*tx116; 		/* rule 79 */
	 tx117 = -x3; 		/* rule 80 */
	 tx118 = -y3; 		/* rule 81 */
	 tx119 = -z3; 		/* rule 82 */
	 tx120 = tx117 + x2; 		/* rule 83 */
	 tx121 = tx118 + y2; 		/* rule 84 */
	 tx122 = tx119 + z2; 		/* rule 85 */
	 tx123 = power2(tx120); 		/* rule 86 */
	 tx124 = power2(tx121); 		/* rule 87 */
	 tx125 = power2(tx122); 		/* rule 88 */
	 tx126 = tx117 + x4; 		/* rule 89 */
	 tx127 = tx118 + y4; 		/* rule 90 */
	 tx128 = tx119 + z4; 		/* rule 91 */
	 tx129 = tx123 + tx124 + tx125; 		/* rule 92 */
	 tx130 = tx128*tx87; 		/* rule 93 */
	 tx131 = tx127*tx88; 		/* rule 94 */
	 tx132 = tx126*tx89; 		/* rule 95 */
	 tx133 = mysqrt(tx129); 		/* rule 96 */
	 tx134 = tx130 + tx131 + tx132; 		/* rule 97 */
	 SinPhi = RecLenARecLenB*tx133*tx134; 		/* rule 98 */
	CosPhi=MAX(-1.0,MIN(1.0,CosPhi));
/*CosNPhi = mathCosNPhi[IN,SinPhi,CosPhi];*/
/*SinNPhi = mathSinNPhi[IN,SinPhi,CosPhi];*/
switch(IN) {
 case 1:
   SinCos<1>::sinNPhiCosNPhi(SinNPhi,CosNPhi,SinPhi,CosPhi);
   break;
 case 2:
   SinCos<2>::sinNPhiCosNPhi(SinNPhi,CosNPhi,SinPhi,CosPhi);
   break;
 case 3:
   SinCos<3>::sinNPhiCosNPhi(SinNPhi,CosNPhi,SinPhi,CosPhi);
   break;
 case 4:
   SinCos<4>::sinNPhiCosNPhi(SinNPhi,CosNPhi,SinPhi,CosPhi);
   break;
 case 5:
   SinCos<5>::sinNPhiCosNPhi(SinNPhi,CosNPhi,SinPhi,CosPhi);
   break;
 case 6:
   SinCos<6>::sinNPhiCosNPhi(SinNPhi,CosNPhi,SinPhi,CosPhi);
   break;
 };
	 tx135 = CosNPhi*cosPhase; 		/* rule 103 */
	 tx136 = SinNPhi*sinPhase; 		/* rule 104 */
	 DihedralDeviation = 1. + tx135 + tx136; 		/* rule 105 */
	 Energy = DihedralDeviation*EraseLinearDihedral*V; 		/* rule 106 */
	DIHEDRAL_ENERGY_ACCUMULATE(Energy);
