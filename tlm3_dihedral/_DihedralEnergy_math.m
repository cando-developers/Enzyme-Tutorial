{Name -> "DihedralEnergy", AdditionalCDeclares -> "", 
 Input -> {x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, V, DN, IN, 
   cosPhase, sinPhase}, Output -> {Energy, DihedralDeviation}, 
 EnergyFunction -> "NotUsed", DerivativeVariables -> 
  {x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4}, 
 Rules -> {CCode["DIHEDRAL_SET_PARAMETER(sinPhase);"], 
   CCode["DIHEDRAL_SET_PARAMETER(cosPhase);"], 
   CCode["DIHEDRAL_SET_PARAMETER(V);"], CCode["DIHEDRAL_SET_PARAMETER(DN);"], 
   CCode["DIHEDRAL_SET_PARAMETER(IN);"], 
   CCode["DIHEDRAL_SET_PARAMETER(I1);"], 
   CCode["DIHEDRAL_SET_PARAMETER(I2);"], 
   CCode["DIHEDRAL_SET_PARAMETER(I3);"], 
   CCode["DIHEDRAL_SET_PARAMETER(I4);"], 
   CCode["DIHEDRAL_SET_POSITION(x1,I1,0);"], 
   CCode["DIHEDRAL_SET_POSITION(y1,I1,1);"], 
   CCode["DIHEDRAL_SET_POSITION(z1,I1,2);"], 
   CCode["DIHEDRAL_SET_POSITION(x2,I2,0);"], 
   CCode["DIHEDRAL_SET_POSITION(y2,I2,1);"], 
   CCode["DIHEDRAL_SET_POSITION(z2,I2,2);"], 
   CCode["DIHEDRAL_SET_POSITION(x3,I3,0);"], 
   CCode["DIHEDRAL_SET_POSITION(y3,I3,1);"], 
   CCode["DIHEDRAL_SET_POSITION(z3,I3,2);"], 
   CCode["DIHEDRAL_SET_POSITION(x4,I4,0);"], 
   CCode["DIHEDRAL_SET_POSITION(y4,I4,1);"], 
   CCode["DIHEDRAL_SET_POSITION(z4,I4,2);"], -(x2*y1) -> tx69, x3*y1 -> tx70, 
   x1*y2 -> tx71, -(x3*y2) -> tx72, -(x1*y3) -> tx73, x2*y3 -> tx74, 
   x2*z1 -> tx75, -(x3*z1) -> tx76, -(y2*z1) -> tx77, y3*z1 -> tx78, 
   -(x1*z2) -> tx79, x3*z2 -> tx80, y1*z2 -> tx81, -(y3*z2) -> tx82, 
   x1*z3 -> tx83, -(x2*z3) -> tx84, -(y1*z3) -> tx85, y2*z3 -> tx86, 
   tx69 + tx70 + tx71 + tx72 + tx73 + tx74 -> tx87, 
   tx75 + tx76 + tx79 + tx80 + tx83 + tx84 -> tx88, 
   tx77 + tx78 + tx81 + tx82 + tx85 + tx86 -> tx89, power2[tx87] -> tx90, 
   power2[tx88] -> tx91, power2[tx89] -> tx92, tx90 + tx91 + tx92 -> tx93, 
   mysqrt[tx93] -> LenA, x4*y2 -> tx94, -(x4*y3) -> tx95, -(x2*y4) -> tx96, 
   x3*y4 -> tx97, -(x4*z2) -> tx98, y4*z2 -> tx99, x4*z3 -> tx100, 
   -(y4*z3) -> tx101, x2*z4 -> tx102, -(x3*z4) -> tx103, -(y2*z4) -> tx104, 
   y3*z4 -> tx105, tx72 + tx74 + tx94 + tx95 + tx96 + tx97 -> tx106, 
   tx100 + tx102 + tx103 + tx80 + tx84 + tx98 -> tx107, 
   tx101 + tx104 + tx105 + tx82 + tx86 + tx99 -> tx108, 
   power2[tx106] -> tx109, power2[tx107] -> tx110, power2[tx108] -> tx111, 
   tx109 + tx110 + tx111 -> tx112, mysqrt[tx112] -> LenB, 
   reciprocal[LenA] -> ReciprocalLenA, reciprocal[LenB] -> ReciprocalLenB, 
   CCode["if (fabs(LenA)<TENM3) ReciprocalLenA = 0.0;"], 
   CCode["if (fabs(LenB)<TENM3) ReciprocalLenB = 0.0;"], 
   ReciprocalLenA*ReciprocalLenB -> RecLenARecLenB, 
   CCode["EraseLinearDihedral = 1.0;"], 
   CCode["if (RecLenARecLenB==0.0) EraseLinearDihedral = 0.0;"], 
   tx106*tx87 -> tx113, tx107*tx88 -> tx114, tx108*tx89 -> tx115, 
   tx113 + tx114 + tx115 -> tx116, RecLenARecLenB*tx116 -> CosPhi, 
   -x3 -> tx117, -y3 -> tx118, -z3 -> tx119, tx117 + x2 -> tx120, 
   tx118 + y2 -> tx121, tx119 + z2 -> tx122, power2[tx120] -> tx123, 
   power2[tx121] -> tx124, power2[tx122] -> tx125, tx117 + x4 -> tx126, 
   tx118 + y4 -> tx127, tx119 + z4 -> tx128, tx123 + tx124 + tx125 -> tx129, 
   tx128*tx87 -> tx130, tx127*tx88 -> tx131, tx126*tx89 -> tx132, 
   mysqrt[tx129] -> tx133, tx130 + tx131 + tx132 -> tx134, 
   RecLenARecLenB*tx133*tx134 -> SinPhi, 
   CCode["CosPhi=MAX(-1.0,MIN(1.0,CosPhi));"], 
   MathCode["CosNPhi = mathCosNPhi[IN,SinPhi,CosPhi];"], 
   MathCode["SinNPhi = mathSinNPhi[IN,SinPhi,CosPhi];"], 
   CCode["sinNPhiCosNPhi(IN, &SinNPhi, &CosNPhi, SinPhi, CosPhi);"], 
   CosNPhi*cosPhase -> tx135, SinNPhi*sinPhase -> tx136, 
   1. + tx135 + tx136 -> DihedralDeviation, 
   DihedralDeviation*EraseLinearDihedral*V -> Energy, 
   CCode["DIHEDRAL_ENERGY_ACCUMULATE(Energy);"]}, 
 HessianStructure -> {{14, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36}, 
   {26, 15, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46}, 
   {27, 37, 16, 47, 48, 49, 50, 51, 52, 53, 54, 55}, 
   {28, 38, 47, 17, 56, 57, 58, 59, 60, 61, 62, 63}, 
   {29, 39, 48, 56, 18, 64, 65, 66, 67, 68, 69, 70}, 
   {30, 40, 49, 57, 64, 19, 71, 72, 73, 74, 75, 76}, 
   {31, 41, 50, 58, 65, 71, 20, 77, 78, 79, 80, 81}, 
   {32, 42, 51, 59, 66, 72, 77, 21, 82, 83, 84, 85}, 
   {33, 43, 52, 60, 67, 73, 78, 82, 22, 86, 87, 88}, 
   {34, 44, 53, 61, 68, 74, 79, 83, 86, 23, 89, 90}, 
   {35, 45, 54, 62, 69, 75, 80, 84, 87, 89, 24, 91}, 
   {36, 46, 55, 63, 70, 76, 81, 85, 88, 90, 91, 25}}, CCode -> "NOT USED", 
 MathCode -> "Block[{CosPhi,DihedralDeviation,Energy,LenA,LenB,ReciprocalLenA\
,ReciprocalLenB,RecLenARecLenB,SinPhi,tx100,tx101,tx102,tx103,tx104,tx105,tx1\
06,tx107,tx108,tx109,tx110,tx111,tx112,tx113,tx114,tx115,tx116,tx117,tx118,tx\
119,tx120,tx121,tx122,tx123,tx124,tx125,tx126,tx127,tx128,tx129,tx130,tx131,t\
x132,tx133,tx134,tx135,tx136,tx69,tx70,tx71,tx72,tx73,tx74,tx75,tx76,tx77,tx7\
8,tx79,tx80,tx81,tx82,tx83,tx84,tx85,tx86,tx87,tx88,tx89,tx90,tx91,tx92,tx93,\
tx94,tx95,tx96,tx97,tx98,tx99,xxxDummy},\n\t(*DIHEDRAL_SET_PARAMETER(sinPhase\
);*)\n\t(*DIHEDRAL_SET_PARAMETER(cosPhase);*)\n\t(*DIHEDRAL_SET_PARAMETER(V);\
*)\n\t(*DIHEDRAL_SET_PARAMETER(DN);*)\n\t(*DIHEDRAL_SET_PARAMETER(IN);*)\n\t(\
*DIHEDRAL_SET_PARAMETER(I1);*)\n\t(*DIHEDRAL_SET_PARAMETER(I2);*)\n\t(*DIHEDR\
AL_SET_PARAMETER(I3);*)\n\t(*DIHEDRAL_SET_PARAMETER(I4);*)\n\t(*DIHEDRAL_SET_\
POSITION(x1,I1,0);*)\n\t(*DIHEDRAL_SET_POSITION(y1,I1,1);*)\n\t(*DIHEDRAL_SET\
_POSITION(z1,I1,2);*)\n\t(*DIHEDRAL_SET_POSITION(x2,I2,0);*)\n\t(*DIHEDRAL_SE\
T_POSITION(y2,I2,1);*)\n\t(*DIHEDRAL_SET_POSITION(z2,I2,2);*)\n\t(*DIHEDRAL_S\
ET_POSITION(x3,I3,0);*)\n\t(*DIHEDRAL_SET_POSITION(y3,I3,1);*)\n\t(*DIHEDRAL_\
SET_POSITION(z3,I3,2);*)\n\t(*DIHEDRAL_SET_POSITION(x4,I4,0);*)\n\t(*DIHEDRAL\
_SET_POSITION(y4,I4,1);*)\n\t(*DIHEDRAL_SET_POSITION(z4,I4,2);*)\n\ttx69=-(x2 \
y1); (*Rule 22*)\n\ttx70=x3 y1; (*Rule 23*)\n\ttx71=x1 y2; (*Rule \
24*)\n\ttx72=-(x3 y2); (*Rule 25*)\n\ttx73=-(x1 y3); (*Rule 26*)\n\ttx74=x2 \
y3; (*Rule 27*)\n\ttx75=x2 z1; (*Rule 28*)\n\ttx76=-(x3 z1); (*Rule \
29*)\n\ttx77=-(y2 z1); (*Rule 30*)\n\ttx78=y3 z1; (*Rule 31*)\n\ttx79=-(x1 \
z2); (*Rule 32*)\n\ttx80=x3 z2; (*Rule 33*)\n\ttx81=y1 z2; (*Rule \
34*)\n\ttx82=-(y3 z2); (*Rule 35*)\n\ttx83=x1 z3; (*Rule 36*)\n\ttx84=-(x2 \
z3); (*Rule 37*)\n\ttx85=-(y1 z3); (*Rule 38*)\n\ttx86=y2 z3; (*Rule \
39*)\n\ttx87=tx69 + tx70 + tx71 + tx72 + tx73 + tx74; (*Rule \
40*)\n\ttx88=tx75 + tx76 + tx79 + tx80 + tx83 + tx84; (*Rule \
41*)\n\ttx89=tx77 + tx78 + tx81 + tx82 + tx85 + tx86; (*Rule 42*)\n\ttx90= \
mathPower2[tx87]; (*Rule 43*)\n\ttx91= mathPower2[tx88]; (*Rule 44*)\n\ttx92= \
mathPower2[tx89]; (*Rule 45*)\n\ttx93=tx90 + tx91 + tx92; (*Rule \
46*)\n\tLenA= mathSqrt[tx93]; (*Rule 47*)\n\ttx94=x4 y2; (*Rule \
48*)\n\ttx95=-(x4 y3); (*Rule 49*)\n\ttx96=-(x2 y4); (*Rule 50*)\n\ttx97=x3 \
y4; (*Rule 51*)\n\ttx98=-(x4 z2); (*Rule 52*)\n\ttx99=y4 z2; (*Rule \
53*)\n\ttx100=x4 z3; (*Rule 54*)\n\ttx101=-(y4 z3); (*Rule 55*)\n\ttx102=x2 \
z4; (*Rule 56*)\n\ttx103=-(x3 z4); (*Rule 57*)\n\ttx104=-(y2 z4); (*Rule \
58*)\n\ttx105=y3 z4; (*Rule 59*)\n\ttx106=tx72 + tx74 + tx94 + tx95 + tx96 + \
tx97; (*Rule 60*)\n\ttx107=tx100 + tx102 + tx103 + tx80 + tx84 + tx98; (*Rule \
61*)\n\ttx108=tx101 + tx104 + tx105 + tx82 + tx86 + tx99; (*Rule \
62*)\n\ttx109= mathPower2[tx106]; (*Rule 63*)\n\ttx110= mathPower2[tx107]; \
(*Rule 64*)\n\ttx111= mathPower2[tx108]; (*Rule 65*)\n\ttx112=tx109 + tx110 + \
tx111; (*Rule 66*)\n\tLenB= mathSqrt[tx112]; (*Rule 67*)\n\tReciprocalLenA= \
mathReciprocal[LenA]; (*Rule 68*)\n\tReciprocalLenB= mathReciprocal[LenB]; \
(*Rule 69*)\n\t(*if (fabs(LenA)<TENM3) ReciprocalLenA = 0.0;*)\n\t(*if \
(fabs(LenB)<TENM3) ReciprocalLenB = 0.0;*)\n\tRecLenARecLenB=ReciprocalLenA \
ReciprocalLenB; (*Rule 72*)\n\t(*EraseLinearDihedral = 1.0;*)\n\t(*if \
(RecLenARecLenB==0.0) EraseLinearDihedral = 0.0;*)\n\ttx113=tx106 tx87; \
(*Rule 75*)\n\ttx114=tx107 tx88; (*Rule 76*)\n\ttx115=tx108 tx89; (*Rule \
77*)\n\ttx116=tx113 + tx114 + tx115; (*Rule 78*)\n\tCosPhi=RecLenARecLenB \
tx116; (*Rule 79*)\n\ttx117=-x3; (*Rule 80*)\n\ttx118=-y3; (*Rule \
81*)\n\ttx119=-z3; (*Rule 82*)\n\ttx120=tx117 + x2; (*Rule \
83*)\n\ttx121=tx118 + y2; (*Rule 84*)\n\ttx122=tx119 + z2; (*Rule \
85*)\n\ttx123= mathPower2[tx120]; (*Rule 86*)\n\ttx124= mathPower2[tx121]; \
(*Rule 87*)\n\ttx125= mathPower2[tx122]; (*Rule 88*)\n\ttx126=tx117 + x4; \
(*Rule 89*)\n\ttx127=tx118 + y4; (*Rule 90*)\n\ttx128=tx119 + z4; (*Rule \
91*)\n\ttx129=tx123 + tx124 + tx125; (*Rule 92*)\n\ttx130=tx128 tx87; (*Rule \
93*)\n\ttx131=tx127 tx88; (*Rule 94*)\n\ttx132=tx126 tx89; (*Rule \
95*)\n\ttx133= mathSqrt[tx129]; (*Rule 96*)\n\ttx134=tx130 + tx131 + tx132; \
(*Rule 97*)\n\tSinPhi=RecLenARecLenB tx133 tx134; (*Rule \
98*)\n\t(*CosPhi=MAX(-1.0,MIN(1.0,CosPhi));*)\n\tCosNPhi = \
mathCosNPhi[IN,SinPhi,CosPhi];\n\tSinNPhi = \
mathSinNPhi[IN,SinPhi,CosPhi];\n\t(*sinNPhiCosNPhi(IN, &SinNPhi, &CosNPhi, \
SinPhi, CosPhi);*)\n\ttx135=CosNPhi cosPhase; (*Rule 103*)\n\ttx136=SinNPhi \
sinPhase; (*Rule 104*)\n\tDihedralDeviation=1. + tx135 + tx136; (*Rule \
105*)\n\tEnergy=DihedralDeviation EraseLinearDihedral V; (*Rule \
106*)\n\t(*DIHEDRAL_ENERGY_ACCUMULATE(Energy);*)\n{Energy, \
DihedralDeviation}]\n"}
