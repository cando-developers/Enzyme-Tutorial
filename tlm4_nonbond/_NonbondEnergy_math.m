{Name -> "NonbondEnergy", AdditionalCDeclares -> "", 
 Input -> {x1, y1, z1, x2, y2, z2, dA, dC, dQ1Q2}, 
 Output -> {DeltaX, DeltaY, DeltaZ, Energy, Evdw, Eeel, NonbondDistance}, 
 EnergyFunction -> dA/(PBX[-x1 + x2]^2 + PBY[-y1 + y2]^2 + PBZ[-z1 + z2]^2)^
     6 - dC/(PBX[-x1 + x2]^2 + PBY[-y1 + y2]^2 + PBZ[-z1 + z2]^2)^3 + 
   dQ1Q2/Sqrt[PBX[-x1 + x2]^2 + PBY[-y1 + y2]^2 + PBZ[-z1 + z2]^2], 
 DerivativeVariables -> {x1, y1, z1, x2, y2, z2}, 
 Rules -> {CCode["NONBOND_SET_PARAMETER(I1);"], 
   CCode["NONBOND_SET_PARAMETER(I2);"], 
   CCode["NONBOND_SET_PARAMETER(dQ1Q2);"], 
   CCode["NONBOND_SET_PARAMETER(dA);"], CCode["NONBOND_SET_PARAMETER(dC);"], 
   CCode["NONBOND_SET_POSITION(x1,I1,0);"], 
   CCode["NONBOND_SET_POSITION(y1,I1,1);"], 
   CCode["NONBOND_SET_POSITION(z1,I1,2);"], 
   CCode["NONBOND_SET_POSITION(x2,I2,0);"], 
   CCode["NONBOND_SET_POSITION(y2,I2,1);"], 
   CCode["NONBOND_SET_POSITION(z2,I2,2);"], -x1 -> tx15, tx15 + x2 -> DeltaX, 
   -y1 -> tx16, tx16 + y2 -> DeltaY, -z1 -> tx17, tx17 + z2 -> DeltaZ, 
   PBX[DeltaX] -> tx18, PBY[DeltaY] -> tx19, PBZ[DeltaZ] -> tx20, 
   power2[tx18] -> tx21, power2[tx19] -> tx22, power2[tx20] -> tx23, 
   tx21 + tx22 + tx23 -> DistanceSquared, 
   CCode["BAIL_OUT_IF_CUTOFF(DistanceSquared)"], 
   reciprocal[DistanceSquared] -> tx35, power2[tx35] -> tx33, tx35 -> tx34, 
   tx33*tx34 -> tx29, power2[tx29] -> tx24, power2[tx34] -> tx30, 
   tx34 -> tx31, tx30*tx31 -> tx25, dA*tx24 -> tx26, -(dC*tx25) -> tx27, 
   tx26 + tx27 -> Evdw, CCode["NONBOND_EVDW_ENERGY_ACCUMULATE(Evdw);"], 
   mysqrt[DistanceSquared] -> tx32, reciprocal[tx32] -> tx28, 
   dQ1Q2*tx28 -> Eeel, CCode["NONBOND_EEEL_ENERGY_ACCUMULATE(Eeel);"], 
   Eeel + Evdw -> Energy, CCode["NONBOND_ENERGY_ACCUMULATE(Energy);"]}, 
 HessianStructure -> {{0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, 
   {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, 
   {0, 0, 0, 0, 0, 0}}, CCode -> "NOT USED", MathCode -> "Block[{DeltaX,Delta\
Y,DeltaZ,DistanceSquared,Eeel,Energy,Evdw,NonbondDistance,tx15,tx16,tx17,tx18\
,tx19,tx20,tx21,tx22,tx23,tx24,tx25,tx26,tx27,tx28,tx29,tx30,tx31,tx32,tx33,t\
x34,tx35,xxxDummy},\n\t(*NONBOND_SET_PARAMETER(I1);*)\n\t(*NONBOND_SET_PARAME\
TER(I2);*)\n\t(*NONBOND_SET_PARAMETER(dQ1Q2);*)\n\t(*NONBOND_SET_PARAMETER(dA\
);*)\n\t(*NONBOND_SET_PARAMETER(dC);*)\n\t(*NONBOND_SET_POSITION(x1,I1,0);*)\
\n\t(*NONBOND_SET_POSITION(y1,I1,1);*)\n\t(*NONBOND_SET_POSITION(z1,I1,2);*)\
\n\t(*NONBOND_SET_POSITION(x2,I2,0);*)\n\t(*NONBOND_SET_POSITION(y2,I2,1);*)\
\n\t(*NONBOND_SET_POSITION(z2,I2,2);*)\n\ttx15=-x1; (*Rule \
12*)\n\tDeltaX=tx15 + x2; (*Rule 13*)\n\ttx16=-y1; (*Rule 14*)\n\tDeltaY=tx16 \
+ y2; (*Rule 15*)\n\ttx17=-z1; (*Rule 16*)\n\tDeltaZ=tx17 + z2; (*Rule \
17*)\n\ttx18=PBX[DeltaX]; (*Rule 18*)\n\ttx19=PBY[DeltaY]; (*Rule \
19*)\n\ttx20=PBZ[DeltaZ]; (*Rule 20*)\n\ttx21= mathPower2[tx18]; (*Rule \
21*)\n\ttx22= mathPower2[tx19]; (*Rule 22*)\n\ttx23= mathPower2[tx20]; (*Rule \
23*)\n\tDistanceSquared=tx21 + tx22 + tx23; (*Rule \
24*)\n\t(*BAIL_OUT_IF_CUTOFF(DistanceSquared)*)\n\ttx35= \
mathReciprocal[DistanceSquared]; (*Rule 26*)\n\ttx33= mathPower2[tx35]; \
(*Rule 27*)\n\ttx34=tx35; (*Rule 28*)\n\ttx29=tx33 tx34; (*Rule 29*)\n\ttx24= \
mathPower2[tx29]; (*Rule 30*)\n\ttx30= mathPower2[tx34]; (*Rule \
31*)\n\ttx31=tx34; (*Rule 32*)\n\ttx25=tx30 tx31; (*Rule 33*)\n\ttx26=dA \
tx24; (*Rule 34*)\n\ttx27=-(dC tx25); (*Rule 35*)\n\tEvdw=tx26 + tx27; (*Rule \
36*)\n\t(*NONBOND_EVDW_ENERGY_ACCUMULATE(Evdw);*)\n\ttx32= \
mathSqrt[DistanceSquared]; (*Rule 38*)\n\ttx28= mathReciprocal[tx32]; (*Rule \
39*)\n\tEeel=dQ1Q2 tx28; (*Rule \
40*)\n\t(*NONBOND_EEEL_ENERGY_ACCUMULATE(Eeel);*)\n\tEnergy=Eeel + Evdw; \
(*Rule 42*)\n\t(*NONBOND_ENERGY_ACCUMULATE(Energy);*)\n{DeltaX, DeltaY, \
DeltaZ, Energy, Evdw, Eeel, NonbondDistance}]\n"}
