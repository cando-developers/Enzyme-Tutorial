// C-code
	NONBOND_SET_PARAMETER(I1);
	NONBOND_SET_PARAMETER(I2);
	NONBOND_SET_PARAMETER(dQ1Q2);
	NONBOND_SET_PARAMETER(dA);
	NONBOND_SET_PARAMETER(dC);
	NONBOND_SET_POSITION(x1,I1,0);
	NONBOND_SET_POSITION(y1,I1,1);
	NONBOND_SET_POSITION(z1,I1,2);
	NONBOND_SET_POSITION(x2,I2,0);
	NONBOND_SET_POSITION(y2,I2,1);
	NONBOND_SET_POSITION(z2,I2,2);
	 tx15 = -x1; 		/* rule 12 */
	 DeltaX = tx15 + x2; 		/* rule 13 */
	 tx16 = -y1; 		/* rule 14 */
	 DeltaY = tx16 + y2; 		/* rule 15 */
	 tx17 = -z1; 		/* rule 16 */
	 DeltaZ = tx17 + z2; 		/* rule 17 */
	 tx18 = PBX(DeltaX); 		/* rule 18 */
	 tx19 = PBY(DeltaY); 		/* rule 19 */
	 tx20 = PBZ(DeltaZ); 		/* rule 20 */
	 tx21 = power2(tx18); 		/* rule 21 */
	 tx22 = power2(tx19); 		/* rule 22 */
	 tx23 = power2(tx20); 		/* rule 23 */
	 DistanceSquared = tx21 + tx22 + tx23; 		/* rule 24 */
BAIL_OUT_IF_CUTOFF(DistanceSquared);
	 tx35 = reciprocal(DistanceSquared); 		/* rule 26 */
	 tx33 = power2(tx35); 		/* rule 27 */
	 tx34 = tx35; 		/* rule 28 */
	 tx29 = tx33*tx34; 		/* rule 29 */
	 tx24 = power2(tx29); 		/* rule 30 */
	 tx30 = power2(tx34); 		/* rule 31 */
	 tx31 = tx34; 		/* rule 32 */
	 tx25 = tx30*tx31; 		/* rule 33 */
	 tx26 = dA*tx24; 		/* rule 34 */
	 tx27 = -(dC*tx25); 		/* rule 35 */
	 Evdw = tx26 + tx27; 		/* rule 36 */
	NONBOND_EVDW_ENERGY_ACCUMULATE(Evdw);
	 tx32 = mysqrt(DistanceSquared); 		/* rule 38 */
	 tx28 = reciprocal(tx32); 		/* rule 39 */
	 Eeel = dQ1Q2*tx28; 		/* rule 40 */
	NONBOND_EEEL_ENERGY_ACCUMULATE(Eeel);
	 Energy = Eeel + Evdw; 		/* rule 42 */
	NONBOND_ENERGY_ACCUMULATE(Energy);
