// C-code
	STRETCH_SET_PARAMETER(kb);
	STRETCH_SET_PARAMETER(r0);
	STRETCH_SET_PARAMETER(I1);
	STRETCH_SET_PARAMETER(I2);
	STRETCH_SET_POSITION(x1,I1,0);
	STRETCH_SET_POSITION(y1,I1,1);
	STRETCH_SET_POSITION(z1,I1,2);
	STRETCH_SET_POSITION(x2,I2,0);
	STRETCH_SET_POSITION(y2,I2,1);
	STRETCH_SET_POSITION(z2,I2,2);
	 tx14 = -x1; 		/* rule 11 */
	 tx15 = -y1; 		/* rule 12 */
	 tx16 = -z1; 		/* rule 13 */
	 tx17 = tx14 + x2; 		/* rule 14 */
	 tx18 = tx15 + y2; 		/* rule 15 */
	 tx19 = tx16 + z2; 		/* rule 16 */
	 tx20 = power2(tx17); 		/* rule 17 */
	 tx21 = power2(tx18); 		/* rule 18 */
	 tx22 = power2(tx19); 		/* rule 19 */
	 tx23 = tx20 + tx21 + tx22; 		/* rule 20 */
	 tx24 = -r0; 		/* rule 21 */
	 tx25 = mysqrt(tx23); 		/* rule 22 */
	 StretchDeviation = tx24 + tx25; 		/* rule 23 */
	 tx26 = power2(StretchDeviation); 		/* rule 24 */
	 Energy = kb*tx26; 		/* rule 25 */
	STRETCH_ENERGY_ACCUMULATE(Energy);
