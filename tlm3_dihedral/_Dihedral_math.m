{Name -> "Dihedral", AdditionalCDeclares -> "", 
 Input -> {x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, V, DN, IN, 
   cosPhase, sinPhase}, Output -> {Energy, fx1, fy1, fz1, fx2, fy2, fz2, fx3, 
   fy3, fz3, fx4, fy4, fz4, dhx1x1, dhy1y1, dhz1z1, dhx2x2, dhy2y2, dhz2z2, 
   dhx3x3, dhy3y3, dhz3z3, dhx4x4, dhy4y4, dhz4z4, ohx1y1, ohx1z1, ohx1x2, 
   ohx1y2, ohx1z2, ohx1x3, ohx1y3, ohx1z3, ohx1x4, ohx1y4, ohx1z4, ohy1z1, 
   ohy1x2, ohy1y2, ohy1z2, ohy1x3, ohy1y3, ohy1z3, ohy1x4, ohy1y4, ohy1z4, 
   ohz1x2, ohz1y2, ohz1z2, ohz1x3, ohz1y3, ohz1z3, ohz1x4, ohz1y4, ohz1z4, 
   ohx2y2, ohx2z2, ohx2x3, ohx2y3, ohx2z3, ohx2x4, ohx2y4, ohx2z4, ohy2z2, 
   ohy2x3, ohy2y3, ohy2z3, ohy2x4, ohy2y4, ohy2z4, ohz2x3, ohz2y3, ohz2z3, 
   ohz2x4, ohz2y4, ohz2z4, ohx3y3, ohx3z3, ohx3x4, ohx3y4, ohx3z4, ohy3z3, 
   ohy3x4, ohy3y4, ohy3z4, ohz3x4, ohz3y4, ohz3z4, ohx4y4, ohx4z4, ohy4z4, 
   DihedralDeviation}, EnergyFunction -> "NotUsed", 
 DerivativeVariables -> {x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4}, 
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
   CCode["DIHEDRAL_SET_POSITION(z4,I4,2);"], -(x2*y1) -> tx907, 
   x3*y1 -> tx908, x1*y2 -> tx909, -(x3*y2) -> tx910, -(x1*y3) -> tx911, 
   x2*y3 -> tx912, x2*z1 -> tx913, -(x3*z1) -> tx914, -(y2*z1) -> tx915, 
   y3*z1 -> tx916, -(x1*z2) -> tx917, x3*z2 -> tx918, y1*z2 -> tx919, 
   -(y3*z2) -> tx920, x1*z3 -> tx921, -(x2*z3) -> tx922, -(y1*z3) -> tx923, 
   y2*z3 -> tx924, tx907 + tx908 + tx909 + tx910 + tx911 + tx912 -> tx925, 
   tx913 + tx914 + tx917 + tx918 + tx921 + tx922 -> tx926, 
   tx915 + tx916 + tx919 + tx920 + tx923 + tx924 -> tx927, 
   power2[tx925] -> tx928, power2[tx926] -> tx929, power2[tx927] -> tx930, 
   tx928 + tx929 + tx930 -> tx931, mysqrt[tx931] -> LenA, x4*y2 -> tx932, 
   -(x4*y3) -> tx933, -(x2*y4) -> tx934, x3*y4 -> tx935, -(x4*z2) -> tx936, 
   y4*z2 -> tx937, x4*z3 -> tx938, -(y4*z3) -> tx939, x2*z4 -> tx940, 
   -(x3*z4) -> tx941, -(y2*z4) -> tx942, y3*z4 -> tx943, 
   tx910 + tx912 + tx932 + tx933 + tx934 + tx935 -> tx944, 
   tx918 + tx922 + tx936 + tx938 + tx940 + tx941 -> tx945, 
   tx920 + tx924 + tx937 + tx939 + tx942 + tx943 -> tx946, 
   power2[tx944] -> tx947, power2[tx945] -> tx948, power2[tx946] -> tx949, 
   tx947 + tx948 + tx949 -> tx950, mysqrt[tx950] -> LenB, 
   reciprocal[LenA] -> ReciprocalLenA, reciprocal[LenB] -> ReciprocalLenB, 
   CCode["if (fabs(LenA)<TENM3) ReciprocalLenA = 0.0;"], 
   CCode["if (fabs(LenB)<TENM3) ReciprocalLenB = 0.0;"], 
   ReciprocalLenA*ReciprocalLenB -> RecLenARecLenB, 
   CCode["EraseLinearDihedral = 1.0;"], 
   CCode["if (RecLenARecLenB==0.0) EraseLinearDihedral = 0.0;"], 
   tx925*tx944 -> tx951, tx926*tx945 -> tx952, tx927*tx946 -> tx953, 
   tx951 + tx952 + tx953 -> tx954, RecLenARecLenB*tx954 -> CosPhi, 
   -x3 -> tx955, -y3 -> tx956, -z3 -> tx957, tx955 + x2 -> tx958, 
   tx956 + y2 -> tx959, tx957 + z2 -> tx960, power2[tx958] -> tx961, 
   power2[tx959] -> tx962, power2[tx960] -> tx963, tx955 + x4 -> tx964, 
   tx956 + y4 -> tx965, tx957 + z4 -> tx966, tx961 + tx962 + tx963 -> tx967, 
   tx927*tx964 -> tx968, tx926*tx965 -> tx969, tx925*tx966 -> tx970, 
   mysqrt[tx967] -> tx971, tx968 + tx969 + tx970 -> tx972, 
   RecLenARecLenB*tx971*tx972 -> SinPhi, 
   CCode["CosPhi=MAX(-1.0,MIN(1.0,CosPhi));"], 
   MathCode["CosNPhi = mathCosNPhi[IN,SinPhi,CosPhi];"], 
   MathCode["SinNPhi = mathSinNPhi[IN,SinPhi,CosPhi];"], 
   CCode["sinNPhiCosNPhi(IN, &SinNPhi, &CosNPhi, SinPhi, CosPhi);"], 
   CosNPhi*cosPhase -> tx973, SinNPhi*sinPhase -> tx974, 
   1. + tx973 + tx974 -> DihedralDeviation, 
   DihedralDeviation*EraseLinearDihedral*V -> Energy, 
   CCode["DIHEDRAL_ENERGY_ACCUMULATE(Energy);"], 
   CCode["#ifdef DIHEDRAL_CALC_FORCE //["], CCode["if (calcForce ) {"], 
   cosPhase*SinNPhi -> tx975, -(CosNPhi*sinPhase) -> tx976, 
   tx975 + tx976 -> tx977, -(DN*EraseLinearDihedral*tx977*V) -> DeDPhi, 
   reciprocal[tx931] -> tx978, -(DeDPhi*tx927*tx971*tx978) -> gx1, 
   -gx1 -> fx1, CCode["DIHEDRAL_FORCE_ACCUMULATE(I1, 0, fx1 );"], 
   -(DeDPhi*tx926*tx971*tx978) -> gy1, -gy1 -> fy1, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I1, 1, fy1 );"], 
   -(DeDPhi*tx925*tx971*tx978) -> gz1, -gz1 -> fz1, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I1, 2, fz1 );"], -x2 -> tx979, 
   -y2 -> tx980, -z2 -> tx981, tx979 + x1 -> tx982, tx980 + y1 -> tx983, 
   tx981 + z1 -> tx984, tx958*tx964 -> tx985, tx959*tx965 -> tx986, 
   tx960*tx966 -> tx987, tx958*tx982 -> tx988, tx959*tx983 -> tx989, 
   tx960*tx984 -> tx990, reciprocal[tx950] -> tx991, 
   reciprocal[tx971] -> tx992, tx985 + tx986 + tx987 -> tx993, 
   tx988 + tx989 + tx990 -> tx994, tx927*tx971*tx978 -> tx995, 
   -(tx946*tx991*tx992*tx993) -> tx996, tx927*tx978*tx992*tx994 -> tx997, 
   tx995 + tx996 + tx997 -> tx998, DeDPhi*tx998 -> gx2, -gx2 -> fx2, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I2, 0, fx2 );"], 
   tx926*tx971*tx978 -> tx999, -(tx945*tx991*tx992*tx993) -> tx1000, 
   tx926*tx978*tx992*tx994 -> tx1001, tx1000 + tx1001 + tx999 -> tx1002, 
   DeDPhi*tx1002 -> gy2, -gy2 -> fy2, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I2, 1, fy2 );"], 
   tx925*tx971*tx978 -> tx1003, -(tx944*tx991*tx992*tx993) -> tx1004, 
   tx925*tx978*tx992*tx994 -> tx1005, tx1003 + tx1004 + tx1005 -> tx1006, 
   DeDPhi*tx1006 -> gz2, -gz2 -> fz2, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I2, 2, fz2 );"], 
   -(tx946*tx971*tx991) -> tx1007, tx946*tx991*tx992*tx993 -> tx1008, 
   -tx997 -> tx1009, tx1007 + tx1008 + tx1009 -> tx1010, 
   DeDPhi*tx1010 -> gx3, -gx3 -> fx3, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I3, 0, fx3 );"], -tx1001 -> tx1011, 
   -(tx945*tx971*tx991) -> tx1012, tx945*tx991*tx992*tx993 -> tx1013, 
   tx1011 + tx1012 + tx1013 -> tx1014, DeDPhi*tx1014 -> gy3, -gy3 -> fy3, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I3, 1, fy3 );"], -tx1005 -> tx1015, 
   -(tx944*tx971*tx991) -> tx1016, tx944*tx991*tx992*tx993 -> tx1017, 
   tx1015 + tx1016 + tx1017 -> tx1018, DeDPhi*tx1018 -> gz3, -gz3 -> fz3, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I3, 2, fz3 );"], 
   DeDPhi*tx946*tx971*tx991 -> gx4, -gx4 -> fx4, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I4, 0, fx4 );"], 
   DeDPhi*tx945*tx971*tx991 -> gy4, -gy4 -> fy4, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I4, 1, fy4 );"], 
   DeDPhi*tx944*tx971*tx991 -> gz4, -gz4 -> fz4, 
   CCode["DIHEDRAL_FORCE_ACCUMULATE(I4, 2, fz4 );"], 
   CCode["#ifdef DIHEDRAL_CALC_DIAGONAL_HESSIAN //["], 
   CCode["if (calcDiagonalHessian) {"], power2[y2] -> tx1019, 
   power2[y3] -> tx1020, power2[z2] -> tx1021, power2[z3] -> tx1022, 
   tx1019*tx955 -> tx1023, tx1021*tx955 -> tx1024, tx908*tx956 -> tx1025, 
   tx1020*tx979 -> tx1026, tx1022*tx979 -> tx1027, tx913*tx981 -> tx1028, 
   tx1019*x1 -> tx1029, tx1020*x1 -> tx1030, tx1021*x1 -> tx1031, 
   tx1022*x1 -> tx1032, tx912*y1 -> tx1033, tx907*y2 -> tx1034, 
   tx908*y2 -> tx1035, tx912*y2 -> tx1036, -2.*tx909*y3 -> tx1037, 
   x3*y2*y3 -> tx1038, tx918*z1 -> tx1039, -2.*tx921*z2 -> tx1040, 
   tx913*z3 -> tx1041, tx914*z3 -> tx1042, tx918*z3 -> tx1043, 
   x2*z2*z3 -> tx1044, power2[DN] -> tx1045, 
   tx1023 + tx1024 + tx1025 + tx1026 + tx1027 + tx1028 + tx1029 + tx1030 + 
     tx1031 + tx1032 + tx1033 + tx1034 + tx1035 + tx1036 + tx1037 + tx1038 + 
     tx1039 + tx1040 + tx1041 + tx1042 + tx1043 + tx1044 -> tx1046, 
   power2[tx978] -> tx1047, tx973 + tx974 -> tx1048, 
   2.*DeDPhi*tx1046*tx1047*tx927*tx971 -> tx1049, 
   -(tx1045*tx1047*tx1048*tx930*tx967*V) -> tx1050, 
   tx1049 + tx1050 -> dhx1x1, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I1, 0, dhx1x1);"], 
   power2[x2] -> tx1051, power2[x3] -> tx1052, tx1021*tx956 -> tx1053, 
   tx1051*tx956 -> tx1054, tx916*tx957 -> tx1055, tx909*tx979 -> tx1056, 
   tx1022*tx980 -> tx1057, tx1052*tx980 -> tx1058, tx912*x1 -> tx1059, 
   -2.*tx908*x2 -> tx1060, tx909*x3 -> tx1061, tx911*x3 -> tx1062, 
   tx912*x3 -> tx1063, tx1021*y1 -> tx1064, tx1022*y1 -> tx1065, 
   tx1051*y1 -> tx1066, tx1052*y1 -> tx1067, x2*x3*y2 -> tx1068, 
   tx924*z1 -> tx1069, tx915*z2 -> tx1070, tx916*z2 -> tx1071, 
   tx924*z2 -> tx1072, -2.*tx919*z3 -> tx1073, y3*z2*z3 -> tx1074, 
   tx1053 + tx1054 + tx1055 + tx1056 + tx1057 + tx1058 + tx1059 + tx1060 + 
     tx1061 + tx1062 + tx1063 + tx1064 + tx1065 + tx1066 + tx1067 + tx1068 + 
     tx1069 + tx1070 + tx1071 + tx1072 + tx1073 + tx1074 -> tx1075, 
   2.*DeDPhi*tx1047*tx1075*tx926*tx971 -> tx1076, 
   -(tx1045*tx1047*tx1048*tx929*tx967*V) -> tx1077, 
   tx1076 + tx1077 -> dhy1y1, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I1, 1, dhy1y1);"], 
   tx921*tx955 -> tx1078, tx1019*tx957 -> tx1079, tx1051*tx957 -> tx1080, 
   tx919*tx980 -> tx1081, tx1020*tx981 -> tx1082, tx1052*tx981 -> tx1083, 
   tx918*x1 -> tx1084, tx917*x2 -> tx1085, tx918*x2 -> tx1086, 
   tx921*x2 -> tx1087, -2.*tx913*x3 -> tx1088, tx924*y1 -> tx1089, 
   -2.*tx916*y2 -> tx1090, tx919*y3 -> tx1091, tx923*y3 -> tx1092, 
   tx924*y3 -> tx1093, tx1019*z1 -> tx1094, tx1020*z1 -> tx1095, 
   tx1051*z1 -> tx1096, tx1052*z1 -> tx1097, y2*y3*z2 -> tx1098, 
   x2*x3*z3 -> tx1099, tx1078 + tx1079 + tx1080 + tx1081 + tx1082 + tx1083 + 
     tx1084 + tx1085 + tx1086 + tx1087 + tx1088 + tx1089 + tx1090 + tx1091 + 
     tx1092 + tx1093 + tx1094 + tx1095 + tx1096 + tx1097 + tx1098 + tx1099 -> 
    tx1100, 2.*DeDPhi*tx1047*tx1100*tx925*tx971 -> tx1101, 
   -(tx1045*tx1047*tx1048*tx928*tx967*V) -> tx1102, 
   tx1101 + tx1102 -> dhz1z1, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I1, 2, dhz1z1);"], 
   power2[y1] -> tx1103, power2[z1] -> tx1104, -tx1029 -> tx1105, 
   -tx1030 -> tx1106, -tx1031 -> tx1107, -tx1032 -> tx1108, 
   2.*tx1035 -> tx1109, 2.*tx1039 -> tx1110, tx1103*tx955 -> tx1111, 
   tx1104*tx955 -> tx1112, tx909*tx956 -> tx1113, tx913*tx957 -> tx1114, 
   tx918*tx957 -> tx1115, tx908*tx980 -> tx1116, tx912*tx980 -> tx1117, 
   tx1020*x2 -> tx1118, tx1022*x2 -> tx1119, tx1103*x2 -> tx1120, 
   tx1104*x2 -> tx1121, tx1019*x3 -> tx1122, tx1021*x3 -> tx1123, 
   -(tx909*y1) -> tx1124, x2*y1*y2 -> tx1125, tx907*y3 -> tx1126, 
   tx908*y3 -> tx1127, 2.*tx909*y3 -> tx1128, tx910*y3 -> tx1129, 
   x1*y1*y3 -> tx1130, tx917*z1 -> tx1131, tx921*z1 -> tx1132, 
   tx913*z2 -> tx1133, tx914*z2 -> tx1134, 2.*tx921*z2 -> tx1135, 
   tx922*z2 -> tx1136, tx917*z3 -> tx1137, x3*z1*z3 -> tx1138, 
   tx1023 + tx1024 + tx1028 + tx1029 + tx1031 + tx1034 + tx1036 + tx1044 + 
     tx1109 + tx1110 + tx1111 + tx1112 + tx1113 + tx1114 + tx1120 + tx1121 + 
     tx1124 + tx1126 + tx1130 + tx1131 + tx1132 + tx1137 -> tx1139, 
   tx1105 + tx1106 + tx1107 + tx1108 + tx1114 + tx1115 + tx1116 + tx1117 + 
     tx1118 + tx1119 + tx1122 + tx1123 + tx1125 + tx1126 + tx1127 + tx1128 + 
     tx1129 + tx1133 + tx1134 + tx1135 + tx1136 + tx1138 -> tx1140, 
   power2[y4] -> tx1141, power2[z4] -> tx1142, -2.*tx1035 -> tx1143, 
   -2.*tx1039 -> tx1144, -tx1132 -> tx1145, tx932*tx956 -> tx1146, 
   tx935*tx956 -> tx1147, tx1139*tx927*tx967 -> tx1148, 
   tx1103*tx979 -> tx1149, tx1104*tx979 -> tx1150, tx1141*tx979 -> tx1151, 
   tx1142*tx979 -> tx1152, tx940*tx981 -> tx1153, 
   tx1140*tx927*tx994 -> tx1154, tx1103*x3 -> tx1155, tx1104*x3 -> tx1156, 
   tx1141*x3 -> tx1157, tx1142*x3 -> tx1158, tx1019*x4 -> tx1159, 
   tx1020*x4 -> tx1160, tx1021*x4 -> tx1161, tx1022*x4 -> tx1162, 
   tx909*y1 -> tx1163, tx911*y1 -> tx1164, tx934*y2 -> tx1165, 
   tx935*y2 -> tx1166, tx909*y3 -> tx1167, -2.*tx932*y3 -> tx1168, 
   tx910*y4 -> tx1169, tx912*y4 -> tx1170, 2.*tx1170 -> tx1171, 
   tx932*y4 -> tx1172, tx933*y4 -> tx1173, tx921*z2 -> tx1174, 
   -2.*tx938*z2 -> tx1175, x1*z1*z2 -> tx1176, tx936*z3 -> tx1177, 
   tx940*z3 -> tx1178, 2.*tx1178 -> tx1179, tx941*z3 -> tx1180, 
   -(tx918*z4) -> tx1181, tx918*z4 -> tx1182, -(tx938*z4) -> tx1183, 
   x4*z2*z4 -> tx1184, tx1171 -> tx1185, tx1179 -> tx1186, 
   tx1148 + tx1154 -> tx1187, tx1033 + tx1041 + tx1105 + tx1107 + tx1117 + 
     tx1122 + tx1123 + tx1125 + tx1133 + tx1136 + tx1143 + tx1144 + tx1145 + 
     tx1149 + tx1150 + tx1155 + tx1156 + tx1163 + tx1164 + tx1167 + tx1174 + 
     tx1176 -> tx1188, tx1023 + tx1024 + tx1026 + tx1027 + tx1036 + tx1038 + 
     tx1043 + tx1044 + tx1147 + tx1153 + tx1159 + tx1160 + tx1161 + tx1162 + 
     tx1165 + tx1166 + tx1168 + tx1170 + tx1175 + tx1178 + tx1180 + tx1182 -> 
    tx1189, tx1026 + tx1027 + tx1038 + tx1043 + tx1146 + tx1147 + tx1151 + 
     tx1152 + tx1157 + tx1158 + tx1160 + tx1162 + tx1169 + tx1172 + tx1173 + 
     tx1177 + tx1180 + tx1181 + tx1183 + tx1184 + tx1185 + tx1186 -> tx1190, 
   power2[tx991] -> tx1191, tx967 -> tx1813, reciprocal[tx1813] -> tx1814, 
   tx992 -> tx1815, tx1814*tx1815 -> tx1192, 2.*tx1046*tx1047*tx927*tx971 -> 
    tx1193, tx1046*tx1192*tx927*tx978 -> tx1194, 
   -(tx1189*tx1192*tx946*tx991) -> tx1195, -2.*tx1047*tx1187*tx1815 -> 
    tx1196, -2.*tx1190*tx1191*tx1815*tx946*tx993 -> tx1197, 
   2.*tx1047*tx1188*tx1815*tx927*tx994 -> tx1198, 
   tx1193 + tx1194 + tx1195 + tx1196 + tx1197 + tx1198 -> tx1199, 
   power2[tx998] -> tx1200, DeDPhi*tx1199 -> tx1201, 
   -(tx1045*tx1048*tx1200*V) -> tx1202, tx1201 + tx1202 -> dhx2x2, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I2, 0, dhx2x2);"], 
   power2[x1] -> tx1203, 2.*tx1059 -> tx1204, -tx1064 -> tx1205, 
   -tx1065 -> tx1206, -tx1066 -> tx1207, -tx1067 -> tx1208, 
   2.*tx1071 -> tx1209, tx909*tx955 -> tx1210, tx912*tx955 -> tx1211, 
   tx1104*tx956 -> tx1212, tx1203*tx956 -> tx1213, tx919*tx957 -> tx1214, 
   tx916*tx981 -> tx1215, tx924*tx981 -> tx1216, tx907*x1 -> tx1217, 
   tx908*x1 -> tx1218, 2.*tx908*x2 -> tx1219, tx909*x2 -> tx1220, 
   tx910*x2 -> tx1221, tx911*x2 -> tx1222, tx907*x3 -> tx1223, 
   tx1022*y2 -> tx1224, tx1052*y2 -> tx1225, tx1104*y2 -> tx1226, 
   tx1203*y2 -> tx1227, tx1021*y3 -> tx1228, tx1051*y3 -> tx1229, 
   x1*x3*y3 -> tx1230, -(tx919*z1) -> tx1231, y2*z1*z2 -> tx1232, 
   tx915*z3 -> tx1233, tx916*z3 -> tx1234, 2.*tx919*z3 -> tx1235, 
   tx920*z3 -> tx1236, y1*z1*z3 -> tx1237, 
   tx1205 + tx1206 + tx1207 + tx1208 + tx1210 + tx1211 + tx1215 + tx1216 + 
     tx1219 + tx1220 + tx1221 + tx1222 + tx1224 + tx1225 + tx1228 + tx1229 + 
     tx1230 + tx1232 + tx1233 + tx1234 + tx1235 + tx1236 -> tx1238, 
   tx1053 + tx1054 + tx1056 + tx1064 + tx1066 + tx1068 + tx1070 + tx1072 + 
     tx1204 + tx1209 + tx1210 + tx1212 + tx1213 + tx1214 + tx1217 + tx1218 + 
     tx1223 + tx1226 + tx1227 + tx1231 + tx1233 + tx1237 -> tx1239, 
   power2[x4] -> tx1240, -2.*tx1059 -> tx1241, -2.*tx1071 -> tx1242, 
   -tx1218 -> tx1243, tx937*tx957 -> tx1244, tx943*tx957 -> tx1245, 
   tx1239*tx1813*tx926 -> tx1246, tx932*tx979 -> tx1247, 
   tx1104*tx980 -> tx1248, tx1142*tx980 -> tx1249, tx1203*tx980 -> tx1250, 
   tx1240*tx980 -> tx1251, tx1238*tx926*tx994 -> tx1252, tx908*x2 -> tx1253, 
   -2.*tx935*x2 -> tx1254, tx932*x3 -> tx1255, 2.*tx1255 -> tx1256, 
   tx933*x3 -> tx1257, tx934*x3 -> tx1258, -(tx912*x4) -> tx1259, 
   tx912*x4 -> tx1260, -(tx935*x4) -> tx1261, x1*x2*y1 -> tx1262, 
   tx1104*y3 -> tx1263, tx1142*y3 -> tx1264, tx1203*y3 -> tx1265, 
   tx1240*y3 -> tx1266, tx1021*y4 -> tx1267, tx1022*y4 -> tx1268, 
   tx1051*y4 -> tx1269, tx1052*y4 -> tx1270, x2*x4*y4 -> tx1271, 
   tx919*z1 -> tx1272, tx923*z1 -> tx1273, tx942*z2 -> tx1274, 
   tx943*z2 -> tx1275, tx919*z3 -> tx1276, -2.*tx937*z3 -> tx1277, 
   tx920*z4 -> tx1278, tx924*z4 -> tx1279, 2.*tx1279 -> tx1280, 
   tx937*z4 -> tx1281, tx939*z4 -> tx1282, tx1256 -> tx1283, 
   tx1280 -> tx1284, tx1246 + tx1252 -> tx1285, 
   tx1061 + tx1069 + tx1205 + tx1207 + tx1216 + tx1220 + tx1221 + tx1228 + 
     tx1229 + tx1232 + tx1241 + tx1242 + tx1243 + tx1248 + tx1250 + tx1253 + 
     tx1262 + tx1263 + tx1265 + tx1272 + tx1273 + tx1276 -> tx1286, 
   tx1053 + tx1054 + tx1057 + tx1058 + tx1063 + tx1068 + tx1072 + tx1074 + 
     tx1245 + tx1247 + tx1254 + tx1255 + tx1257 + tx1260 + tx1267 + tx1268 + 
     tx1269 + tx1270 + tx1274 + tx1275 + tx1277 + tx1279 -> tx1287, 
   tx1057 + tx1058 + tx1063 + tx1074 + tx1244 + tx1245 + tx1249 + tx1251 + 
     tx1257 + tx1258 + tx1259 + tx1261 + tx1264 + tx1266 + tx1268 + tx1270 + 
     tx1271 + tx1278 + tx1281 + tx1282 + tx1283 + tx1284 -> tx1288, 
   2.*tx1047*tx1075*tx926*tx971 -> tx1289, tx1075*tx1192*tx926*tx978 -> 
    tx1290, -(tx1192*tx1287*tx945*tx991) -> tx1291, 
   -2.*tx1047*tx1285*tx1815 -> tx1292, 
   -2.*tx1191*tx1288*tx1815*tx945*tx993 -> tx1293, 
   2.*tx1047*tx1286*tx1815*tx926*tx994 -> tx1294, power2[tx1002] -> tx1295, 
   tx1289 + tx1290 + tx1291 + tx1292 + tx1293 + tx1294 -> tx1296, 
   DeDPhi*tx1296 -> tx1297, -(tx1045*tx1048*tx1295*V) -> tx1298, 
   tx1297 + tx1298 -> dhy2y2, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I2, 1, dhy2y2);"], 
   2.*tx1087 -> tx1299, 2.*tx1089 -> tx1300, -tx1094 -> tx1301, 
   -tx1095 -> tx1302, -tx1096 -> tx1303, -tx1097 -> tx1304, 
   tx913*tx955 -> tx1305, tx919*tx956 -> tx1306, tx924*tx956 -> tx1307, 
   tx1103*tx957 -> tx1308, tx1203*tx957 -> tx1309, tx918*tx979 -> tx1310, 
   tx921*tx979 -> tx1311, -(tx913*x1) -> tx1312, 2.*tx913*x3 -> tx1313, 
   tx917*x3 -> tx1314, tx921*x3 -> tx1315, tx922*x3 -> tx1316, 
   tx915*y1 -> tx1317, tx916*y1 -> tx1318, 2.*tx916*y2 -> tx1319, 
   tx919*y2 -> tx1320, tx920*y2 -> tx1321, tx923*y2 -> tx1322, 
   tx915*y3 -> tx1323, x1*x3*z1 -> tx1324, tx1020*z2 -> tx1325, 
   tx1052*z2 -> tx1326, tx1103*z2 -> tx1327, tx1203*z2 -> tx1328, 
   x1*x2*z2 -> tx1329, tx1019*z3 -> tx1330, tx1051*z3 -> tx1331, 
   y1*y3*z3 -> tx1332, tx1079 + tx1080 + tx1081 + tx1085 + tx1086 + tx1094 + 
     tx1096 + tx1098 + tx1299 + tx1300 + tx1305 + tx1306 + tx1308 + tx1309 + 
     tx1312 + tx1314 + tx1317 + tx1318 + tx1323 + tx1324 + tx1327 + tx1328 -> 
    tx1333, tx1301 + tx1302 + tx1303 + tx1304 + tx1306 + tx1307 + tx1310 + 
     tx1311 + tx1313 + tx1314 + tx1315 + tx1316 + tx1319 + tx1320 + tx1321 + 
     tx1322 + tx1325 + tx1326 + tx1329 + tx1330 + tx1331 + tx1332 -> tx1334, 
   -2.*tx1087 -> tx1335, -2.*tx1089 -> tx1336, -tx1318 -> tx1337, 
   tx938*tx955 -> tx1338, tx940*tx955 -> tx1339, 
   tx1333*tx1813*tx925 -> tx1340, tx937*tx980 -> tx1341, 
   tx1103*tx981 -> tx1342, tx1141*tx981 -> tx1343, tx1203*tx981 -> tx1344, 
   tx1240*tx981 -> tx1345, tx1334*tx925*tx994 -> tx1346, tx913*x1 -> tx1347, 
   tx914*x1 -> tx1348, tx936*x2 -> tx1349, tx938*x2 -> tx1350, 
   tx913*x3 -> tx1351, -2.*tx940*x3 -> tx1352, tx918*x4 -> tx1353, 
   2.*tx1353 -> tx1354, tx922*x4 -> tx1355, tx940*x4 -> tx1356, 
   tx941*x4 -> tx1357, tx916*y2 -> tx1358, -2.*tx943*y2 -> tx1359, 
   tx937*y3 -> tx1360, 2.*tx1360 -> tx1361, tx939*y3 -> tx1362, 
   tx942*y3 -> tx1363, -(tx924*y4) -> tx1364, tx924*y4 -> tx1365, 
   -(tx943*y4) -> tx1366, y1*y2*z1 -> tx1367, tx1103*z3 -> tx1368, 
   tx1141*z3 -> tx1369, tx1203*z3 -> tx1370, tx1240*z3 -> tx1371, 
   tx1019*z4 -> tx1372, tx1020*z4 -> tx1373, tx1051*z4 -> tx1374, 
   tx1052*z4 -> tx1375, y2*y4*z4 -> tx1376, tx1354 -> tx1377, 
   tx1361 -> tx1378, tx1340 + tx1346 -> tx1379, 
   tx1084 + tx1091 + tx1301 + tx1303 + tx1310 + tx1320 + tx1321 + tx1329 + 
     tx1330 + tx1331 + tx1335 + tx1336 + tx1337 + tx1342 + tx1344 + tx1347 + 
     tx1348 + tx1351 + tx1358 + tx1367 + tx1368 + tx1370 -> tx1380, 
   tx1079 + tx1080 + tx1082 + tx1083 + tx1086 + tx1093 + tx1098 + tx1099 + 
     tx1338 + tx1341 + tx1349 + tx1350 + tx1352 + tx1353 + tx1359 + tx1360 + 
     tx1362 + tx1365 + tx1372 + tx1373 + tx1374 + tx1375 -> tx1381, 
   tx1082 + tx1083 + tx1093 + tx1099 + tx1338 + tx1339 + tx1343 + tx1345 + 
     tx1355 + tx1356 + tx1357 + tx1362 + tx1363 + tx1364 + tx1366 + tx1369 + 
     tx1371 + tx1373 + tx1375 + tx1376 + tx1377 + tx1378 -> tx1382, 
   2.*tx1047*tx1100*tx925*tx971 -> tx1383, tx1100*tx1192*tx925*tx978 -> 
    tx1384, -(tx1192*tx1381*tx944*tx991) -> tx1385, 
   -2.*tx1047*tx1379*tx1815 -> tx1386, 
   -2.*tx1191*tx1382*tx1815*tx944*tx993 -> tx1387, 
   2.*tx1047*tx1380*tx1815*tx925*tx994 -> tx1388, power2[tx1006] -> tx1389, 
   tx1383 + tx1384 + tx1385 + tx1386 + tx1387 + tx1388 -> tx1390, 
   DeDPhi*tx1390 -> tx1391, -(tx1045*tx1048*tx1389*V) -> tx1392, 
   tx1391 + tx1392 -> dhz2z2, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I2, 2, dhz2z2);"], 
   -tx1159 -> tx1393, -tx1160 -> tx1394, -tx1161 -> tx1395, 
   -tx1162 -> tx1396, -2.*tx1170 -> tx1397, -tx1170 -> tx1398, 
   -tx1172 -> tx1399, -2.*tx1178 -> tx1400, tx1141*tx955 -> tx1401, 
   tx1142*tx955 -> tx1402, tx1141*x2 -> tx1403, tx1142*x2 -> tx1404, 
   tx932*y3 -> tx1405, 2.*tx1405 -> tx1406, tx935*y3 -> tx1407, 
   x2*y2*y4 -> tx1408, x4*y3*y4 -> tx1409, tx938*z2 -> tx1410, 
   2.*tx1410 -> tx1411, tx940*z2 -> tx1412, tx922*z4 -> tx1413, 
   tx936*z4 -> tx1414, tx938*z4 -> tx1415, x3*z3*z4 -> tx1416, 
   tx1406 -> tx1417, tx1411 -> tx1418, 
   tx1115 + tx1118 + tx1119 + tx1129 + tx1166 + tx1182 + tx1394 + tx1396 + 
     tx1397 + tx1399 + tx1400 + tx1401 + tx1402 + tx1403 + tx1404 + tx1405 + 
     tx1407 + tx1409 + tx1410 + tx1414 + tx1415 + tx1416 -> tx1419, 
   tx1115 + tx1117 + tx1118 + tx1119 + tx1122 + tx1123 + tx1129 + tx1136 + 
     tx1169 + tx1181 + tx1393 + tx1394 + tx1395 + tx1396 + tx1398 + tx1407 + 
     tx1408 + tx1412 + tx1413 + tx1416 + tx1417 + tx1418 -> tx1420, 
   tx1419*tx1813*tx946 -> tx1421, tx1420*tx946*tx993 -> tx1422, 
   tx1421 + tx1422 -> tx1423, -2.*tx1189*tx1191*tx946*tx971 -> tx1424, 
   -2.*tx1191*tx1423*tx1815 -> tx1425, power2[tx1010] -> tx1426, 
   tx1194 + tx1195 + tx1197 + tx1198 + tx1424 + tx1425 -> tx1427, 
   DeDPhi*tx1427 -> tx1428, -(tx1045*tx1048*tx1426*V) -> tx1429, 
   tx1428 + tx1429 -> dhx3x3, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I3, 0, dhx3x3);"], 
   -2.*tx1255 -> tx1430, -tx1267 -> tx1431, -tx1268 -> tx1432, 
   -tx1269 -> tx1433, -tx1270 -> tx1434, -2.*tx1279 -> tx1435, 
   -tx1279 -> tx1436, -tx1281 -> tx1437, tx1142*tx956 -> tx1438, 
   tx1240*tx956 -> tx1439, tx932*x2 -> tx1440, tx935*x2 -> tx1441, 
   2.*tx1441 -> tx1442, tx910*x4 -> tx1443, tx934*x4 -> tx1444, 
   tx935*x4 -> tx1445, tx1142*y2 -> tx1446, tx1240*y2 -> tx1447, 
   x3*x4*y3 -> tx1448, tx937*z3 -> tx1449, 2.*tx1449 -> tx1450, 
   tx943*z3 -> tx1451, y2*z2*z4 -> tx1452, y4*z3*z4 -> tx1453, 
   tx1442 -> tx1454, tx1450 -> tx1455, 
   tx1211 + tx1224 + tx1225 + tx1236 + tx1260 + tx1275 + tx1430 + tx1432 + 
     tx1434 + tx1435 + tx1437 + tx1438 + tx1439 + tx1441 + tx1444 + tx1445 + 
     tx1446 + tx1447 + tx1448 + tx1449 + tx1451 + tx1453 -> tx1456, 
   tx1211 + tx1216 + tx1221 + tx1224 + tx1225 + tx1228 + tx1229 + tx1236 + 
     tx1259 + tx1278 + tx1431 + tx1432 + tx1433 + tx1434 + tx1436 + tx1440 + 
     tx1443 + tx1448 + tx1451 + tx1452 + tx1454 + tx1455 -> tx1457, 
   tx1456*tx1813*tx945 -> tx1458, tx1457*tx945*tx993 -> tx1459, 
   tx1458 + tx1459 -> tx1460, -2.*tx1191*tx1287*tx945*tx971 -> tx1461, 
   -2.*tx1191*tx1460*tx1815 -> tx1462, power2[tx1014] -> tx1463, 
   tx1290 + tx1291 + tx1293 + tx1294 + tx1461 + tx1462 -> tx1464, 
   DeDPhi*tx1464 -> tx1465, -(tx1045*tx1048*tx1463*V) -> tx1466, 
   tx1465 + tx1466 -> dhy3y3, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I3, 1, dhy3y3);"], 
   -2.*tx1353 -> tx1467, -tx1353 -> tx1468, -tx1356 -> tx1469, 
   -2.*tx1360 -> tx1470, -tx1372 -> tx1471, -tx1373 -> tx1472, 
   -tx1374 -> tx1473, -tx1375 -> tx1474, tx1141*tx957 -> tx1475, 
   tx1240*tx957 -> tx1476, tx938*x3 -> tx1477, tx940*x3 -> tx1478, 
   2.*tx1478 -> tx1479, tx937*y2 -> tx1480, tx943*y2 -> tx1481, 
   2.*tx1481 -> tx1482, tx920*y4 -> tx1483, tx942*y4 -> tx1484, 
   tx943*y4 -> tx1485, tx1141*z2 -> tx1486, tx1240*z2 -> tx1487, 
   x2*x4*z2 -> tx1488, y3*y4*z3 -> tx1489, x3*x4*z4 -> tx1490, 
   tx1479 -> tx1491, tx1482 -> tx1492, 
   tx1307 + tx1316 + tx1325 + tx1326 + tx1350 + tx1365 + tx1467 + tx1469 + 
     tx1470 + tx1472 + tx1474 + tx1475 + tx1476 + tx1477 + tx1478 + tx1481 + 
     tx1484 + tx1485 + tx1486 + tx1487 + tx1489 + tx1490 -> tx1493, 
   tx1307 + tx1310 + tx1316 + tx1321 + tx1325 + tx1326 + tx1330 + tx1331 + 
     tx1355 + tx1364 + tx1468 + tx1471 + tx1472 + tx1473 + tx1474 + tx1477 + 
     tx1480 + tx1483 + tx1488 + tx1489 + tx1491 + tx1492 -> tx1494, 
   tx1493*tx1813*tx944 -> tx1495, tx1494*tx944*tx993 -> tx1496, 
   tx1495 + tx1496 -> tx1497, -2.*tx1191*tx1381*tx944*tx971 -> tx1498, 
   -2.*tx1191*tx1497*tx1815 -> tx1499, power2[tx1018] -> tx1500, 
   tx1384 + tx1385 + tx1387 + tx1388 + tx1498 + tx1499 -> tx1501, 
   DeDPhi*tx1501 -> tx1502, -(tx1045*tx1048*tx1500*V) -> tx1503, 
   tx1502 + tx1503 -> dhz3z3, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I3, 2, dhz3z3);"], 
   DeDPhi*tx1424 -> tx1504, -(tx1045*tx1048*tx1191*tx1813*tx949*V) -> tx1505, 
   tx1504 + tx1505 -> dhx4x4, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I4, 0, I4, 0, dhx4x4);"], 
   DeDPhi*tx1461 -> tx1506, -(tx1045*tx1048*tx1191*tx1813*tx948*V) -> tx1507, 
   tx1506 + tx1507 -> dhy4y4, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I4, 1, I4, 1, dhy4y4);"], 
   DeDPhi*tx1498 -> tx1508, -(tx1045*tx1048*tx1191*tx1813*tx947*V) -> tx1509, 
   tx1508 + tx1509 -> dhz4z4, 
   CCode["DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I4, 2, I4, 2, dhz4z4);"], 
   CCode["#ifdef DIHEDRAL_CALC_OFF_DIAGONAL_HESSIAN //["], 
   CCode["if (calcOffDiagonalHessian) { "], tx1046*tx926 -> tx1510, 
   tx1075*tx927 -> tx1511, tx1510 + tx1511 -> tx1512, 
   DeDPhi*tx1047*tx1512*tx971 -> tx1513, 
   -(tx1045*tx1047*tx1048*tx1813*tx926*tx927*V) -> tx1514, 
   tx1513 + tx1514 -> ohx1y1, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I1, 1, ohx1y1);"], 
   tx1046*tx925 -> tx1515, tx1100*tx927 -> tx1516, tx1515 + tx1516 -> tx1517, 
   DeDPhi*tx1047*tx1517*tx971 -> tx1518, 
   -(tx1045*tx1047*tx1048*tx1813*tx925*tx927*V) -> tx1519, 
   tx1518 + tx1519 -> ohx1z1, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I1, 2, ohx1z1);"], 
   -2.*tx1046*tx1047*tx927*tx971 -> tx1520, tx1047*tx1187*tx1815 -> tx1521, 
   tx1520 + tx1521 -> tx1522, DeDPhi*tx1522 -> tx1523, 
   tx1045*tx1048*tx995*tx998*V -> tx1524, tx1523 + tx1524 -> ohx1x2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I2, 0, ohx1x2);"], 
   tx1139*tx1813*tx926 -> tx1525, tx1238*tx927*tx994 -> tx1526, 
   tx1525 + tx1526 -> tx1527, -(tx1047*tx1512*tx971) -> tx1528, 
   tx1047*tx1527*tx1815 -> tx1529, tx1528 + tx1529 -> tx1530, 
   DeDPhi*tx1530 -> tx1531, tx1002*tx1045*tx1048*tx995*V -> tx1532, 
   tx1531 + tx1532 -> ohx1y2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I2, 1, ohx1y2);"], 
   tx1139*tx1813*tx925 -> tx1533, tx1334*tx927*tx994 -> tx1534, 
   tx1533 + tx1534 -> tx1535, -(tx1047*tx1517*tx971) -> tx1536, 
   tx1047*tx1535*tx1815 -> tx1537, tx1536 + tx1537 -> tx1538, 
   DeDPhi*tx1538 -> tx1539, tx1006*tx1045*tx1048*tx995*V -> tx1540, 
   tx1539 + tx1540 -> ohx1z2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I2, 2, ohx1z2);"], 
   -(DeDPhi*tx1521) -> tx1541, tx1010*tx1045*tx1048*tx995*V -> tx1542, 
   tx1541 + tx1542 -> ohx1x3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I3, 0, ohx1x3);"], 
   -(DeDPhi*tx1529) -> tx1543, tx1014*tx1045*tx1048*tx995*V -> tx1544, 
   tx1543 + tx1544 -> ohx1y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I3, 1, ohx1y3);"], 
   -(DeDPhi*tx1537) -> tx1545, tx1018*tx1045*tx1048*tx995*V -> tx1546, 
   tx1545 + tx1546 -> ohx1z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I3, 2, ohx1z3);"], 
   tx1045*tx1048*tx1813*tx953*tx978*tx991*V -> ohx1x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I4, 0, ohx1x4);"], 
   tx1045*tx1048*tx1813*tx927*tx945*tx978*tx991*V -> ohx1y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I4, 1, ohx1y4);"], 
   tx1045*tx1048*tx1813*tx927*tx944*tx978*tx991*V -> ohx1z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I4, 2, ohx1z4);"], 
   tx1075*tx925 -> tx1547, tx1100*tx926 -> tx1548, tx1547 + tx1548 -> tx1549, 
   DeDPhi*tx1047*tx1549*tx971 -> tx1550, 
   -(tx1045*tx1047*tx1048*tx1813*tx925*tx926*V) -> tx1551, 
   tx1550 + tx1551 -> ohy1z1, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I1, 2, ohy1z1);"], 
   tx1239*tx1813*tx927 -> tx1552, tx1140*tx926*tx994 -> tx1553, 
   tx1552 + tx1553 -> tx1554, tx1047*tx1554*tx1815 -> tx1555, 
   tx1528 + tx1555 -> tx1556, DeDPhi*tx1556 -> tx1557, 
   tx1045*tx1048*tx998*tx999*V -> tx1558, tx1557 + tx1558 -> ohy1x2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I2, 0, ohy1x2);"], 
   -2.*tx1047*tx1075*tx926*tx971 -> tx1559, tx1047*tx1285*tx1815 -> tx1560, 
   tx1559 + tx1560 -> tx1561, DeDPhi*tx1561 -> tx1562, 
   tx1002*tx1045*tx1048*tx999*V -> tx1563, tx1562 + tx1563 -> ohy1y2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I2, 1, ohy1y2);"], 
   tx1239*tx1813*tx925 -> tx1564, tx1334*tx926*tx994 -> tx1565, 
   tx1564 + tx1565 -> tx1566, -(tx1047*tx1549*tx971) -> tx1567, 
   tx1047*tx1566*tx1815 -> tx1568, tx1567 + tx1568 -> tx1569, 
   DeDPhi*tx1569 -> tx1570, tx1006*tx1045*tx1048*tx999*V -> tx1571, 
   tx1570 + tx1571 -> ohy1z2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I2, 2, ohy1z2);"], 
   -(DeDPhi*tx1555) -> tx1572, tx1010*tx1045*tx1048*tx999*V -> tx1573, 
   tx1572 + tx1573 -> ohy1x3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I3, 0, ohy1x3);"], 
   -(DeDPhi*tx1560) -> tx1574, tx1014*tx1045*tx1048*tx999*V -> tx1575, 
   tx1574 + tx1575 -> ohy1y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I3, 1, ohy1y3);"], 
   -(DeDPhi*tx1568) -> tx1576, tx1018*tx1045*tx1048*tx999*V -> tx1577, 
   tx1576 + tx1577 -> ohy1z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I3, 2, ohy1z3);"], 
   tx1045*tx1048*tx1813*tx926*tx946*tx978*tx991*V -> ohy1x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I4, 0, ohy1x4);"], 
   tx1045*tx1048*tx1813*tx952*tx978*tx991*V -> ohy1y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I4, 1, ohy1y4);"], 
   tx1045*tx1048*tx1813*tx926*tx944*tx978*tx991*V -> ohy1z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I4, 2, ohy1z4);"], 
   tx1333*tx1813*tx927 -> tx1578, tx1140*tx925*tx994 -> tx1579, 
   tx1578 + tx1579 -> tx1580, tx1047*tx1580*tx1815 -> tx1581, 
   tx1536 + tx1581 -> tx1582, DeDPhi*tx1582 -> tx1583, 
   tx1003*tx1045*tx1048*tx998*V -> tx1584, tx1583 + tx1584 -> ohz1x2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I2, 0, ohz1x2);"], 
   tx1333*tx1813*tx926 -> tx1585, tx1238*tx925*tx994 -> tx1586, 
   tx1585 + tx1586 -> tx1587, tx1047*tx1587*tx1815 -> tx1588, 
   tx1567 + tx1588 -> tx1589, DeDPhi*tx1589 -> tx1590, 
   tx1002*tx1003*tx1045*tx1048*V -> tx1591, tx1590 + tx1591 -> ohz1y2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I2, 1, ohz1y2);"], 
   -2.*tx1047*tx1100*tx925*tx971 -> tx1592, tx1047*tx1379*tx1815 -> tx1593, 
   tx1592 + tx1593 -> tx1594, DeDPhi*tx1594 -> tx1595, 
   tx1003*tx1006*tx1045*tx1048*V -> tx1596, tx1595 + tx1596 -> ohz1z2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I2, 2, ohz1z2);"], 
   -(DeDPhi*tx1581) -> tx1597, tx1003*tx1010*tx1045*tx1048*V -> tx1598, 
   tx1597 + tx1598 -> ohz1x3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I3, 0, ohz1x3);"], 
   -(DeDPhi*tx1588) -> tx1599, tx1003*tx1014*tx1045*tx1048*V -> tx1600, 
   tx1599 + tx1600 -> ohz1y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I3, 1, ohz1y3);"], 
   -(DeDPhi*tx1593) -> tx1601, tx1003*tx1018*tx1045*tx1048*V -> tx1602, 
   tx1601 + tx1602 -> ohz1z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I3, 2, ohz1z3);"], 
   tx1045*tx1048*tx1813*tx925*tx946*tx978*tx991*V -> ohz1x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I4, 0, ohz1x4);"], 
   tx1045*tx1048*tx1813*tx925*tx945*tx978*tx991*V -> ohz1y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I4, 1, ohz1y4);"], 
   tx1045*tx1048*tx1813*tx951*tx978*tx991*V -> ohz1z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I4, 2, ohz1z4);"], 
   tx1188*tx926 -> tx1603, tx1286*tx927 -> tx1604, tx1189*tx945 -> tx1605, 
   tx1190*tx945 -> tx1606, tx1287*tx946 -> tx1607, tx1288*tx946 -> tx1608, 
   tx1603 + tx1604 -> tx1609, tx1605 + tx1607 -> tx1610, 
   tx1606 + tx1608 -> tx1611, -tx1529 -> tx1612, -tx1555 -> tx1613, 
   tx1047*tx1512*tx971 -> tx1614, 0.5*tx1192*tx1512*tx978 -> tx1615, 
   -0.5*tx1192*tx1610*tx991 -> tx1616, -(tx1191*tx1611*tx1815*tx993) -> 
    tx1617, tx1047*tx1609*tx1815*tx994 -> tx1618, 
   tx1612 + tx1613 + tx1614 + tx1615 + tx1616 + tx1617 + tx1618 -> tx1619, 
   DeDPhi*tx1619 -> tx1620, -(tx1002*tx1045*tx1048*tx998*V) -> tx1621, 
   tx1620 + tx1621 -> ohx2y2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I2, 1, ohx2y2);"], 
   tx1188*tx925 -> tx1622, tx1380*tx927 -> tx1623, tx1189*tx944 -> tx1624, 
   tx1190*tx944 -> tx1625, tx1381*tx946 -> tx1626, tx1382*tx946 -> tx1627, 
   tx1622 + tx1623 -> tx1628, tx1624 + tx1626 -> tx1629, 
   tx1625 + tx1627 -> tx1630, -tx1537 -> tx1631, -tx1581 -> tx1632, 
   tx1047*tx1517*tx971 -> tx1633, 0.5*tx1192*tx1517*tx978 -> tx1634, 
   -0.5*tx1192*tx1629*tx991 -> tx1635, -(tx1191*tx1630*tx1815*tx993) -> 
    tx1636, tx1047*tx1628*tx1815*tx994 -> tx1637, 
   tx1631 + tx1632 + tx1633 + tx1634 + tx1635 + tx1636 + tx1637 -> tx1638, 
   DeDPhi*tx1638 -> tx1639, -(tx1006*tx1045*tx1048*tx998*V) -> tx1640, 
   tx1639 + tx1640 -> ohx2z2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I2, 2, ohx2z2);"], 
   -tx1194 -> tx1641, tx1189*tx1192*tx946*tx991 -> tx1642, 
   tx1191*tx1423*tx1815 -> tx1643, 2.*tx1190*tx1191*tx1815*tx946*tx993 -> 
    tx1644, -2.*tx1047*tx1188*tx1815*tx927*tx994 -> tx1645, 
   tx1521 + tx1641 + tx1642 + tx1643 + tx1644 + tx1645 -> tx1646, 
   DeDPhi*tx1646 -> tx1647, -(tx1010*tx1045*tx1048*tx998*V) -> tx1648, 
   tx1647 + tx1648 -> ohx2x3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I3, 0, ohx2x3);"], 
   tx1456*tx1813*tx946 -> tx1649, tx1420*tx945*tx993 -> tx1650, 
   tx1649 + tx1650 -> tx1651, -tx1618 -> tx1652, -0.5*tx1192*tx1512*tx978 -> 
    tx1653, 0.5*tx1192*tx1610*tx991 -> tx1654, tx1191*tx1651*tx1815 -> 
    tx1655, tx1191*tx1611*tx1815*tx993 -> tx1656, 
   tx1529 + tx1652 + tx1653 + tx1654 + tx1655 + tx1656 -> tx1657, 
   DeDPhi*tx1657 -> tx1658, -(tx1014*tx1045*tx1048*tx998*V) -> tx1659, 
   tx1658 + tx1659 -> ohx2y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I3, 1, ohx2y3);"], 
   tx1493*tx1813*tx946 -> tx1660, tx1420*tx944*tx993 -> tx1661, 
   tx1660 + tx1661 -> tx1662, -tx1637 -> tx1663, -0.5*tx1192*tx1517*tx978 -> 
    tx1664, 0.5*tx1192*tx1629*tx991 -> tx1665, tx1191*tx1662*tx1815 -> 
    tx1666, tx1191*tx1630*tx1815*tx993 -> tx1667, 
   tx1537 + tx1663 + tx1664 + tx1665 + tx1666 + tx1667 -> tx1668, 
   DeDPhi*tx1668 -> tx1669, -(tx1018*tx1045*tx1048*tx998*V) -> tx1670, 
   tx1669 + tx1670 -> ohx2z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I3, 2, ohx2z3);"], 
   -(DeDPhi*tx1643) -> tx1671, tx1007*tx1045*tx1048*tx998*V -> tx1672, 
   tx1671 + tx1672 -> ohx2x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I4, 0, ohx2x4);"], 
   -(DeDPhi*tx1655) -> tx1673, tx1012*tx1045*tx1048*tx998*V -> tx1674, 
   tx1673 + tx1674 -> ohx2y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I4, 1, ohx2y4);"], 
   -(DeDPhi*tx1666) -> tx1675, tx1016*tx1045*tx1048*tx998*V -> tx1676, 
   tx1675 + tx1676 -> ohx2z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I4, 2, ohx2z4);"], 
   tx1286*tx925 -> tx1677, tx1380*tx926 -> tx1678, tx1287*tx944 -> tx1679, 
   tx1288*tx944 -> tx1680, tx1381*tx945 -> tx1681, tx1382*tx945 -> tx1682, 
   tx1677 + tx1678 -> tx1683, tx1679 + tx1681 -> tx1684, 
   tx1680 + tx1682 -> tx1685, -tx1568 -> tx1686, -tx1588 -> tx1687, 
   tx1047*tx1549*tx971 -> tx1688, 0.5*tx1192*tx1549*tx978 -> tx1689, 
   -0.5*tx1192*tx1684*tx991 -> tx1690, -(tx1191*tx1685*tx1815*tx993) -> 
    tx1691, tx1047*tx1683*tx1815*tx994 -> tx1692, 
   tx1686 + tx1687 + tx1688 + tx1689 + tx1690 + tx1691 + tx1692 -> tx1693, 
   DeDPhi*tx1693 -> tx1694, -(tx1002*tx1006*tx1045*tx1048*V) -> tx1695, 
   tx1694 + tx1695 -> ohy2z2, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I2, 2, ohy2z2);"], 
   tx1419*tx1813*tx945 -> tx1696, tx1457*tx946*tx993 -> tx1697, 
   tx1696 + tx1697 -> tx1698, tx1191*tx1698*tx1815 -> tx1699, 
   tx1555 + tx1652 + tx1653 + tx1654 + tx1656 + tx1699 -> tx1700, 
   DeDPhi*tx1700 -> tx1701, -(tx1002*tx1010*tx1045*tx1048*V) -> tx1702, 
   tx1701 + tx1702 -> ohy2x3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I3, 0, ohy2x3);"], 
   -tx1290 -> tx1703, tx1192*tx1287*tx945*tx991 -> tx1704, 
   tx1191*tx1460*tx1815 -> tx1705, 2.*tx1191*tx1288*tx1815*tx945*tx993 -> 
    tx1706, -2.*tx1047*tx1286*tx1815*tx926*tx994 -> tx1707, 
   tx1560 + tx1703 + tx1704 + tx1705 + tx1706 + tx1707 -> tx1708, 
   DeDPhi*tx1708 -> tx1709, -(tx1002*tx1014*tx1045*tx1048*V) -> tx1710, 
   tx1709 + tx1710 -> ohy2y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I3, 1, ohy2y3);"], 
   tx1493*tx1813*tx945 -> tx1711, tx1457*tx944*tx993 -> tx1712, 
   tx1711 + tx1712 -> tx1713, -tx1692 -> tx1714, -0.5*tx1192*tx1549*tx978 -> 
    tx1715, 0.5*tx1192*tx1684*tx991 -> tx1716, tx1191*tx1713*tx1815 -> 
    tx1717, tx1191*tx1685*tx1815*tx993 -> tx1718, 
   tx1568 + tx1714 + tx1715 + tx1716 + tx1717 + tx1718 -> tx1719, 
   DeDPhi*tx1719 -> tx1720, -(tx1002*tx1018*tx1045*tx1048*V) -> tx1721, 
   tx1720 + tx1721 -> ohy2z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I3, 2, ohy2z3);"], 
   -(DeDPhi*tx1699) -> tx1722, tx1002*tx1007*tx1045*tx1048*V -> tx1723, 
   tx1722 + tx1723 -> ohy2x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I4, 0, ohy2x4);"], 
   -(DeDPhi*tx1705) -> tx1724, tx1002*tx1012*tx1045*tx1048*V -> tx1725, 
   tx1724 + tx1725 -> ohy2y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I4, 1, ohy2y4);"], 
   -(DeDPhi*tx1717) -> tx1726, tx1002*tx1016*tx1045*tx1048*V -> tx1727, 
   tx1726 + tx1727 -> ohy2z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I4, 2, ohy2z4);"], 
   tx1419*tx1813*tx944 -> tx1728, tx1494*tx946*tx993 -> tx1729, 
   tx1728 + tx1729 -> tx1730, tx1191*tx1730*tx1815 -> tx1731, 
   tx1581 + tx1663 + tx1664 + tx1665 + tx1667 + tx1731 -> tx1732, 
   DeDPhi*tx1732 -> tx1733, -(tx1006*tx1010*tx1045*tx1048*V) -> tx1734, 
   tx1733 + tx1734 -> ohz2x3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I3, 0, ohz2x3);"], 
   tx1456*tx1813*tx944 -> tx1735, tx1494*tx945*tx993 -> tx1736, 
   tx1735 + tx1736 -> tx1737, tx1191*tx1737*tx1815 -> tx1738, 
   tx1588 + tx1714 + tx1715 + tx1716 + tx1718 + tx1738 -> tx1739, 
   DeDPhi*tx1739 -> tx1740, -(tx1006*tx1014*tx1045*tx1048*V) -> tx1741, 
   tx1740 + tx1741 -> ohz2y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I3, 1, ohz2y3);"], 
   -tx1384 -> tx1742, tx1192*tx1381*tx944*tx991 -> tx1743, 
   tx1191*tx1497*tx1815 -> tx1744, 2.*tx1191*tx1382*tx1815*tx944*tx993 -> 
    tx1745, -2.*tx1047*tx1380*tx1815*tx925*tx994 -> tx1746, 
   tx1593 + tx1742 + tx1743 + tx1744 + tx1745 + tx1746 -> tx1747, 
   DeDPhi*tx1747 -> tx1748, -(tx1006*tx1018*tx1045*tx1048*V) -> tx1749, 
   tx1748 + tx1749 -> ohz2z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I3, 2, ohz2z3);"], 
   -(DeDPhi*tx1731) -> tx1750, tx1006*tx1007*tx1045*tx1048*V -> tx1751, 
   tx1750 + tx1751 -> ohz2x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I4, 0, ohz2x4);"], 
   -(DeDPhi*tx1738) -> tx1752, tx1006*tx1012*tx1045*tx1048*V -> tx1753, 
   tx1752 + tx1753 -> ohz2y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I4, 1, ohz2y4);"], 
   -(DeDPhi*tx1744) -> tx1754, tx1006*tx1016*tx1045*tx1048*V -> tx1755, 
   tx1754 + tx1755 -> ohz2z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I4, 2, ohz2z4);"], 
   -tx1655 -> tx1756, -tx1699 -> tx1757, -(tx1191*tx1610*tx971) -> tx1758, 
   tx1615 + tx1616 + tx1617 + tx1618 + tx1756 + tx1757 + tx1758 -> tx1759, 
   DeDPhi*tx1759 -> tx1760, -(tx1010*tx1014*tx1045*tx1048*V) -> tx1761, 
   tx1760 + tx1761 -> ohx3y3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I3, 1, ohx3y3);"], 
   -tx1666 -> tx1762, -tx1731 -> tx1763, -(tx1191*tx1629*tx971) -> tx1764, 
   tx1634 + tx1635 + tx1636 + tx1637 + tx1762 + tx1763 + tx1764 -> tx1765, 
   DeDPhi*tx1765 -> tx1766, -(tx1010*tx1018*tx1045*tx1048*V) -> tx1767, 
   tx1766 + tx1767 -> ohx3z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I3, 2, ohx3z3);"], 
   2.*tx1189*tx1191*tx946*tx971 -> tx1768, tx1643 + tx1768 -> tx1769, 
   DeDPhi*tx1769 -> tx1770, tx1007*tx1010*tx1045*tx1048*V -> tx1771, 
   tx1770 + tx1771 -> ohx3x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I4, 0, ohx3x4);"], 
   tx1191*tx1610*tx971 -> tx1772, tx1655 + tx1772 -> tx1773, 
   DeDPhi*tx1773 -> tx1774, tx1010*tx1012*tx1045*tx1048*V -> tx1775, 
   tx1774 + tx1775 -> ohx3y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I4, 1, ohx3y4);"], 
   tx1191*tx1629*tx971 -> tx1776, tx1666 + tx1776 -> tx1777, 
   DeDPhi*tx1777 -> tx1778, tx1010*tx1016*tx1045*tx1048*V -> tx1779, 
   tx1778 + tx1779 -> ohx3z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I4, 2, ohx3z4);"], 
   -tx1717 -> tx1780, -tx1738 -> tx1781, -(tx1191*tx1684*tx971) -> tx1782, 
   tx1689 + tx1690 + tx1691 + tx1692 + tx1780 + tx1781 + tx1782 -> tx1783, 
   DeDPhi*tx1783 -> tx1784, -(tx1014*tx1018*tx1045*tx1048*V) -> tx1785, 
   tx1784 + tx1785 -> ohy3z3, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I3, 2, ohy3z3);"], 
   tx1699 + tx1772 -> tx1786, DeDPhi*tx1786 -> tx1787, 
   tx1007*tx1014*tx1045*tx1048*V -> tx1788, tx1787 + tx1788 -> ohy3x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I4, 0, ohy3x4);"], 
   2.*tx1191*tx1287*tx945*tx971 -> tx1789, tx1705 + tx1789 -> tx1790, 
   DeDPhi*tx1790 -> tx1791, tx1012*tx1014*tx1045*tx1048*V -> tx1792, 
   tx1791 + tx1792 -> ohy3y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I4, 1, ohy3y4);"], 
   tx1191*tx1684*tx971 -> tx1793, tx1717 + tx1793 -> tx1794, 
   DeDPhi*tx1794 -> tx1795, tx1014*tx1016*tx1045*tx1048*V -> tx1796, 
   tx1795 + tx1796 -> ohy3z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I4, 2, ohy3z4);"], 
   tx1731 + tx1776 -> tx1797, DeDPhi*tx1797 -> tx1798, 
   tx1007*tx1018*tx1045*tx1048*V -> tx1799, tx1798 + tx1799 -> ohz3x4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I4, 0, ohz3x4);"], 
   tx1738 + tx1793 -> tx1800, DeDPhi*tx1800 -> tx1801, 
   tx1012*tx1018*tx1045*tx1048*V -> tx1802, tx1801 + tx1802 -> ohz3y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I4, 1, ohz3y4);"], 
   2.*tx1191*tx1381*tx944*tx971 -> tx1803, tx1744 + tx1803 -> tx1804, 
   DeDPhi*tx1804 -> tx1805, tx1016*tx1018*tx1045*tx1048*V -> tx1806, 
   tx1805 + tx1806 -> ohz3z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I4, 2, ohz3z4);"], 
   DeDPhi*tx1758 -> tx1807, -(tx1045*tx1048*tx1191*tx1813*tx945*tx946*V) -> 
    tx1808, tx1807 + tx1808 -> ohx4y4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I4, 0, I4, 1, ohx4y4);"], 
   DeDPhi*tx1764 -> tx1809, -(tx1045*tx1048*tx1191*tx1813*tx944*tx946*V) -> 
    tx1810, tx1809 + tx1810 -> ohx4z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I4, 0, I4, 2, ohx4z4);"], 
   DeDPhi*tx1782 -> tx1811, -(tx1045*tx1048*tx1191*tx1813*tx944*tx945*V) -> 
    tx1812, tx1811 + tx1812 -> ohy4z4, 
   CCode["DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I4, 1, I4, 2, ohy4z4);"], 
   CCode["} /*calcOffDiagonalHessian*/"], 
   CCode["#endif // DIHEDRAL_CALC_OFF_DIAGONAL_HESSIAN ]"], 
   CCode["} /*calcDiagonalHessian*/"], 
   CCode["#endif // DIHEDRAL_CALC_DIAGONAL_HESSIAN ]"], 
   CCode["} /*calcForce*/"], CCode["#endif // DIHEDRAL_CALC_FORCE ]"]}, 
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
 MathCode -> "Block[{CosPhi,DeDPhi,dhx1x1,dhx2x2,dhx3x3,dhx4x4,dhy1y1,dhy2y2,\
dhy3y3,dhy4y4,dhz1z1,dhz2z2,dhz3z3,dhz4z4,DihedralDeviation,Energy,fx1,fx2,fx\
3,fx4,fy1,fy2,fy3,fy4,fz1,fz2,fz3,fz4,gx1,gx2,gx3,gx4,gy1,gy2,gy3,gy4,gz1,gz2\
,gz3,gz4,LenA,LenB,ohx1x2,ohx1x3,ohx1x4,ohx1y1,ohx1y2,ohx1y3,ohx1y4,ohx1z1,oh\
x1z2,ohx1z3,ohx1z4,ohx2x3,ohx2x4,ohx2y2,ohx2y3,ohx2y4,ohx2z2,ohx2z3,ohx2z4,oh\
x3x4,ohx3y3,ohx3y4,ohx3z3,ohx3z4,ohx4y4,ohx4z4,ohy1x2,ohy1x3,ohy1x4,ohy1y2,oh\
y1y3,ohy1y4,ohy1z1,ohy1z2,ohy1z3,ohy1z4,ohy2x3,ohy2x4,ohy2y3,ohy2y4,ohy2z2,oh\
y2z3,ohy2z4,ohy3x4,ohy3y4,ohy3z3,ohy3z4,ohy4z4,ohz1x2,ohz1x3,ohz1x4,ohz1y2,oh\
z1y3,ohz1y4,ohz1z2,ohz1z3,ohz1z4,ohz2x3,ohz2x4,ohz2y3,ohz2y4,ohz2z3,ohz2z4,oh\
z3x4,ohz3y4,ohz3z4,ReciprocalLenA,ReciprocalLenB,RecLenARecLenB,SinPhi,tx1000\
,tx1001,tx1002,tx1003,tx1004,tx1005,tx1006,tx1007,tx1008,tx1009,tx1010,tx1011\
,tx1012,tx1013,tx1014,tx1015,tx1016,tx1017,tx1018,tx1019,tx1020,tx1021,tx1022\
,tx1023,tx1024,tx1025,tx1026,tx1027,tx1028,tx1029,tx1030,tx1031,tx1032,tx1033\
,tx1034,tx1035,tx1036,tx1037,tx1038,tx1039,tx1040,tx1041,tx1042,tx1043,tx1044\
,tx1045,tx1046,tx1047,tx1048,tx1049,tx1050,tx1051,tx1052,tx1053,tx1054,tx1055\
,tx1056,tx1057,tx1058,tx1059,tx1060,tx1061,tx1062,tx1063,tx1064,tx1065,tx1066\
,tx1067,tx1068,tx1069,tx1070,tx1071,tx1072,tx1073,tx1074,tx1075,tx1076,tx1077\
,tx1078,tx1079,tx1080,tx1081,tx1082,tx1083,tx1084,tx1085,tx1086,tx1087,tx1088\
,tx1089,tx1090,tx1091,tx1092,tx1093,tx1094,tx1095,tx1096,tx1097,tx1098,tx1099\
,tx1100,tx1101,tx1102,tx1103,tx1104,tx1105,tx1106,tx1107,tx1108,tx1109,tx1110\
,tx1111,tx1112,tx1113,tx1114,tx1115,tx1116,tx1117,tx1118,tx1119,tx1120,tx1121\
,tx1122,tx1123,tx1124,tx1125,tx1126,tx1127,tx1128,tx1129,tx1130,tx1131,tx1132\
,tx1133,tx1134,tx1135,tx1136,tx1137,tx1138,tx1139,tx1140,tx1141,tx1142,tx1143\
,tx1144,tx1145,tx1146,tx1147,tx1148,tx1149,tx1150,tx1151,tx1152,tx1153,tx1154\
,tx1155,tx1156,tx1157,tx1158,tx1159,tx1160,tx1161,tx1162,tx1163,tx1164,tx1165\
,tx1166,tx1167,tx1168,tx1169,tx1170,tx1171,tx1172,tx1173,tx1174,tx1175,tx1176\
,tx1177,tx1178,tx1179,tx1180,tx1181,tx1182,tx1183,tx1184,tx1185,tx1186,tx1187\
,tx1188,tx1189,tx1190,tx1191,tx1192,tx1193,tx1194,tx1195,tx1196,tx1197,tx1198\
,tx1199,tx1200,tx1201,tx1202,tx1203,tx1204,tx1205,tx1206,tx1207,tx1208,tx1209\
,tx1210,tx1211,tx1212,tx1213,tx1214,tx1215,tx1216,tx1217,tx1218,tx1219,tx1220\
,tx1221,tx1222,tx1223,tx1224,tx1225,tx1226,tx1227,tx1228,tx1229,tx1230,tx1231\
,tx1232,tx1233,tx1234,tx1235,tx1236,tx1237,tx1238,tx1239,tx1240,tx1241,tx1242\
,tx1243,tx1244,tx1245,tx1246,tx1247,tx1248,tx1249,tx1250,tx1251,tx1252,tx1253\
,tx1254,tx1255,tx1256,tx1257,tx1258,tx1259,tx1260,tx1261,tx1262,tx1263,tx1264\
,tx1265,tx1266,tx1267,tx1268,tx1269,tx1270,tx1271,tx1272,tx1273,tx1274,tx1275\
,tx1276,tx1277,tx1278,tx1279,tx1280,tx1281,tx1282,tx1283,tx1284,tx1285,tx1286\
,tx1287,tx1288,tx1289,tx1290,tx1291,tx1292,tx1293,tx1294,tx1295,tx1296,tx1297\
,tx1298,tx1299,tx1300,tx1301,tx1302,tx1303,tx1304,tx1305,tx1306,tx1307,tx1308\
,tx1309,tx1310,tx1311,tx1312,tx1313,tx1314,tx1315,tx1316,tx1317,tx1318,tx1319\
,tx1320,tx1321,tx1322,tx1323,tx1324,tx1325,tx1326,tx1327,tx1328,tx1329,tx1330\
,tx1331,tx1332,tx1333,tx1334,tx1335,tx1336,tx1337,tx1338,tx1339,tx1340,tx1341\
,tx1342,tx1343,tx1344,tx1345,tx1346,tx1347,tx1348,tx1349,tx1350,tx1351,tx1352\
,tx1353,tx1354,tx1355,tx1356,tx1357,tx1358,tx1359,tx1360,tx1361,tx1362,tx1363\
,tx1364,tx1365,tx1366,tx1367,tx1368,tx1369,tx1370,tx1371,tx1372,tx1373,tx1374\
,tx1375,tx1376,tx1377,tx1378,tx1379,tx1380,tx1381,tx1382,tx1383,tx1384,tx1385\
,tx1386,tx1387,tx1388,tx1389,tx1390,tx1391,tx1392,tx1393,tx1394,tx1395,tx1396\
,tx1397,tx1398,tx1399,tx1400,tx1401,tx1402,tx1403,tx1404,tx1405,tx1406,tx1407\
,tx1408,tx1409,tx1410,tx1411,tx1412,tx1413,tx1414,tx1415,tx1416,tx1417,tx1418\
,tx1419,tx1420,tx1421,tx1422,tx1423,tx1424,tx1425,tx1426,tx1427,tx1428,tx1429\
,tx1430,tx1431,tx1432,tx1433,tx1434,tx1435,tx1436,tx1437,tx1438,tx1439,tx1440\
,tx1441,tx1442,tx1443,tx1444,tx1445,tx1446,tx1447,tx1448,tx1449,tx1450,tx1451\
,tx1452,tx1453,tx1454,tx1455,tx1456,tx1457,tx1458,tx1459,tx1460,tx1461,tx1462\
,tx1463,tx1464,tx1465,tx1466,tx1467,tx1468,tx1469,tx1470,tx1471,tx1472,tx1473\
,tx1474,tx1475,tx1476,tx1477,tx1478,tx1479,tx1480,tx1481,tx1482,tx1483,tx1484\
,tx1485,tx1486,tx1487,tx1488,tx1489,tx1490,tx1491,tx1492,tx1493,tx1494,tx1495\
,tx1496,tx1497,tx1498,tx1499,tx1500,tx1501,tx1502,tx1503,tx1504,tx1505,tx1506\
,tx1507,tx1508,tx1509,tx1510,tx1511,tx1512,tx1513,tx1514,tx1515,tx1516,tx1517\
,tx1518,tx1519,tx1520,tx1521,tx1522,tx1523,tx1524,tx1525,tx1526,tx1527,tx1528\
,tx1529,tx1530,tx1531,tx1532,tx1533,tx1534,tx1535,tx1536,tx1537,tx1538,tx1539\
,tx1540,tx1541,tx1542,tx1543,tx1544,tx1545,tx1546,tx1547,tx1548,tx1549,tx1550\
,tx1551,tx1552,tx1553,tx1554,tx1555,tx1556,tx1557,tx1558,tx1559,tx1560,tx1561\
,tx1562,tx1563,tx1564,tx1565,tx1566,tx1567,tx1568,tx1569,tx1570,tx1571,tx1572\
,tx1573,tx1574,tx1575,tx1576,tx1577,tx1578,tx1579,tx1580,tx1581,tx1582,tx1583\
,tx1584,tx1585,tx1586,tx1587,tx1588,tx1589,tx1590,tx1591,tx1592,tx1593,tx1594\
,tx1595,tx1596,tx1597,tx1598,tx1599,tx1600,tx1601,tx1602,tx1603,tx1604,tx1605\
,tx1606,tx1607,tx1608,tx1609,tx1610,tx1611,tx1612,tx1613,tx1614,tx1615,tx1616\
,tx1617,tx1618,tx1619,tx1620,tx1621,tx1622,tx1623,tx1624,tx1625,tx1626,tx1627\
,tx1628,tx1629,tx1630,tx1631,tx1632,tx1633,tx1634,tx1635,tx1636,tx1637,tx1638\
,tx1639,tx1640,tx1641,tx1642,tx1643,tx1644,tx1645,tx1646,tx1647,tx1648,tx1649\
,tx1650,tx1651,tx1652,tx1653,tx1654,tx1655,tx1656,tx1657,tx1658,tx1659,tx1660\
,tx1661,tx1662,tx1663,tx1664,tx1665,tx1666,tx1667,tx1668,tx1669,tx1670,tx1671\
,tx1672,tx1673,tx1674,tx1675,tx1676,tx1677,tx1678,tx1679,tx1680,tx1681,tx1682\
,tx1683,tx1684,tx1685,tx1686,tx1687,tx1688,tx1689,tx1690,tx1691,tx1692,tx1693\
,tx1694,tx1695,tx1696,tx1697,tx1698,tx1699,tx1700,tx1701,tx1702,tx1703,tx1704\
,tx1705,tx1706,tx1707,tx1708,tx1709,tx1710,tx1711,tx1712,tx1713,tx1714,tx1715\
,tx1716,tx1717,tx1718,tx1719,tx1720,tx1721,tx1722,tx1723,tx1724,tx1725,tx1726\
,tx1727,tx1728,tx1729,tx1730,tx1731,tx1732,tx1733,tx1734,tx1735,tx1736,tx1737\
,tx1738,tx1739,tx1740,tx1741,tx1742,tx1743,tx1744,tx1745,tx1746,tx1747,tx1748\
,tx1749,tx1750,tx1751,tx1752,tx1753,tx1754,tx1755,tx1756,tx1757,tx1758,tx1759\
,tx1760,tx1761,tx1762,tx1763,tx1764,tx1765,tx1766,tx1767,tx1768,tx1769,tx1770\
,tx1771,tx1772,tx1773,tx1774,tx1775,tx1776,tx1777,tx1778,tx1779,tx1780,tx1781\
,tx1782,tx1783,tx1784,tx1785,tx1786,tx1787,tx1788,tx1789,tx1790,tx1791,tx1792\
,tx1793,tx1794,tx1795,tx1796,tx1797,tx1798,tx1799,tx1800,tx1801,tx1802,tx1803\
,tx1804,tx1805,tx1806,tx1807,tx1808,tx1809,tx1810,tx1811,tx1812,tx1813,tx1814\
,tx1815,tx907,tx908,tx909,tx910,tx911,tx912,tx913,tx914,tx915,tx916,tx917,tx9\
18,tx919,tx920,tx921,tx922,tx923,tx924,tx925,tx926,tx927,tx928,tx929,tx930,tx\
931,tx932,tx933,tx934,tx935,tx936,tx937,tx938,tx939,tx940,tx941,tx942,tx943,t\
x944,tx945,tx946,tx947,tx948,tx949,tx950,tx951,tx952,tx953,tx954,tx955,tx956,\
tx957,tx958,tx959,tx960,tx961,tx962,tx963,tx964,tx965,tx966,tx967,tx968,tx969\
,tx970,tx971,tx972,tx973,tx974,tx975,tx976,tx977,tx978,tx979,tx980,tx981,tx98\
2,tx983,tx984,tx985,tx986,tx987,tx988,tx989,tx990,tx991,tx992,tx993,tx994,tx9\
95,tx996,tx997,tx998,tx999,xxxDummy},\n\t(*DIHEDRAL_SET_PARAMETER(sinPhase);*\
)\n\t(*DIHEDRAL_SET_PARAMETER(cosPhase);*)\n\t(*DIHEDRAL_SET_PARAMETER(V);*)\
\n\t(*DIHEDRAL_SET_PARAMETER(DN);*)\n\t(*DIHEDRAL_SET_PARAMETER(IN);*)\n\t(*D\
IHEDRAL_SET_PARAMETER(I1);*)\n\t(*DIHEDRAL_SET_PARAMETER(I2);*)\n\t(*DIHEDRAL\
_SET_PARAMETER(I3);*)\n\t(*DIHEDRAL_SET_PARAMETER(I4);*)\n\t(*DIHEDRAL_SET_PO\
SITION(x1,I1,0);*)\n\t(*DIHEDRAL_SET_POSITION(y1,I1,1);*)\n\t(*DIHEDRAL_SET_P\
OSITION(z1,I1,2);*)\n\t(*DIHEDRAL_SET_POSITION(x2,I2,0);*)\n\t(*DIHEDRAL_SET_\
POSITION(y2,I2,1);*)\n\t(*DIHEDRAL_SET_POSITION(z2,I2,2);*)\n\t(*DIHEDRAL_SET\
_POSITION(x3,I3,0);*)\n\t(*DIHEDRAL_SET_POSITION(y3,I3,1);*)\n\t(*DIHEDRAL_SE\
T_POSITION(z3,I3,2);*)\n\t(*DIHEDRAL_SET_POSITION(x4,I4,0);*)\n\t(*DIHEDRAL_S\
ET_POSITION(y4,I4,1);*)\n\t(*DIHEDRAL_SET_POSITION(z4,I4,2);*)\n\ttx907=-(x2 \
y1); (*Rule 22*)\n\ttx908=x3 y1; (*Rule 23*)\n\ttx909=x1 y2; (*Rule \
24*)\n\ttx910=-(x3 y2); (*Rule 25*)\n\ttx911=-(x1 y3); (*Rule \
26*)\n\ttx912=x2 y3; (*Rule 27*)\n\ttx913=x2 z1; (*Rule 28*)\n\ttx914=-(x3 \
z1); (*Rule 29*)\n\ttx915=-(y2 z1); (*Rule 30*)\n\ttx916=y3 z1; (*Rule \
31*)\n\ttx917=-(x1 z2); (*Rule 32*)\n\ttx918=x3 z2; (*Rule 33*)\n\ttx919=y1 \
z2; (*Rule 34*)\n\ttx920=-(y3 z2); (*Rule 35*)\n\ttx921=x1 z3; (*Rule \
36*)\n\ttx922=-(x2 z3); (*Rule 37*)\n\ttx923=-(y1 z3); (*Rule \
38*)\n\ttx924=y2 z3; (*Rule 39*)\n\ttx925=tx907 + tx908 + tx909 + tx910 + \
tx911 + tx912; (*Rule 40*)\n\ttx926=tx913 + tx914 + tx917 + tx918 + tx921 + \
tx922; (*Rule 41*)\n\ttx927=tx915 + tx916 + tx919 + tx920 + tx923 + tx924; \
(*Rule 42*)\n\ttx928= mathPower2[tx925]; (*Rule 43*)\n\ttx929= \
mathPower2[tx926]; (*Rule 44*)\n\ttx930= mathPower2[tx927]; (*Rule \
45*)\n\ttx931=tx928 + tx929 + tx930; (*Rule 46*)\n\tLenA= mathSqrt[tx931]; \
(*Rule 47*)\n\ttx932=x4 y2; (*Rule 48*)\n\ttx933=-(x4 y3); (*Rule \
49*)\n\ttx934=-(x2 y4); (*Rule 50*)\n\ttx935=x3 y4; (*Rule 51*)\n\ttx936=-(x4 \
z2); (*Rule 52*)\n\ttx937=y4 z2; (*Rule 53*)\n\ttx938=x4 z3; (*Rule \
54*)\n\ttx939=-(y4 z3); (*Rule 55*)\n\ttx940=x2 z4; (*Rule 56*)\n\ttx941=-(x3 \
z4); (*Rule 57*)\n\ttx942=-(y2 z4); (*Rule 58*)\n\ttx943=y3 z4; (*Rule \
59*)\n\ttx944=tx910 + tx912 + tx932 + tx933 + tx934 + tx935; (*Rule \
60*)\n\ttx945=tx918 + tx922 + tx936 + tx938 + tx940 + tx941; (*Rule \
61*)\n\ttx946=tx920 + tx924 + tx937 + tx939 + tx942 + tx943; (*Rule \
62*)\n\ttx947= mathPower2[tx944]; (*Rule 63*)\n\ttx948= mathPower2[tx945]; \
(*Rule 64*)\n\ttx949= mathPower2[tx946]; (*Rule 65*)\n\ttx950=tx947 + tx948 + \
tx949; (*Rule 66*)\n\tLenB= mathSqrt[tx950]; (*Rule 67*)\n\tReciprocalLenA= \
mathReciprocal[LenA]; (*Rule 68*)\n\tReciprocalLenB= mathReciprocal[LenB]; \
(*Rule 69*)\n\t(*if (fabs(LenA)<TENM3) ReciprocalLenA = 0.0;*)\n\t(*if \
(fabs(LenB)<TENM3) ReciprocalLenB = 0.0;*)\n\tRecLenARecLenB=ReciprocalLenA \
ReciprocalLenB; (*Rule 72*)\n\t(*EraseLinearDihedral = 1.0;*)\n\t(*if \
(RecLenARecLenB==0.0) EraseLinearDihedral = 0.0;*)\n\ttx951=tx925 tx944; \
(*Rule 75*)\n\ttx952=tx926 tx945; (*Rule 76*)\n\ttx953=tx927 tx946; (*Rule \
77*)\n\ttx954=tx951 + tx952 + tx953; (*Rule 78*)\n\tCosPhi=RecLenARecLenB \
tx954; (*Rule 79*)\n\ttx955=-x3; (*Rule 80*)\n\ttx956=-y3; (*Rule \
81*)\n\ttx957=-z3; (*Rule 82*)\n\ttx958=tx955 + x2; (*Rule \
83*)\n\ttx959=tx956 + y2; (*Rule 84*)\n\ttx960=tx957 + z2; (*Rule \
85*)\n\ttx961= mathPower2[tx958]; (*Rule 86*)\n\ttx962= mathPower2[tx959]; \
(*Rule 87*)\n\ttx963= mathPower2[tx960]; (*Rule 88*)\n\ttx964=tx955 + x4; \
(*Rule 89*)\n\ttx965=tx956 + y4; (*Rule 90*)\n\ttx966=tx957 + z4; (*Rule \
91*)\n\ttx967=tx961 + tx962 + tx963; (*Rule 92*)\n\ttx968=tx927 tx964; (*Rule \
93*)\n\ttx969=tx926 tx965; (*Rule 94*)\n\ttx970=tx925 tx966; (*Rule \
95*)\n\ttx971= mathSqrt[tx967]; (*Rule 96*)\n\ttx972=tx968 + tx969 + tx970; \
(*Rule 97*)\n\tSinPhi=RecLenARecLenB tx971 tx972; (*Rule \
98*)\n\t(*CosPhi=MAX(-1.0,MIN(1.0,CosPhi));*)\n\tCosNPhi = \
mathCosNPhi[IN,SinPhi,CosPhi];\n\tSinNPhi = \
mathSinNPhi[IN,SinPhi,CosPhi];\n\t(*sinNPhiCosNPhi(IN, &SinNPhi, &CosNPhi, \
SinPhi, CosPhi);*)\n\ttx973=CosNPhi cosPhase; (*Rule 103*)\n\ttx974=SinNPhi \
sinPhase; (*Rule 104*)\n\tDihedralDeviation=1. + tx973 + tx974; (*Rule \
105*)\n\tEnergy=DihedralDeviation EraseLinearDihedral V; (*Rule \
106*)\n\t(*DIHEDRAL_ENERGY_ACCUMULATE(Energy);*)\n\t(*#ifdef \
DIHEDRAL_CALC_FORCE //[*)\n\t(*if (calcForce ) {*)\n\ttx975=cosPhase SinNPhi; \
(*Rule 110*)\n\ttx976=-(CosNPhi sinPhase); (*Rule 111*)\n\ttx977=tx975 + \
tx976; (*Rule 112*)\n\tDeDPhi=-(DN EraseLinearDihedral tx977 V); (*Rule \
113*)\n\ttx978= mathReciprocal[tx931]; (*Rule 114*)\n\tgx1=-(DeDPhi tx927 \
tx971 tx978); (*Rule 115*)\n\tfx1=-gx1; (*Rule \
116*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I1, 0, fx1 );*)\n\tgy1=-(DeDPhi tx926 \
tx971 tx978); (*Rule 118*)\n\tfy1=-gy1; (*Rule \
119*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I1, 1, fy1 );*)\n\tgz1=-(DeDPhi tx925 \
tx971 tx978); (*Rule 121*)\n\tfz1=-gz1; (*Rule \
122*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I1, 2, fz1 );*)\n\ttx979=-x2; (*Rule \
124*)\n\ttx980=-y2; (*Rule 125*)\n\ttx981=-z2; (*Rule 126*)\n\ttx982=tx979 + \
x1; (*Rule 127*)\n\ttx983=tx980 + y1; (*Rule 128*)\n\ttx984=tx981 + z1; \
(*Rule 129*)\n\ttx985=tx958 tx964; (*Rule 130*)\n\ttx986=tx959 tx965; (*Rule \
131*)\n\ttx987=tx960 tx966; (*Rule 132*)\n\ttx988=tx958 tx982; (*Rule \
133*)\n\ttx989=tx959 tx983; (*Rule 134*)\n\ttx990=tx960 tx984; (*Rule \
135*)\n\ttx991= mathReciprocal[tx950]; (*Rule 136*)\n\ttx992= \
mathReciprocal[tx971]; (*Rule 137*)\n\ttx993=tx985 + tx986 + tx987; (*Rule \
138*)\n\ttx994=tx988 + tx989 + tx990; (*Rule 139*)\n\ttx995=tx927 tx971 \
tx978; (*Rule 140*)\n\ttx996=-(tx946 tx991 tx992 tx993); (*Rule \
141*)\n\ttx997=tx927 tx978 tx992 tx994; (*Rule 142*)\n\ttx998=tx995 + tx996 + \
tx997; (*Rule 143*)\n\tgx2=DeDPhi tx998; (*Rule 144*)\n\tfx2=-gx2; (*Rule \
145*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I2, 0, fx2 );*)\n\ttx999=tx926 tx971 \
tx978; (*Rule 147*)\n\ttx1000=-(tx945 tx991 tx992 tx993); (*Rule \
148*)\n\ttx1001=tx926 tx978 tx992 tx994; (*Rule 149*)\n\ttx1002=tx1000 + \
tx1001 + tx999; (*Rule 150*)\n\tgy2=DeDPhi tx1002; (*Rule 151*)\n\tfy2=-gy2; \
(*Rule 152*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I2, 1, fy2 );*)\n\ttx1003=tx925 \
tx971 tx978; (*Rule 154*)\n\ttx1004=-(tx944 tx991 tx992 tx993); (*Rule \
155*)\n\ttx1005=tx925 tx978 tx992 tx994; (*Rule 156*)\n\ttx1006=tx1003 + \
tx1004 + tx1005; (*Rule 157*)\n\tgz2=DeDPhi tx1006; (*Rule 158*)\n\tfz2=-gz2; \
(*Rule 159*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I2, 2, fz2 );*)\n\ttx1007=-(tx946 \
tx971 tx991); (*Rule 161*)\n\ttx1008=tx946 tx991 tx992 tx993; (*Rule \
162*)\n\ttx1009=-tx997; (*Rule 163*)\n\ttx1010=tx1007 + tx1008 + tx1009; \
(*Rule 164*)\n\tgx3=DeDPhi tx1010; (*Rule 165*)\n\tfx3=-gx3; (*Rule \
166*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I3, 0, fx3 );*)\n\ttx1011=-tx1001; \
(*Rule 168*)\n\ttx1012=-(tx945 tx971 tx991); (*Rule 169*)\n\ttx1013=tx945 \
tx991 tx992 tx993; (*Rule 170*)\n\ttx1014=tx1011 + tx1012 + tx1013; (*Rule \
171*)\n\tgy3=DeDPhi tx1014; (*Rule 172*)\n\tfy3=-gy3; (*Rule \
173*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I3, 1, fy3 );*)\n\ttx1015=-tx1005; \
(*Rule 175*)\n\ttx1016=-(tx944 tx971 tx991); (*Rule 176*)\n\ttx1017=tx944 \
tx991 tx992 tx993; (*Rule 177*)\n\ttx1018=tx1015 + tx1016 + tx1017; (*Rule \
178*)\n\tgz3=DeDPhi tx1018; (*Rule 179*)\n\tfz3=-gz3; (*Rule \
180*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I3, 2, fz3 );*)\n\tgx4=DeDPhi tx946 \
tx971 tx991; (*Rule 182*)\n\tfx4=-gx4; (*Rule \
183*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I4, 0, fx4 );*)\n\tgy4=DeDPhi tx945 \
tx971 tx991; (*Rule 185*)\n\tfy4=-gy4; (*Rule \
186*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I4, 1, fy4 );*)\n\tgz4=DeDPhi tx944 \
tx971 tx991; (*Rule 188*)\n\tfz4=-gz4; (*Rule \
189*)\n\t(*DIHEDRAL_FORCE_ACCUMULATE(I4, 2, fz4 );*)\n\t(*#ifdef \
DIHEDRAL_CALC_DIAGONAL_HESSIAN //[*)\n\t(*if (calcDiagonalHessian) \
{*)\n\ttx1019= mathPower2[y2]; (*Rule 193*)\n\ttx1020= mathPower2[y3]; (*Rule \
194*)\n\ttx1021= mathPower2[z2]; (*Rule 195*)\n\ttx1022= mathPower2[z3]; \
(*Rule 196*)\n\ttx1023=tx1019 tx955; (*Rule 197*)\n\ttx1024=tx1021 tx955; \
(*Rule 198*)\n\ttx1025=tx908 tx956; (*Rule 199*)\n\ttx1026=tx1020 tx979; \
(*Rule 200*)\n\ttx1027=tx1022 tx979; (*Rule 201*)\n\ttx1028=tx913 tx981; \
(*Rule 202*)\n\ttx1029=tx1019 x1; (*Rule 203*)\n\ttx1030=tx1020 x1; (*Rule \
204*)\n\ttx1031=tx1021 x1; (*Rule 205*)\n\ttx1032=tx1022 x1; (*Rule \
206*)\n\ttx1033=tx912 y1; (*Rule 207*)\n\ttx1034=tx907 y2; (*Rule \
208*)\n\ttx1035=tx908 y2; (*Rule 209*)\n\ttx1036=tx912 y2; (*Rule \
210*)\n\ttx1037=-2. tx909 y3; (*Rule 211*)\n\ttx1038=x3 y2 y3; (*Rule \
212*)\n\ttx1039=tx918 z1; (*Rule 213*)\n\ttx1040=-2. tx921 z2; (*Rule \
214*)\n\ttx1041=tx913 z3; (*Rule 215*)\n\ttx1042=tx914 z3; (*Rule \
216*)\n\ttx1043=tx918 z3; (*Rule 217*)\n\ttx1044=x2 z2 z3; (*Rule \
218*)\n\ttx1045= mathPower2[DN]; (*Rule 219*)\n\ttx1046=tx1023 + tx1024 + \
tx1025 + tx1026 + tx1027 + tx1028 + tx1029 + tx1030 + tx1031 + tx1032 + \
tx1033 + tx1034 + tx1035 + tx1036 + tx1037 + tx1038 + tx1039 + tx1040 + \
tx1041 + tx1042 + tx1043 + tx1044; (*Rule 220*)\n\ttx1047= mathPower2[tx978]; \
(*Rule 221*)\n\ttx1048=tx973 + tx974; (*Rule 222*)\n\ttx1049=2. DeDPhi tx1046 \
tx1047 tx927 tx971; (*Rule 223*)\n\ttx1050=-(tx1045 tx1047 tx1048 tx930 tx967 \
V); (*Rule 224*)\n\tdhx1x1=tx1049 + tx1050; (*Rule \
225*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I1, 0, \
dhx1x1);*)\n\ttx1051= mathPower2[x2]; (*Rule 227*)\n\ttx1052= mathPower2[x3]; \
(*Rule 228*)\n\ttx1053=tx1021 tx956; (*Rule 229*)\n\ttx1054=tx1051 tx956; \
(*Rule 230*)\n\ttx1055=tx916 tx957; (*Rule 231*)\n\ttx1056=tx909 tx979; \
(*Rule 232*)\n\ttx1057=tx1022 tx980; (*Rule 233*)\n\ttx1058=tx1052 tx980; \
(*Rule 234*)\n\ttx1059=tx912 x1; (*Rule 235*)\n\ttx1060=-2. tx908 x2; (*Rule \
236*)\n\ttx1061=tx909 x3; (*Rule 237*)\n\ttx1062=tx911 x3; (*Rule \
238*)\n\ttx1063=tx912 x3; (*Rule 239*)\n\ttx1064=tx1021 y1; (*Rule \
240*)\n\ttx1065=tx1022 y1; (*Rule 241*)\n\ttx1066=tx1051 y1; (*Rule \
242*)\n\ttx1067=tx1052 y1; (*Rule 243*)\n\ttx1068=x2 x3 y2; (*Rule \
244*)\n\ttx1069=tx924 z1; (*Rule 245*)\n\ttx1070=tx915 z2; (*Rule \
246*)\n\ttx1071=tx916 z2; (*Rule 247*)\n\ttx1072=tx924 z2; (*Rule \
248*)\n\ttx1073=-2. tx919 z3; (*Rule 249*)\n\ttx1074=y3 z2 z3; (*Rule \
250*)\n\ttx1075=tx1053 + tx1054 + tx1055 + tx1056 + tx1057 + tx1058 + tx1059 \
+ tx1060 + tx1061 + tx1062 + tx1063 + tx1064 + tx1065 + tx1066 + tx1067 + \
tx1068 + tx1069 + tx1070 + tx1071 + tx1072 + tx1073 + tx1074; (*Rule \
251*)\n\ttx1076=2. DeDPhi tx1047 tx1075 tx926 tx971; (*Rule \
252*)\n\ttx1077=-(tx1045 tx1047 tx1048 tx929 tx967 V); (*Rule \
253*)\n\tdhy1y1=tx1076 + tx1077; (*Rule \
254*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I1, 1, \
dhy1y1);*)\n\ttx1078=tx921 tx955; (*Rule 256*)\n\ttx1079=tx1019 tx957; (*Rule \
257*)\n\ttx1080=tx1051 tx957; (*Rule 258*)\n\ttx1081=tx919 tx980; (*Rule \
259*)\n\ttx1082=tx1020 tx981; (*Rule 260*)\n\ttx1083=tx1052 tx981; (*Rule \
261*)\n\ttx1084=tx918 x1; (*Rule 262*)\n\ttx1085=tx917 x2; (*Rule \
263*)\n\ttx1086=tx918 x2; (*Rule 264*)\n\ttx1087=tx921 x2; (*Rule \
265*)\n\ttx1088=-2. tx913 x3; (*Rule 266*)\n\ttx1089=tx924 y1; (*Rule \
267*)\n\ttx1090=-2. tx916 y2; (*Rule 268*)\n\ttx1091=tx919 y3; (*Rule \
269*)\n\ttx1092=tx923 y3; (*Rule 270*)\n\ttx1093=tx924 y3; (*Rule \
271*)\n\ttx1094=tx1019 z1; (*Rule 272*)\n\ttx1095=tx1020 z1; (*Rule \
273*)\n\ttx1096=tx1051 z1; (*Rule 274*)\n\ttx1097=tx1052 z1; (*Rule \
275*)\n\ttx1098=y2 y3 z2; (*Rule 276*)\n\ttx1099=x2 x3 z3; (*Rule \
277*)\n\ttx1100=tx1078 + tx1079 + tx1080 + tx1081 + tx1082 + tx1083 + tx1084 \
+ tx1085 + tx1086 + tx1087 + tx1088 + tx1089 + tx1090 + tx1091 + tx1092 + \
tx1093 + tx1094 + tx1095 + tx1096 + tx1097 + tx1098 + tx1099; (*Rule \
278*)\n\ttx1101=2. DeDPhi tx1047 tx1100 tx925 tx971; (*Rule \
279*)\n\ttx1102=-(tx1045 tx1047 tx1048 tx928 tx967 V); (*Rule \
280*)\n\tdhz1z1=tx1101 + tx1102; (*Rule \
281*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I1, 2, \
dhz1z1);*)\n\ttx1103= mathPower2[y1]; (*Rule 283*)\n\ttx1104= mathPower2[z1]; \
(*Rule 284*)\n\ttx1105=-tx1029; (*Rule 285*)\n\ttx1106=-tx1030; (*Rule \
286*)\n\ttx1107=-tx1031; (*Rule 287*)\n\ttx1108=-tx1032; (*Rule \
288*)\n\ttx1109=2. tx1035; (*Rule 289*)\n\ttx1110=2. tx1039; (*Rule \
290*)\n\ttx1111=tx1103 tx955; (*Rule 291*)\n\ttx1112=tx1104 tx955; (*Rule \
292*)\n\ttx1113=tx909 tx956; (*Rule 293*)\n\ttx1114=tx913 tx957; (*Rule \
294*)\n\ttx1115=tx918 tx957; (*Rule 295*)\n\ttx1116=tx908 tx980; (*Rule \
296*)\n\ttx1117=tx912 tx980; (*Rule 297*)\n\ttx1118=tx1020 x2; (*Rule \
298*)\n\ttx1119=tx1022 x2; (*Rule 299*)\n\ttx1120=tx1103 x2; (*Rule \
300*)\n\ttx1121=tx1104 x2; (*Rule 301*)\n\ttx1122=tx1019 x3; (*Rule \
302*)\n\ttx1123=tx1021 x3; (*Rule 303*)\n\ttx1124=-(tx909 y1); (*Rule \
304*)\n\ttx1125=x2 y1 y2; (*Rule 305*)\n\ttx1126=tx907 y3; (*Rule \
306*)\n\ttx1127=tx908 y3; (*Rule 307*)\n\ttx1128=2. tx909 y3; (*Rule \
308*)\n\ttx1129=tx910 y3; (*Rule 309*)\n\ttx1130=x1 y1 y3; (*Rule \
310*)\n\ttx1131=tx917 z1; (*Rule 311*)\n\ttx1132=tx921 z1; (*Rule \
312*)\n\ttx1133=tx913 z2; (*Rule 313*)\n\ttx1134=tx914 z2; (*Rule \
314*)\n\ttx1135=2. tx921 z2; (*Rule 315*)\n\ttx1136=tx922 z2; (*Rule \
316*)\n\ttx1137=tx917 z3; (*Rule 317*)\n\ttx1138=x3 z1 z3; (*Rule \
318*)\n\ttx1139=tx1023 + tx1024 + tx1028 + tx1029 + tx1031 + tx1034 + tx1036 \
+ tx1044 + tx1109 + tx1110 + tx1111 + tx1112 + tx1113 + tx1114 + tx1120 + \
tx1121 + tx1124 + tx1126 + tx1130 + tx1131 + tx1132 + tx1137; (*Rule \
319*)\n\ttx1140=tx1105 + tx1106 + tx1107 + tx1108 + tx1114 + tx1115 + tx1116 \
+ tx1117 + tx1118 + tx1119 + tx1122 + tx1123 + tx1125 + tx1126 + tx1127 + \
tx1128 + tx1129 + tx1133 + tx1134 + tx1135 + tx1136 + tx1138; (*Rule \
320*)\n\ttx1141= mathPower2[y4]; (*Rule 321*)\n\ttx1142= mathPower2[z4]; \
(*Rule 322*)\n\ttx1143=-2. tx1035; (*Rule 323*)\n\ttx1144=-2. tx1039; (*Rule \
324*)\n\ttx1145=-tx1132; (*Rule 325*)\n\ttx1146=tx932 tx956; (*Rule \
326*)\n\ttx1147=tx935 tx956; (*Rule 327*)\n\ttx1148=tx1139 tx927 tx967; \
(*Rule 328*)\n\ttx1149=tx1103 tx979; (*Rule 329*)\n\ttx1150=tx1104 tx979; \
(*Rule 330*)\n\ttx1151=tx1141 tx979; (*Rule 331*)\n\ttx1152=tx1142 tx979; \
(*Rule 332*)\n\ttx1153=tx940 tx981; (*Rule 333*)\n\ttx1154=tx1140 tx927 \
tx994; (*Rule 334*)\n\ttx1155=tx1103 x3; (*Rule 335*)\n\ttx1156=tx1104 x3; \
(*Rule 336*)\n\ttx1157=tx1141 x3; (*Rule 337*)\n\ttx1158=tx1142 x3; (*Rule \
338*)\n\ttx1159=tx1019 x4; (*Rule 339*)\n\ttx1160=tx1020 x4; (*Rule \
340*)\n\ttx1161=tx1021 x4; (*Rule 341*)\n\ttx1162=tx1022 x4; (*Rule \
342*)\n\ttx1163=tx909 y1; (*Rule 343*)\n\ttx1164=tx911 y1; (*Rule \
344*)\n\ttx1165=tx934 y2; (*Rule 345*)\n\ttx1166=tx935 y2; (*Rule \
346*)\n\ttx1167=tx909 y3; (*Rule 347*)\n\ttx1168=-2. tx932 y3; (*Rule \
348*)\n\ttx1169=tx910 y4; (*Rule 349*)\n\ttx1170=tx912 y4; (*Rule \
350*)\n\ttx1171=2. tx1170; (*Rule 351*)\n\ttx1172=tx932 y4; (*Rule \
352*)\n\ttx1173=tx933 y4; (*Rule 353*)\n\ttx1174=tx921 z2; (*Rule \
354*)\n\ttx1175=-2. tx938 z2; (*Rule 355*)\n\ttx1176=x1 z1 z2; (*Rule \
356*)\n\ttx1177=tx936 z3; (*Rule 357*)\n\ttx1178=tx940 z3; (*Rule \
358*)\n\ttx1179=2. tx1178; (*Rule 359*)\n\ttx1180=tx941 z3; (*Rule \
360*)\n\ttx1181=-(tx918 z4); (*Rule 361*)\n\ttx1182=tx918 z4; (*Rule \
362*)\n\ttx1183=-(tx938 z4); (*Rule 363*)\n\ttx1184=x4 z2 z4; (*Rule \
364*)\n\ttx1185=tx1171; (*Rule 365*)\n\ttx1186=tx1179; (*Rule \
366*)\n\ttx1187=tx1148 + tx1154; (*Rule 367*)\n\ttx1188=tx1033 + tx1041 + \
tx1105 + tx1107 + tx1117 + tx1122 + tx1123 + tx1125 + tx1133 + tx1136 + \
tx1143 + tx1144 + tx1145 + tx1149 + tx1150 + tx1155 + tx1156 + tx1163 + \
tx1164 + tx1167 + tx1174 + tx1176; (*Rule 368*)\n\ttx1189=tx1023 + tx1024 + \
tx1026 + tx1027 + tx1036 + tx1038 + tx1043 + tx1044 + tx1147 + tx1153 + \
tx1159 + tx1160 + tx1161 + tx1162 + tx1165 + tx1166 + tx1168 + tx1170 + \
tx1175 + tx1178 + tx1180 + tx1182; (*Rule 369*)\n\ttx1190=tx1026 + tx1027 + \
tx1038 + tx1043 + tx1146 + tx1147 + tx1151 + tx1152 + tx1157 + tx1158 + \
tx1160 + tx1162 + tx1169 + tx1172 + tx1173 + tx1177 + tx1180 + tx1181 + \
tx1183 + tx1184 + tx1185 + tx1186; (*Rule 370*)\n\ttx1191= mathPower2[tx991]; \
(*Rule 371*)\n\ttx1813=tx967; (*Rule 372*)\n\ttx1814= mathReciprocal[tx1813]; \
(*Rule 373*)\n\ttx1815=tx992; (*Rule 374*)\n\ttx1192=tx1814 tx1815; (*Rule \
375*)\n\ttx1193=2. tx1046 tx1047 tx927 tx971; (*Rule 376*)\n\ttx1194=tx1046 \
tx1192 tx927 tx978; (*Rule 377*)\n\ttx1195=-(tx1189 tx1192 tx946 tx991); \
(*Rule 378*)\n\ttx1196=-2. tx1047 tx1187 tx1815; (*Rule 379*)\n\ttx1197=-2. \
tx1190 tx1191 tx1815 tx946 tx993; (*Rule 380*)\n\ttx1198=2. tx1047 tx1188 \
tx1815 tx927 tx994; (*Rule 381*)\n\ttx1199=tx1193 + tx1194 + tx1195 + tx1196 \
+ tx1197 + tx1198; (*Rule 382*)\n\ttx1200= mathPower2[tx998]; (*Rule \
383*)\n\ttx1201=DeDPhi tx1199; (*Rule 384*)\n\ttx1202=-(tx1045 tx1048 tx1200 \
V); (*Rule 385*)\n\tdhx2x2=tx1201 + tx1202; (*Rule \
386*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I2, 0, \
dhx2x2);*)\n\ttx1203= mathPower2[x1]; (*Rule 388*)\n\ttx1204=2. tx1059; \
(*Rule 389*)\n\ttx1205=-tx1064; (*Rule 390*)\n\ttx1206=-tx1065; (*Rule \
391*)\n\ttx1207=-tx1066; (*Rule 392*)\n\ttx1208=-tx1067; (*Rule \
393*)\n\ttx1209=2. tx1071; (*Rule 394*)\n\ttx1210=tx909 tx955; (*Rule \
395*)\n\ttx1211=tx912 tx955; (*Rule 396*)\n\ttx1212=tx1104 tx956; (*Rule \
397*)\n\ttx1213=tx1203 tx956; (*Rule 398*)\n\ttx1214=tx919 tx957; (*Rule \
399*)\n\ttx1215=tx916 tx981; (*Rule 400*)\n\ttx1216=tx924 tx981; (*Rule \
401*)\n\ttx1217=tx907 x1; (*Rule 402*)\n\ttx1218=tx908 x1; (*Rule \
403*)\n\ttx1219=2. tx908 x2; (*Rule 404*)\n\ttx1220=tx909 x2; (*Rule \
405*)\n\ttx1221=tx910 x2; (*Rule 406*)\n\ttx1222=tx911 x2; (*Rule \
407*)\n\ttx1223=tx907 x3; (*Rule 408*)\n\ttx1224=tx1022 y2; (*Rule \
409*)\n\ttx1225=tx1052 y2; (*Rule 410*)\n\ttx1226=tx1104 y2; (*Rule \
411*)\n\ttx1227=tx1203 y2; (*Rule 412*)\n\ttx1228=tx1021 y3; (*Rule \
413*)\n\ttx1229=tx1051 y3; (*Rule 414*)\n\ttx1230=x1 x3 y3; (*Rule \
415*)\n\ttx1231=-(tx919 z1); (*Rule 416*)\n\ttx1232=y2 z1 z2; (*Rule \
417*)\n\ttx1233=tx915 z3; (*Rule 418*)\n\ttx1234=tx916 z3; (*Rule \
419*)\n\ttx1235=2. tx919 z3; (*Rule 420*)\n\ttx1236=tx920 z3; (*Rule \
421*)\n\ttx1237=y1 z1 z3; (*Rule 422*)\n\ttx1238=tx1205 + tx1206 + tx1207 + \
tx1208 + tx1210 + tx1211 + tx1215 + tx1216 + tx1219 + tx1220 + tx1221 + \
tx1222 + tx1224 + tx1225 + tx1228 + tx1229 + tx1230 + tx1232 + tx1233 + \
tx1234 + tx1235 + tx1236; (*Rule 423*)\n\ttx1239=tx1053 + tx1054 + tx1056 + \
tx1064 + tx1066 + tx1068 + tx1070 + tx1072 + tx1204 + tx1209 + tx1210 + \
tx1212 + tx1213 + tx1214 + tx1217 + tx1218 + tx1223 + tx1226 + tx1227 + \
tx1231 + tx1233 + tx1237; (*Rule 424*)\n\ttx1240= mathPower2[x4]; (*Rule \
425*)\n\ttx1241=-2. tx1059; (*Rule 426*)\n\ttx1242=-2. tx1071; (*Rule \
427*)\n\ttx1243=-tx1218; (*Rule 428*)\n\ttx1244=tx937 tx957; (*Rule \
429*)\n\ttx1245=tx943 tx957; (*Rule 430*)\n\ttx1246=tx1239 tx1813 tx926; \
(*Rule 431*)\n\ttx1247=tx932 tx979; (*Rule 432*)\n\ttx1248=tx1104 tx980; \
(*Rule 433*)\n\ttx1249=tx1142 tx980; (*Rule 434*)\n\ttx1250=tx1203 tx980; \
(*Rule 435*)\n\ttx1251=tx1240 tx980; (*Rule 436*)\n\ttx1252=tx1238 tx926 \
tx994; (*Rule 437*)\n\ttx1253=tx908 x2; (*Rule 438*)\n\ttx1254=-2. tx935 x2; \
(*Rule 439*)\n\ttx1255=tx932 x3; (*Rule 440*)\n\ttx1256=2. tx1255; (*Rule \
441*)\n\ttx1257=tx933 x3; (*Rule 442*)\n\ttx1258=tx934 x3; (*Rule \
443*)\n\ttx1259=-(tx912 x4); (*Rule 444*)\n\ttx1260=tx912 x4; (*Rule \
445*)\n\ttx1261=-(tx935 x4); (*Rule 446*)\n\ttx1262=x1 x2 y1; (*Rule \
447*)\n\ttx1263=tx1104 y3; (*Rule 448*)\n\ttx1264=tx1142 y3; (*Rule \
449*)\n\ttx1265=tx1203 y3; (*Rule 450*)\n\ttx1266=tx1240 y3; (*Rule \
451*)\n\ttx1267=tx1021 y4; (*Rule 452*)\n\ttx1268=tx1022 y4; (*Rule \
453*)\n\ttx1269=tx1051 y4; (*Rule 454*)\n\ttx1270=tx1052 y4; (*Rule \
455*)\n\ttx1271=x2 x4 y4; (*Rule 456*)\n\ttx1272=tx919 z1; (*Rule \
457*)\n\ttx1273=tx923 z1; (*Rule 458*)\n\ttx1274=tx942 z2; (*Rule \
459*)\n\ttx1275=tx943 z2; (*Rule 460*)\n\ttx1276=tx919 z3; (*Rule \
461*)\n\ttx1277=-2. tx937 z3; (*Rule 462*)\n\ttx1278=tx920 z4; (*Rule \
463*)\n\ttx1279=tx924 z4; (*Rule 464*)\n\ttx1280=2. tx1279; (*Rule \
465*)\n\ttx1281=tx937 z4; (*Rule 466*)\n\ttx1282=tx939 z4; (*Rule \
467*)\n\ttx1283=tx1256; (*Rule 468*)\n\ttx1284=tx1280; (*Rule \
469*)\n\ttx1285=tx1246 + tx1252; (*Rule 470*)\n\ttx1286=tx1061 + tx1069 + \
tx1205 + tx1207 + tx1216 + tx1220 + tx1221 + tx1228 + tx1229 + tx1232 + \
tx1241 + tx1242 + tx1243 + tx1248 + tx1250 + tx1253 + tx1262 + tx1263 + \
tx1265 + tx1272 + tx1273 + tx1276; (*Rule 471*)\n\ttx1287=tx1053 + tx1054 + \
tx1057 + tx1058 + tx1063 + tx1068 + tx1072 + tx1074 + tx1245 + tx1247 + \
tx1254 + tx1255 + tx1257 + tx1260 + tx1267 + tx1268 + tx1269 + tx1270 + \
tx1274 + tx1275 + tx1277 + tx1279; (*Rule 472*)\n\ttx1288=tx1057 + tx1058 + \
tx1063 + tx1074 + tx1244 + tx1245 + tx1249 + tx1251 + tx1257 + tx1258 + \
tx1259 + tx1261 + tx1264 + tx1266 + tx1268 + tx1270 + tx1271 + tx1278 + \
tx1281 + tx1282 + tx1283 + tx1284; (*Rule 473*)\n\ttx1289=2. tx1047 tx1075 \
tx926 tx971; (*Rule 474*)\n\ttx1290=tx1075 tx1192 tx926 tx978; (*Rule \
475*)\n\ttx1291=-(tx1192 tx1287 tx945 tx991); (*Rule 476*)\n\ttx1292=-2. \
tx1047 tx1285 tx1815; (*Rule 477*)\n\ttx1293=-2. tx1191 tx1288 tx1815 tx945 \
tx993; (*Rule 478*)\n\ttx1294=2. tx1047 tx1286 tx1815 tx926 tx994; (*Rule \
479*)\n\ttx1295= mathPower2[tx1002]; (*Rule 480*)\n\ttx1296=tx1289 + tx1290 + \
tx1291 + tx1292 + tx1293 + tx1294; (*Rule 481*)\n\ttx1297=DeDPhi tx1296; \
(*Rule 482*)\n\ttx1298=-(tx1045 tx1048 tx1295 V); (*Rule \
483*)\n\tdhy2y2=tx1297 + tx1298; (*Rule \
484*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I2, 1, \
dhy2y2);*)\n\ttx1299=2. tx1087; (*Rule 486*)\n\ttx1300=2. tx1089; (*Rule \
487*)\n\ttx1301=-tx1094; (*Rule 488*)\n\ttx1302=-tx1095; (*Rule \
489*)\n\ttx1303=-tx1096; (*Rule 490*)\n\ttx1304=-tx1097; (*Rule \
491*)\n\ttx1305=tx913 tx955; (*Rule 492*)\n\ttx1306=tx919 tx956; (*Rule \
493*)\n\ttx1307=tx924 tx956; (*Rule 494*)\n\ttx1308=tx1103 tx957; (*Rule \
495*)\n\ttx1309=tx1203 tx957; (*Rule 496*)\n\ttx1310=tx918 tx979; (*Rule \
497*)\n\ttx1311=tx921 tx979; (*Rule 498*)\n\ttx1312=-(tx913 x1); (*Rule \
499*)\n\ttx1313=2. tx913 x3; (*Rule 500*)\n\ttx1314=tx917 x3; (*Rule \
501*)\n\ttx1315=tx921 x3; (*Rule 502*)\n\ttx1316=tx922 x3; (*Rule \
503*)\n\ttx1317=tx915 y1; (*Rule 504*)\n\ttx1318=tx916 y1; (*Rule \
505*)\n\ttx1319=2. tx916 y2; (*Rule 506*)\n\ttx1320=tx919 y2; (*Rule \
507*)\n\ttx1321=tx920 y2; (*Rule 508*)\n\ttx1322=tx923 y2; (*Rule \
509*)\n\ttx1323=tx915 y3; (*Rule 510*)\n\ttx1324=x1 x3 z1; (*Rule \
511*)\n\ttx1325=tx1020 z2; (*Rule 512*)\n\ttx1326=tx1052 z2; (*Rule \
513*)\n\ttx1327=tx1103 z2; (*Rule 514*)\n\ttx1328=tx1203 z2; (*Rule \
515*)\n\ttx1329=x1 x2 z2; (*Rule 516*)\n\ttx1330=tx1019 z3; (*Rule \
517*)\n\ttx1331=tx1051 z3; (*Rule 518*)\n\ttx1332=y1 y3 z3; (*Rule \
519*)\n\ttx1333=tx1079 + tx1080 + tx1081 + tx1085 + tx1086 + tx1094 + tx1096 \
+ tx1098 + tx1299 + tx1300 + tx1305 + tx1306 + tx1308 + tx1309 + tx1312 + \
tx1314 + tx1317 + tx1318 + tx1323 + tx1324 + tx1327 + tx1328; (*Rule \
520*)\n\ttx1334=tx1301 + tx1302 + tx1303 + tx1304 + tx1306 + tx1307 + tx1310 \
+ tx1311 + tx1313 + tx1314 + tx1315 + tx1316 + tx1319 + tx1320 + tx1321 + \
tx1322 + tx1325 + tx1326 + tx1329 + tx1330 + tx1331 + tx1332; (*Rule \
521*)\n\ttx1335=-2. tx1087; (*Rule 522*)\n\ttx1336=-2. tx1089; (*Rule \
523*)\n\ttx1337=-tx1318; (*Rule 524*)\n\ttx1338=tx938 tx955; (*Rule \
525*)\n\ttx1339=tx940 tx955; (*Rule 526*)\n\ttx1340=tx1333 tx1813 tx925; \
(*Rule 527*)\n\ttx1341=tx937 tx980; (*Rule 528*)\n\ttx1342=tx1103 tx981; \
(*Rule 529*)\n\ttx1343=tx1141 tx981; (*Rule 530*)\n\ttx1344=tx1203 tx981; \
(*Rule 531*)\n\ttx1345=tx1240 tx981; (*Rule 532*)\n\ttx1346=tx1334 tx925 \
tx994; (*Rule 533*)\n\ttx1347=tx913 x1; (*Rule 534*)\n\ttx1348=tx914 x1; \
(*Rule 535*)\n\ttx1349=tx936 x2; (*Rule 536*)\n\ttx1350=tx938 x2; (*Rule \
537*)\n\ttx1351=tx913 x3; (*Rule 538*)\n\ttx1352=-2. tx940 x3; (*Rule \
539*)\n\ttx1353=tx918 x4; (*Rule 540*)\n\ttx1354=2. tx1353; (*Rule \
541*)\n\ttx1355=tx922 x4; (*Rule 542*)\n\ttx1356=tx940 x4; (*Rule \
543*)\n\ttx1357=tx941 x4; (*Rule 544*)\n\ttx1358=tx916 y2; (*Rule \
545*)\n\ttx1359=-2. tx943 y2; (*Rule 546*)\n\ttx1360=tx937 y3; (*Rule \
547*)\n\ttx1361=2. tx1360; (*Rule 548*)\n\ttx1362=tx939 y3; (*Rule \
549*)\n\ttx1363=tx942 y3; (*Rule 550*)\n\ttx1364=-(tx924 y4); (*Rule \
551*)\n\ttx1365=tx924 y4; (*Rule 552*)\n\ttx1366=-(tx943 y4); (*Rule \
553*)\n\ttx1367=y1 y2 z1; (*Rule 554*)\n\ttx1368=tx1103 z3; (*Rule \
555*)\n\ttx1369=tx1141 z3; (*Rule 556*)\n\ttx1370=tx1203 z3; (*Rule \
557*)\n\ttx1371=tx1240 z3; (*Rule 558*)\n\ttx1372=tx1019 z4; (*Rule \
559*)\n\ttx1373=tx1020 z4; (*Rule 560*)\n\ttx1374=tx1051 z4; (*Rule \
561*)\n\ttx1375=tx1052 z4; (*Rule 562*)\n\ttx1376=y2 y4 z4; (*Rule \
563*)\n\ttx1377=tx1354; (*Rule 564*)\n\ttx1378=tx1361; (*Rule \
565*)\n\ttx1379=tx1340 + tx1346; (*Rule 566*)\n\ttx1380=tx1084 + tx1091 + \
tx1301 + tx1303 + tx1310 + tx1320 + tx1321 + tx1329 + tx1330 + tx1331 + \
tx1335 + tx1336 + tx1337 + tx1342 + tx1344 + tx1347 + tx1348 + tx1351 + \
tx1358 + tx1367 + tx1368 + tx1370; (*Rule 567*)\n\ttx1381=tx1079 + tx1080 + \
tx1082 + tx1083 + tx1086 + tx1093 + tx1098 + tx1099 + tx1338 + tx1341 + \
tx1349 + tx1350 + tx1352 + tx1353 + tx1359 + tx1360 + tx1362 + tx1365 + \
tx1372 + tx1373 + tx1374 + tx1375; (*Rule 568*)\n\ttx1382=tx1082 + tx1083 + \
tx1093 + tx1099 + tx1338 + tx1339 + tx1343 + tx1345 + tx1355 + tx1356 + \
tx1357 + tx1362 + tx1363 + tx1364 + tx1366 + tx1369 + tx1371 + tx1373 + \
tx1375 + tx1376 + tx1377 + tx1378; (*Rule 569*)\n\ttx1383=2. tx1047 tx1100 \
tx925 tx971; (*Rule 570*)\n\ttx1384=tx1100 tx1192 tx925 tx978; (*Rule \
571*)\n\ttx1385=-(tx1192 tx1381 tx944 tx991); (*Rule 572*)\n\ttx1386=-2. \
tx1047 tx1379 tx1815; (*Rule 573*)\n\ttx1387=-2. tx1191 tx1382 tx1815 tx944 \
tx993; (*Rule 574*)\n\ttx1388=2. tx1047 tx1380 tx1815 tx925 tx994; (*Rule \
575*)\n\ttx1389= mathPower2[tx1006]; (*Rule 576*)\n\ttx1390=tx1383 + tx1384 + \
tx1385 + tx1386 + tx1387 + tx1388; (*Rule 577*)\n\ttx1391=DeDPhi tx1390; \
(*Rule 578*)\n\ttx1392=-(tx1045 tx1048 tx1389 V); (*Rule \
579*)\n\tdhz2z2=tx1391 + tx1392; (*Rule \
580*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I2, 2, \
dhz2z2);*)\n\ttx1393=-tx1159; (*Rule 582*)\n\ttx1394=-tx1160; (*Rule \
583*)\n\ttx1395=-tx1161; (*Rule 584*)\n\ttx1396=-tx1162; (*Rule \
585*)\n\ttx1397=-2. tx1170; (*Rule 586*)\n\ttx1398=-tx1170; (*Rule \
587*)\n\ttx1399=-tx1172; (*Rule 588*)\n\ttx1400=-2. tx1178; (*Rule \
589*)\n\ttx1401=tx1141 tx955; (*Rule 590*)\n\ttx1402=tx1142 tx955; (*Rule \
591*)\n\ttx1403=tx1141 x2; (*Rule 592*)\n\ttx1404=tx1142 x2; (*Rule \
593*)\n\ttx1405=tx932 y3; (*Rule 594*)\n\ttx1406=2. tx1405; (*Rule \
595*)\n\ttx1407=tx935 y3; (*Rule 596*)\n\ttx1408=x2 y2 y4; (*Rule \
597*)\n\ttx1409=x4 y3 y4; (*Rule 598*)\n\ttx1410=tx938 z2; (*Rule \
599*)\n\ttx1411=2. tx1410; (*Rule 600*)\n\ttx1412=tx940 z2; (*Rule \
601*)\n\ttx1413=tx922 z4; (*Rule 602*)\n\ttx1414=tx936 z4; (*Rule \
603*)\n\ttx1415=tx938 z4; (*Rule 604*)\n\ttx1416=x3 z3 z4; (*Rule \
605*)\n\ttx1417=tx1406; (*Rule 606*)\n\ttx1418=tx1411; (*Rule \
607*)\n\ttx1419=tx1115 + tx1118 + tx1119 + tx1129 + tx1166 + tx1182 + tx1394 \
+ tx1396 + tx1397 + tx1399 + tx1400 + tx1401 + tx1402 + tx1403 + tx1404 + \
tx1405 + tx1407 + tx1409 + tx1410 + tx1414 + tx1415 + tx1416; (*Rule \
608*)\n\ttx1420=tx1115 + tx1117 + tx1118 + tx1119 + tx1122 + tx1123 + tx1129 \
+ tx1136 + tx1169 + tx1181 + tx1393 + tx1394 + tx1395 + tx1396 + tx1398 + \
tx1407 + tx1408 + tx1412 + tx1413 + tx1416 + tx1417 + tx1418; (*Rule \
609*)\n\ttx1421=tx1419 tx1813 tx946; (*Rule 610*)\n\ttx1422=tx1420 tx946 \
tx993; (*Rule 611*)\n\ttx1423=tx1421 + tx1422; (*Rule 612*)\n\ttx1424=-2. \
tx1189 tx1191 tx946 tx971; (*Rule 613*)\n\ttx1425=-2. tx1191 tx1423 tx1815; \
(*Rule 614*)\n\ttx1426= mathPower2[tx1010]; (*Rule 615*)\n\ttx1427=tx1194 + \
tx1195 + tx1197 + tx1198 + tx1424 + tx1425; (*Rule 616*)\n\ttx1428=DeDPhi \
tx1427; (*Rule 617*)\n\ttx1429=-(tx1045 tx1048 tx1426 V); (*Rule \
618*)\n\tdhx3x3=tx1428 + tx1429; (*Rule \
619*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I3, 0, \
dhx3x3);*)\n\ttx1430=-2. tx1255; (*Rule 621*)\n\ttx1431=-tx1267; (*Rule \
622*)\n\ttx1432=-tx1268; (*Rule 623*)\n\ttx1433=-tx1269; (*Rule \
624*)\n\ttx1434=-tx1270; (*Rule 625*)\n\ttx1435=-2. tx1279; (*Rule \
626*)\n\ttx1436=-tx1279; (*Rule 627*)\n\ttx1437=-tx1281; (*Rule \
628*)\n\ttx1438=tx1142 tx956; (*Rule 629*)\n\ttx1439=tx1240 tx956; (*Rule \
630*)\n\ttx1440=tx932 x2; (*Rule 631*)\n\ttx1441=tx935 x2; (*Rule \
632*)\n\ttx1442=2. tx1441; (*Rule 633*)\n\ttx1443=tx910 x4; (*Rule \
634*)\n\ttx1444=tx934 x4; (*Rule 635*)\n\ttx1445=tx935 x4; (*Rule \
636*)\n\ttx1446=tx1142 y2; (*Rule 637*)\n\ttx1447=tx1240 y2; (*Rule \
638*)\n\ttx1448=x3 x4 y3; (*Rule 639*)\n\ttx1449=tx937 z3; (*Rule \
640*)\n\ttx1450=2. tx1449; (*Rule 641*)\n\ttx1451=tx943 z3; (*Rule \
642*)\n\ttx1452=y2 z2 z4; (*Rule 643*)\n\ttx1453=y4 z3 z4; (*Rule \
644*)\n\ttx1454=tx1442; (*Rule 645*)\n\ttx1455=tx1450; (*Rule \
646*)\n\ttx1456=tx1211 + tx1224 + tx1225 + tx1236 + tx1260 + tx1275 + tx1430 \
+ tx1432 + tx1434 + tx1435 + tx1437 + tx1438 + tx1439 + tx1441 + tx1444 + \
tx1445 + tx1446 + tx1447 + tx1448 + tx1449 + tx1451 + tx1453; (*Rule \
647*)\n\ttx1457=tx1211 + tx1216 + tx1221 + tx1224 + tx1225 + tx1228 + tx1229 \
+ tx1236 + tx1259 + tx1278 + tx1431 + tx1432 + tx1433 + tx1434 + tx1436 + \
tx1440 + tx1443 + tx1448 + tx1451 + tx1452 + tx1454 + tx1455; (*Rule \
648*)\n\ttx1458=tx1456 tx1813 tx945; (*Rule 649*)\n\ttx1459=tx1457 tx945 \
tx993; (*Rule 650*)\n\ttx1460=tx1458 + tx1459; (*Rule 651*)\n\ttx1461=-2. \
tx1191 tx1287 tx945 tx971; (*Rule 652*)\n\ttx1462=-2. tx1191 tx1460 tx1815; \
(*Rule 653*)\n\ttx1463= mathPower2[tx1014]; (*Rule 654*)\n\ttx1464=tx1290 + \
tx1291 + tx1293 + tx1294 + tx1461 + tx1462; (*Rule 655*)\n\ttx1465=DeDPhi \
tx1464; (*Rule 656*)\n\ttx1466=-(tx1045 tx1048 tx1463 V); (*Rule \
657*)\n\tdhy3y3=tx1465 + tx1466; (*Rule \
658*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I3, 1, \
dhy3y3);*)\n\ttx1467=-2. tx1353; (*Rule 660*)\n\ttx1468=-tx1353; (*Rule \
661*)\n\ttx1469=-tx1356; (*Rule 662*)\n\ttx1470=-2. tx1360; (*Rule \
663*)\n\ttx1471=-tx1372; (*Rule 664*)\n\ttx1472=-tx1373; (*Rule \
665*)\n\ttx1473=-tx1374; (*Rule 666*)\n\ttx1474=-tx1375; (*Rule \
667*)\n\ttx1475=tx1141 tx957; (*Rule 668*)\n\ttx1476=tx1240 tx957; (*Rule \
669*)\n\ttx1477=tx938 x3; (*Rule 670*)\n\ttx1478=tx940 x3; (*Rule \
671*)\n\ttx1479=2. tx1478; (*Rule 672*)\n\ttx1480=tx937 y2; (*Rule \
673*)\n\ttx1481=tx943 y2; (*Rule 674*)\n\ttx1482=2. tx1481; (*Rule \
675*)\n\ttx1483=tx920 y4; (*Rule 676*)\n\ttx1484=tx942 y4; (*Rule \
677*)\n\ttx1485=tx943 y4; (*Rule 678*)\n\ttx1486=tx1141 z2; (*Rule \
679*)\n\ttx1487=tx1240 z2; (*Rule 680*)\n\ttx1488=x2 x4 z2; (*Rule \
681*)\n\ttx1489=y3 y4 z3; (*Rule 682*)\n\ttx1490=x3 x4 z4; (*Rule \
683*)\n\ttx1491=tx1479; (*Rule 684*)\n\ttx1492=tx1482; (*Rule \
685*)\n\ttx1493=tx1307 + tx1316 + tx1325 + tx1326 + tx1350 + tx1365 + tx1467 \
+ tx1469 + tx1470 + tx1472 + tx1474 + tx1475 + tx1476 + tx1477 + tx1478 + \
tx1481 + tx1484 + tx1485 + tx1486 + tx1487 + tx1489 + tx1490; (*Rule \
686*)\n\ttx1494=tx1307 + tx1310 + tx1316 + tx1321 + tx1325 + tx1326 + tx1330 \
+ tx1331 + tx1355 + tx1364 + tx1468 + tx1471 + tx1472 + tx1473 + tx1474 + \
tx1477 + tx1480 + tx1483 + tx1488 + tx1489 + tx1491 + tx1492; (*Rule \
687*)\n\ttx1495=tx1493 tx1813 tx944; (*Rule 688*)\n\ttx1496=tx1494 tx944 \
tx993; (*Rule 689*)\n\ttx1497=tx1495 + tx1496; (*Rule 690*)\n\ttx1498=-2. \
tx1191 tx1381 tx944 tx971; (*Rule 691*)\n\ttx1499=-2. tx1191 tx1497 tx1815; \
(*Rule 692*)\n\ttx1500= mathPower2[tx1018]; (*Rule 693*)\n\ttx1501=tx1384 + \
tx1385 + tx1387 + tx1388 + tx1498 + tx1499; (*Rule 694*)\n\ttx1502=DeDPhi \
tx1501; (*Rule 695*)\n\ttx1503=-(tx1045 tx1048 tx1500 V); (*Rule \
696*)\n\tdhz3z3=tx1502 + tx1503; (*Rule \
697*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I3, 2, \
dhz3z3);*)\n\ttx1504=DeDPhi tx1424; (*Rule 699*)\n\ttx1505=-(tx1045 tx1048 \
tx1191 tx1813 tx949 V); (*Rule 700*)\n\tdhx4x4=tx1504 + tx1505; (*Rule \
701*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I4, 0, I4, 0, \
dhx4x4);*)\n\ttx1506=DeDPhi tx1461; (*Rule 703*)\n\ttx1507=-(tx1045 tx1048 \
tx1191 tx1813 tx948 V); (*Rule 704*)\n\tdhy4y4=tx1506 + tx1507; (*Rule \
705*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I4, 1, I4, 1, \
dhy4y4);*)\n\ttx1508=DeDPhi tx1498; (*Rule 707*)\n\ttx1509=-(tx1045 tx1048 \
tx1191 tx1813 tx947 V); (*Rule 708*)\n\tdhz4z4=tx1508 + tx1509; (*Rule \
709*)\n\t(*DIHEDRAL_DIAGONAL_HESSIAN_ACCUMULATE(I4, 2, I4, 2, \
dhz4z4);*)\n\t(*#ifdef DIHEDRAL_CALC_OFF_DIAGONAL_HESSIAN //[*)\n\t(*if \
(calcOffDiagonalHessian) { *)\n\ttx1510=tx1046 tx926; (*Rule \
713*)\n\ttx1511=tx1075 tx927; (*Rule 714*)\n\ttx1512=tx1510 + tx1511; (*Rule \
715*)\n\ttx1513=DeDPhi tx1047 tx1512 tx971; (*Rule 716*)\n\ttx1514=-(tx1045 \
tx1047 tx1048 tx1813 tx926 tx927 V); (*Rule 717*)\n\tohx1y1=tx1513 + tx1514; \
(*Rule 718*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I1, 1, \
ohx1y1);*)\n\ttx1515=tx1046 tx925; (*Rule 720*)\n\ttx1516=tx1100 tx927; \
(*Rule 721*)\n\ttx1517=tx1515 + tx1516; (*Rule 722*)\n\ttx1518=DeDPhi tx1047 \
tx1517 tx971; (*Rule 723*)\n\ttx1519=-(tx1045 tx1047 tx1048 tx1813 tx925 \
tx927 V); (*Rule 724*)\n\tohx1z1=tx1518 + tx1519; (*Rule \
725*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I1, 2, \
ohx1z1);*)\n\ttx1520=-2. tx1046 tx1047 tx927 tx971; (*Rule \
727*)\n\ttx1521=tx1047 tx1187 tx1815; (*Rule 728*)\n\ttx1522=tx1520 + tx1521; \
(*Rule 729*)\n\ttx1523=DeDPhi tx1522; (*Rule 730*)\n\ttx1524=tx1045 tx1048 \
tx995 tx998 V; (*Rule 731*)\n\tohx1x2=tx1523 + tx1524; (*Rule \
732*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I2, 0, \
ohx1x2);*)\n\ttx1525=tx1139 tx1813 tx926; (*Rule 734*)\n\ttx1526=tx1238 tx927 \
tx994; (*Rule 735*)\n\ttx1527=tx1525 + tx1526; (*Rule \
736*)\n\ttx1528=-(tx1047 tx1512 tx971); (*Rule 737*)\n\ttx1529=tx1047 tx1527 \
tx1815; (*Rule 738*)\n\ttx1530=tx1528 + tx1529; (*Rule 739*)\n\ttx1531=DeDPhi \
tx1530; (*Rule 740*)\n\ttx1532=tx1002 tx1045 tx1048 tx995 V; (*Rule \
741*)\n\tohx1y2=tx1531 + tx1532; (*Rule \
742*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I2, 1, \
ohx1y2);*)\n\ttx1533=tx1139 tx1813 tx925; (*Rule 744*)\n\ttx1534=tx1334 tx927 \
tx994; (*Rule 745*)\n\ttx1535=tx1533 + tx1534; (*Rule \
746*)\n\ttx1536=-(tx1047 tx1517 tx971); (*Rule 747*)\n\ttx1537=tx1047 tx1535 \
tx1815; (*Rule 748*)\n\ttx1538=tx1536 + tx1537; (*Rule 749*)\n\ttx1539=DeDPhi \
tx1538; (*Rule 750*)\n\ttx1540=tx1006 tx1045 tx1048 tx995 V; (*Rule \
751*)\n\tohx1z2=tx1539 + tx1540; (*Rule \
752*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I2, 2, \
ohx1z2);*)\n\ttx1541=-(DeDPhi tx1521); (*Rule 754*)\n\ttx1542=tx1010 tx1045 \
tx1048 tx995 V; (*Rule 755*)\n\tohx1x3=tx1541 + tx1542; (*Rule \
756*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I3, 0, \
ohx1x3);*)\n\ttx1543=-(DeDPhi tx1529); (*Rule 758*)\n\ttx1544=tx1014 tx1045 \
tx1048 tx995 V; (*Rule 759*)\n\tohx1y3=tx1543 + tx1544; (*Rule \
760*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I3, 1, \
ohx1y3);*)\n\ttx1545=-(DeDPhi tx1537); (*Rule 762*)\n\ttx1546=tx1018 tx1045 \
tx1048 tx995 V; (*Rule 763*)\n\tohx1z3=tx1545 + tx1546; (*Rule \
764*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I3, 2, \
ohx1z3);*)\n\tohx1x4=tx1045 tx1048 tx1813 tx953 tx978 tx991 V; (*Rule \
766*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I4, 0, \
ohx1x4);*)\n\tohx1y4=tx1045 tx1048 tx1813 tx927 tx945 tx978 tx991 V; (*Rule \
768*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I4, 1, \
ohx1y4);*)\n\tohx1z4=tx1045 tx1048 tx1813 tx927 tx944 tx978 tx991 V; (*Rule \
770*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 0, I4, 2, \
ohx1z4);*)\n\ttx1547=tx1075 tx925; (*Rule 772*)\n\ttx1548=tx1100 tx926; \
(*Rule 773*)\n\ttx1549=tx1547 + tx1548; (*Rule 774*)\n\ttx1550=DeDPhi tx1047 \
tx1549 tx971; (*Rule 775*)\n\ttx1551=-(tx1045 tx1047 tx1048 tx1813 tx925 \
tx926 V); (*Rule 776*)\n\tohy1z1=tx1550 + tx1551; (*Rule \
777*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I1, 2, \
ohy1z1);*)\n\ttx1552=tx1239 tx1813 tx927; (*Rule 779*)\n\ttx1553=tx1140 tx926 \
tx994; (*Rule 780*)\n\ttx1554=tx1552 + tx1553; (*Rule 781*)\n\ttx1555=tx1047 \
tx1554 tx1815; (*Rule 782*)\n\ttx1556=tx1528 + tx1555; (*Rule \
783*)\n\ttx1557=DeDPhi tx1556; (*Rule 784*)\n\ttx1558=tx1045 tx1048 tx998 \
tx999 V; (*Rule 785*)\n\tohy1x2=tx1557 + tx1558; (*Rule \
786*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I2, 0, \
ohy1x2);*)\n\ttx1559=-2. tx1047 tx1075 tx926 tx971; (*Rule \
788*)\n\ttx1560=tx1047 tx1285 tx1815; (*Rule 789*)\n\ttx1561=tx1559 + tx1560; \
(*Rule 790*)\n\ttx1562=DeDPhi tx1561; (*Rule 791*)\n\ttx1563=tx1002 tx1045 \
tx1048 tx999 V; (*Rule 792*)\n\tohy1y2=tx1562 + tx1563; (*Rule \
793*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I2, 1, \
ohy1y2);*)\n\ttx1564=tx1239 tx1813 tx925; (*Rule 795*)\n\ttx1565=tx1334 tx926 \
tx994; (*Rule 796*)\n\ttx1566=tx1564 + tx1565; (*Rule \
797*)\n\ttx1567=-(tx1047 tx1549 tx971); (*Rule 798*)\n\ttx1568=tx1047 tx1566 \
tx1815; (*Rule 799*)\n\ttx1569=tx1567 + tx1568; (*Rule 800*)\n\ttx1570=DeDPhi \
tx1569; (*Rule 801*)\n\ttx1571=tx1006 tx1045 tx1048 tx999 V; (*Rule \
802*)\n\tohy1z2=tx1570 + tx1571; (*Rule \
803*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I2, 2, \
ohy1z2);*)\n\ttx1572=-(DeDPhi tx1555); (*Rule 805*)\n\ttx1573=tx1010 tx1045 \
tx1048 tx999 V; (*Rule 806*)\n\tohy1x3=tx1572 + tx1573; (*Rule \
807*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I3, 0, \
ohy1x3);*)\n\ttx1574=-(DeDPhi tx1560); (*Rule 809*)\n\ttx1575=tx1014 tx1045 \
tx1048 tx999 V; (*Rule 810*)\n\tohy1y3=tx1574 + tx1575; (*Rule \
811*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I3, 1, \
ohy1y3);*)\n\ttx1576=-(DeDPhi tx1568); (*Rule 813*)\n\ttx1577=tx1018 tx1045 \
tx1048 tx999 V; (*Rule 814*)\n\tohy1z3=tx1576 + tx1577; (*Rule \
815*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I3, 2, \
ohy1z3);*)\n\tohy1x4=tx1045 tx1048 tx1813 tx926 tx946 tx978 tx991 V; (*Rule \
817*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I4, 0, \
ohy1x4);*)\n\tohy1y4=tx1045 tx1048 tx1813 tx952 tx978 tx991 V; (*Rule \
819*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I4, 1, \
ohy1y4);*)\n\tohy1z4=tx1045 tx1048 tx1813 tx926 tx944 tx978 tx991 V; (*Rule \
821*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 1, I4, 2, \
ohy1z4);*)\n\ttx1578=tx1333 tx1813 tx927; (*Rule 823*)\n\ttx1579=tx1140 tx925 \
tx994; (*Rule 824*)\n\ttx1580=tx1578 + tx1579; (*Rule 825*)\n\ttx1581=tx1047 \
tx1580 tx1815; (*Rule 826*)\n\ttx1582=tx1536 + tx1581; (*Rule \
827*)\n\ttx1583=DeDPhi tx1582; (*Rule 828*)\n\ttx1584=tx1003 tx1045 tx1048 \
tx998 V; (*Rule 829*)\n\tohz1x2=tx1583 + tx1584; (*Rule \
830*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I2, 0, \
ohz1x2);*)\n\ttx1585=tx1333 tx1813 tx926; (*Rule 832*)\n\ttx1586=tx1238 tx925 \
tx994; (*Rule 833*)\n\ttx1587=tx1585 + tx1586; (*Rule 834*)\n\ttx1588=tx1047 \
tx1587 tx1815; (*Rule 835*)\n\ttx1589=tx1567 + tx1588; (*Rule \
836*)\n\ttx1590=DeDPhi tx1589; (*Rule 837*)\n\ttx1591=tx1002 tx1003 tx1045 \
tx1048 V; (*Rule 838*)\n\tohz1y2=tx1590 + tx1591; (*Rule \
839*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I2, 1, \
ohz1y2);*)\n\ttx1592=-2. tx1047 tx1100 tx925 tx971; (*Rule \
841*)\n\ttx1593=tx1047 tx1379 tx1815; (*Rule 842*)\n\ttx1594=tx1592 + tx1593; \
(*Rule 843*)\n\ttx1595=DeDPhi tx1594; (*Rule 844*)\n\ttx1596=tx1003 tx1006 \
tx1045 tx1048 V; (*Rule 845*)\n\tohz1z2=tx1595 + tx1596; (*Rule \
846*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I2, 2, \
ohz1z2);*)\n\ttx1597=-(DeDPhi tx1581); (*Rule 848*)\n\ttx1598=tx1003 tx1010 \
tx1045 tx1048 V; (*Rule 849*)\n\tohz1x3=tx1597 + tx1598; (*Rule \
850*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I3, 0, \
ohz1x3);*)\n\ttx1599=-(DeDPhi tx1588); (*Rule 852*)\n\ttx1600=tx1003 tx1014 \
tx1045 tx1048 V; (*Rule 853*)\n\tohz1y3=tx1599 + tx1600; (*Rule \
854*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I3, 1, \
ohz1y3);*)\n\ttx1601=-(DeDPhi tx1593); (*Rule 856*)\n\ttx1602=tx1003 tx1018 \
tx1045 tx1048 V; (*Rule 857*)\n\tohz1z3=tx1601 + tx1602; (*Rule \
858*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I3, 2, \
ohz1z3);*)\n\tohz1x4=tx1045 tx1048 tx1813 tx925 tx946 tx978 tx991 V; (*Rule \
860*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I4, 0, \
ohz1x4);*)\n\tohz1y4=tx1045 tx1048 tx1813 tx925 tx945 tx978 tx991 V; (*Rule \
862*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I4, 1, \
ohz1y4);*)\n\tohz1z4=tx1045 tx1048 tx1813 tx951 tx978 tx991 V; (*Rule \
864*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I1, 2, I4, 2, \
ohz1z4);*)\n\ttx1603=tx1188 tx926; (*Rule 866*)\n\ttx1604=tx1286 tx927; \
(*Rule 867*)\n\ttx1605=tx1189 tx945; (*Rule 868*)\n\ttx1606=tx1190 tx945; \
(*Rule 869*)\n\ttx1607=tx1287 tx946; (*Rule 870*)\n\ttx1608=tx1288 tx946; \
(*Rule 871*)\n\ttx1609=tx1603 + tx1604; (*Rule 872*)\n\ttx1610=tx1605 + \
tx1607; (*Rule 873*)\n\ttx1611=tx1606 + tx1608; (*Rule \
874*)\n\ttx1612=-tx1529; (*Rule 875*)\n\ttx1613=-tx1555; (*Rule \
876*)\n\ttx1614=tx1047 tx1512 tx971; (*Rule 877*)\n\ttx1615=0.5 tx1192 tx1512 \
tx978; (*Rule 878*)\n\ttx1616=-0.5 tx1192 tx1610 tx991; (*Rule \
879*)\n\ttx1617=-(tx1191 tx1611 tx1815 tx993); (*Rule 880*)\n\ttx1618=tx1047 \
tx1609 tx1815 tx994; (*Rule 881*)\n\ttx1619=tx1612 + tx1613 + tx1614 + tx1615 \
+ tx1616 + tx1617 + tx1618; (*Rule 882*)\n\ttx1620=DeDPhi tx1619; (*Rule \
883*)\n\ttx1621=-(tx1002 tx1045 tx1048 tx998 V); (*Rule \
884*)\n\tohx2y2=tx1620 + tx1621; (*Rule \
885*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I2, 1, \
ohx2y2);*)\n\ttx1622=tx1188 tx925; (*Rule 887*)\n\ttx1623=tx1380 tx927; \
(*Rule 888*)\n\ttx1624=tx1189 tx944; (*Rule 889*)\n\ttx1625=tx1190 tx944; \
(*Rule 890*)\n\ttx1626=tx1381 tx946; (*Rule 891*)\n\ttx1627=tx1382 tx946; \
(*Rule 892*)\n\ttx1628=tx1622 + tx1623; (*Rule 893*)\n\ttx1629=tx1624 + \
tx1626; (*Rule 894*)\n\ttx1630=tx1625 + tx1627; (*Rule \
895*)\n\ttx1631=-tx1537; (*Rule 896*)\n\ttx1632=-tx1581; (*Rule \
897*)\n\ttx1633=tx1047 tx1517 tx971; (*Rule 898*)\n\ttx1634=0.5 tx1192 tx1517 \
tx978; (*Rule 899*)\n\ttx1635=-0.5 tx1192 tx1629 tx991; (*Rule \
900*)\n\ttx1636=-(tx1191 tx1630 tx1815 tx993); (*Rule 901*)\n\ttx1637=tx1047 \
tx1628 tx1815 tx994; (*Rule 902*)\n\ttx1638=tx1631 + tx1632 + tx1633 + tx1634 \
+ tx1635 + tx1636 + tx1637; (*Rule 903*)\n\ttx1639=DeDPhi tx1638; (*Rule \
904*)\n\ttx1640=-(tx1006 tx1045 tx1048 tx998 V); (*Rule \
905*)\n\tohx2z2=tx1639 + tx1640; (*Rule \
906*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I2, 2, \
ohx2z2);*)\n\ttx1641=-tx1194; (*Rule 908*)\n\ttx1642=tx1189 tx1192 tx946 \
tx991; (*Rule 909*)\n\ttx1643=tx1191 tx1423 tx1815; (*Rule 910*)\n\ttx1644=2. \
tx1190 tx1191 tx1815 tx946 tx993; (*Rule 911*)\n\ttx1645=-2. tx1047 tx1188 \
tx1815 tx927 tx994; (*Rule 912*)\n\ttx1646=tx1521 + tx1641 + tx1642 + tx1643 \
+ tx1644 + tx1645; (*Rule 913*)\n\ttx1647=DeDPhi tx1646; (*Rule \
914*)\n\ttx1648=-(tx1010 tx1045 tx1048 tx998 V); (*Rule \
915*)\n\tohx2x3=tx1647 + tx1648; (*Rule \
916*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I3, 0, \
ohx2x3);*)\n\ttx1649=tx1456 tx1813 tx946; (*Rule 918*)\n\ttx1650=tx1420 tx945 \
tx993; (*Rule 919*)\n\ttx1651=tx1649 + tx1650; (*Rule \
920*)\n\ttx1652=-tx1618; (*Rule 921*)\n\ttx1653=-0.5 tx1192 tx1512 tx978; \
(*Rule 922*)\n\ttx1654=0.5 tx1192 tx1610 tx991; (*Rule 923*)\n\ttx1655=tx1191 \
tx1651 tx1815; (*Rule 924*)\n\ttx1656=tx1191 tx1611 tx1815 tx993; (*Rule \
925*)\n\ttx1657=tx1529 + tx1652 + tx1653 + tx1654 + tx1655 + tx1656; (*Rule \
926*)\n\ttx1658=DeDPhi tx1657; (*Rule 927*)\n\ttx1659=-(tx1014 tx1045 tx1048 \
tx998 V); (*Rule 928*)\n\tohx2y3=tx1658 + tx1659; (*Rule \
929*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I3, 1, \
ohx2y3);*)\n\ttx1660=tx1493 tx1813 tx946; (*Rule 931*)\n\ttx1661=tx1420 tx944 \
tx993; (*Rule 932*)\n\ttx1662=tx1660 + tx1661; (*Rule \
933*)\n\ttx1663=-tx1637; (*Rule 934*)\n\ttx1664=-0.5 tx1192 tx1517 tx978; \
(*Rule 935*)\n\ttx1665=0.5 tx1192 tx1629 tx991; (*Rule 936*)\n\ttx1666=tx1191 \
tx1662 tx1815; (*Rule 937*)\n\ttx1667=tx1191 tx1630 tx1815 tx993; (*Rule \
938*)\n\ttx1668=tx1537 + tx1663 + tx1664 + tx1665 + tx1666 + tx1667; (*Rule \
939*)\n\ttx1669=DeDPhi tx1668; (*Rule 940*)\n\ttx1670=-(tx1018 tx1045 tx1048 \
tx998 V); (*Rule 941*)\n\tohx2z3=tx1669 + tx1670; (*Rule \
942*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I3, 2, \
ohx2z3);*)\n\ttx1671=-(DeDPhi tx1643); (*Rule 944*)\n\ttx1672=tx1007 tx1045 \
tx1048 tx998 V; (*Rule 945*)\n\tohx2x4=tx1671 + tx1672; (*Rule \
946*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I4, 0, \
ohx2x4);*)\n\ttx1673=-(DeDPhi tx1655); (*Rule 948*)\n\ttx1674=tx1012 tx1045 \
tx1048 tx998 V; (*Rule 949*)\n\tohx2y4=tx1673 + tx1674; (*Rule \
950*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I4, 1, \
ohx2y4);*)\n\ttx1675=-(DeDPhi tx1666); (*Rule 952*)\n\ttx1676=tx1016 tx1045 \
tx1048 tx998 V; (*Rule 953*)\n\tohx2z4=tx1675 + tx1676; (*Rule \
954*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 0, I4, 2, \
ohx2z4);*)\n\ttx1677=tx1286 tx925; (*Rule 956*)\n\ttx1678=tx1380 tx926; \
(*Rule 957*)\n\ttx1679=tx1287 tx944; (*Rule 958*)\n\ttx1680=tx1288 tx944; \
(*Rule 959*)\n\ttx1681=tx1381 tx945; (*Rule 960*)\n\ttx1682=tx1382 tx945; \
(*Rule 961*)\n\ttx1683=tx1677 + tx1678; (*Rule 962*)\n\ttx1684=tx1679 + \
tx1681; (*Rule 963*)\n\ttx1685=tx1680 + tx1682; (*Rule \
964*)\n\ttx1686=-tx1568; (*Rule 965*)\n\ttx1687=-tx1588; (*Rule \
966*)\n\ttx1688=tx1047 tx1549 tx971; (*Rule 967*)\n\ttx1689=0.5 tx1192 tx1549 \
tx978; (*Rule 968*)\n\ttx1690=-0.5 tx1192 tx1684 tx991; (*Rule \
969*)\n\ttx1691=-(tx1191 tx1685 tx1815 tx993); (*Rule 970*)\n\ttx1692=tx1047 \
tx1683 tx1815 tx994; (*Rule 971*)\n\ttx1693=tx1686 + tx1687 + tx1688 + tx1689 \
+ tx1690 + tx1691 + tx1692; (*Rule 972*)\n\ttx1694=DeDPhi tx1693; (*Rule \
973*)\n\ttx1695=-(tx1002 tx1006 tx1045 tx1048 V); (*Rule \
974*)\n\tohy2z2=tx1694 + tx1695; (*Rule \
975*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I2, 2, \
ohy2z2);*)\n\ttx1696=tx1419 tx1813 tx945; (*Rule 977*)\n\ttx1697=tx1457 tx946 \
tx993; (*Rule 978*)\n\ttx1698=tx1696 + tx1697; (*Rule 979*)\n\ttx1699=tx1191 \
tx1698 tx1815; (*Rule 980*)\n\ttx1700=tx1555 + tx1652 + tx1653 + tx1654 + \
tx1656 + tx1699; (*Rule 981*)\n\ttx1701=DeDPhi tx1700; (*Rule \
982*)\n\ttx1702=-(tx1002 tx1010 tx1045 tx1048 V); (*Rule \
983*)\n\tohy2x3=tx1701 + tx1702; (*Rule \
984*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I3, 0, \
ohy2x3);*)\n\ttx1703=-tx1290; (*Rule 986*)\n\ttx1704=tx1192 tx1287 tx945 \
tx991; (*Rule 987*)\n\ttx1705=tx1191 tx1460 tx1815; (*Rule 988*)\n\ttx1706=2. \
tx1191 tx1288 tx1815 tx945 tx993; (*Rule 989*)\n\ttx1707=-2. tx1047 tx1286 \
tx1815 tx926 tx994; (*Rule 990*)\n\ttx1708=tx1560 + tx1703 + tx1704 + tx1705 \
+ tx1706 + tx1707; (*Rule 991*)\n\ttx1709=DeDPhi tx1708; (*Rule \
992*)\n\ttx1710=-(tx1002 tx1014 tx1045 tx1048 V); (*Rule \
993*)\n\tohy2y3=tx1709 + tx1710; (*Rule \
994*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I3, 1, \
ohy2y3);*)\n\ttx1711=tx1493 tx1813 tx945; (*Rule 996*)\n\ttx1712=tx1457 tx944 \
tx993; (*Rule 997*)\n\ttx1713=tx1711 + tx1712; (*Rule \
998*)\n\ttx1714=-tx1692; (*Rule 999*)\n\ttx1715=-0.5 tx1192 tx1549 tx978; \
(*Rule 1000*)\n\ttx1716=0.5 tx1192 tx1684 tx991; (*Rule \
1001*)\n\ttx1717=tx1191 tx1713 tx1815; (*Rule 1002*)\n\ttx1718=tx1191 tx1685 \
tx1815 tx993; (*Rule 1003*)\n\ttx1719=tx1568 + tx1714 + tx1715 + tx1716 + \
tx1717 + tx1718; (*Rule 1004*)\n\ttx1720=DeDPhi tx1719; (*Rule \
1005*)\n\ttx1721=-(tx1002 tx1018 tx1045 tx1048 V); (*Rule \
1006*)\n\tohy2z3=tx1720 + tx1721; (*Rule \
1007*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I3, 2, \
ohy2z3);*)\n\ttx1722=-(DeDPhi tx1699); (*Rule 1009*)\n\ttx1723=tx1002 tx1007 \
tx1045 tx1048 V; (*Rule 1010*)\n\tohy2x4=tx1722 + tx1723; (*Rule \
1011*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I4, 0, \
ohy2x4);*)\n\ttx1724=-(DeDPhi tx1705); (*Rule 1013*)\n\ttx1725=tx1002 tx1012 \
tx1045 tx1048 V; (*Rule 1014*)\n\tohy2y4=tx1724 + tx1725; (*Rule \
1015*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I4, 1, \
ohy2y4);*)\n\ttx1726=-(DeDPhi tx1717); (*Rule 1017*)\n\ttx1727=tx1002 tx1016 \
tx1045 tx1048 V; (*Rule 1018*)\n\tohy2z4=tx1726 + tx1727; (*Rule \
1019*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 1, I4, 2, \
ohy2z4);*)\n\ttx1728=tx1419 tx1813 tx944; (*Rule 1021*)\n\ttx1729=tx1494 \
tx946 tx993; (*Rule 1022*)\n\ttx1730=tx1728 + tx1729; (*Rule \
1023*)\n\ttx1731=tx1191 tx1730 tx1815; (*Rule 1024*)\n\ttx1732=tx1581 + \
tx1663 + tx1664 + tx1665 + tx1667 + tx1731; (*Rule 1025*)\n\ttx1733=DeDPhi \
tx1732; (*Rule 1026*)\n\ttx1734=-(tx1006 tx1010 tx1045 tx1048 V); (*Rule \
1027*)\n\tohz2x3=tx1733 + tx1734; (*Rule \
1028*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I3, 0, \
ohz2x3);*)\n\ttx1735=tx1456 tx1813 tx944; (*Rule 1030*)\n\ttx1736=tx1494 \
tx945 tx993; (*Rule 1031*)\n\ttx1737=tx1735 + tx1736; (*Rule \
1032*)\n\ttx1738=tx1191 tx1737 tx1815; (*Rule 1033*)\n\ttx1739=tx1588 + \
tx1714 + tx1715 + tx1716 + tx1718 + tx1738; (*Rule 1034*)\n\ttx1740=DeDPhi \
tx1739; (*Rule 1035*)\n\ttx1741=-(tx1006 tx1014 tx1045 tx1048 V); (*Rule \
1036*)\n\tohz2y3=tx1740 + tx1741; (*Rule \
1037*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I3, 1, \
ohz2y3);*)\n\ttx1742=-tx1384; (*Rule 1039*)\n\ttx1743=tx1192 tx1381 tx944 \
tx991; (*Rule 1040*)\n\ttx1744=tx1191 tx1497 tx1815; (*Rule \
1041*)\n\ttx1745=2. tx1191 tx1382 tx1815 tx944 tx993; (*Rule \
1042*)\n\ttx1746=-2. tx1047 tx1380 tx1815 tx925 tx994; (*Rule \
1043*)\n\ttx1747=tx1593 + tx1742 + tx1743 + tx1744 + tx1745 + tx1746; (*Rule \
1044*)\n\ttx1748=DeDPhi tx1747; (*Rule 1045*)\n\ttx1749=-(tx1006 tx1018 \
tx1045 tx1048 V); (*Rule 1046*)\n\tohz2z3=tx1748 + tx1749; (*Rule \
1047*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I3, 2, \
ohz2z3);*)\n\ttx1750=-(DeDPhi tx1731); (*Rule 1049*)\n\ttx1751=tx1006 tx1007 \
tx1045 tx1048 V; (*Rule 1050*)\n\tohz2x4=tx1750 + tx1751; (*Rule \
1051*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I4, 0, \
ohz2x4);*)\n\ttx1752=-(DeDPhi tx1738); (*Rule 1053*)\n\ttx1753=tx1006 tx1012 \
tx1045 tx1048 V; (*Rule 1054*)\n\tohz2y4=tx1752 + tx1753; (*Rule \
1055*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I4, 1, \
ohz2y4);*)\n\ttx1754=-(DeDPhi tx1744); (*Rule 1057*)\n\ttx1755=tx1006 tx1016 \
tx1045 tx1048 V; (*Rule 1058*)\n\tohz2z4=tx1754 + tx1755; (*Rule \
1059*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I2, 2, I4, 2, \
ohz2z4);*)\n\ttx1756=-tx1655; (*Rule 1061*)\n\ttx1757=-tx1699; (*Rule \
1062*)\n\ttx1758=-(tx1191 tx1610 tx971); (*Rule 1063*)\n\ttx1759=tx1615 + \
tx1616 + tx1617 + tx1618 + tx1756 + tx1757 + tx1758; (*Rule \
1064*)\n\ttx1760=DeDPhi tx1759; (*Rule 1065*)\n\ttx1761=-(tx1010 tx1014 \
tx1045 tx1048 V); (*Rule 1066*)\n\tohx3y3=tx1760 + tx1761; (*Rule \
1067*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I3, 1, \
ohx3y3);*)\n\ttx1762=-tx1666; (*Rule 1069*)\n\ttx1763=-tx1731; (*Rule \
1070*)\n\ttx1764=-(tx1191 tx1629 tx971); (*Rule 1071*)\n\ttx1765=tx1634 + \
tx1635 + tx1636 + tx1637 + tx1762 + tx1763 + tx1764; (*Rule \
1072*)\n\ttx1766=DeDPhi tx1765; (*Rule 1073*)\n\ttx1767=-(tx1010 tx1018 \
tx1045 tx1048 V); (*Rule 1074*)\n\tohx3z3=tx1766 + tx1767; (*Rule \
1075*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I3, 2, \
ohx3z3);*)\n\ttx1768=2. tx1189 tx1191 tx946 tx971; (*Rule \
1077*)\n\ttx1769=tx1643 + tx1768; (*Rule 1078*)\n\ttx1770=DeDPhi tx1769; \
(*Rule 1079*)\n\ttx1771=tx1007 tx1010 tx1045 tx1048 V; (*Rule \
1080*)\n\tohx3x4=tx1770 + tx1771; (*Rule \
1081*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I4, 0, \
ohx3x4);*)\n\ttx1772=tx1191 tx1610 tx971; (*Rule 1083*)\n\ttx1773=tx1655 + \
tx1772; (*Rule 1084*)\n\ttx1774=DeDPhi tx1773; (*Rule 1085*)\n\ttx1775=tx1010 \
tx1012 tx1045 tx1048 V; (*Rule 1086*)\n\tohx3y4=tx1774 + tx1775; (*Rule \
1087*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I4, 1, \
ohx3y4);*)\n\ttx1776=tx1191 tx1629 tx971; (*Rule 1089*)\n\ttx1777=tx1666 + \
tx1776; (*Rule 1090*)\n\ttx1778=DeDPhi tx1777; (*Rule 1091*)\n\ttx1779=tx1010 \
tx1016 tx1045 tx1048 V; (*Rule 1092*)\n\tohx3z4=tx1778 + tx1779; (*Rule \
1093*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 0, I4, 2, \
ohx3z4);*)\n\ttx1780=-tx1717; (*Rule 1095*)\n\ttx1781=-tx1738; (*Rule \
1096*)\n\ttx1782=-(tx1191 tx1684 tx971); (*Rule 1097*)\n\ttx1783=tx1689 + \
tx1690 + tx1691 + tx1692 + tx1780 + tx1781 + tx1782; (*Rule \
1098*)\n\ttx1784=DeDPhi tx1783; (*Rule 1099*)\n\ttx1785=-(tx1014 tx1018 \
tx1045 tx1048 V); (*Rule 1100*)\n\tohy3z3=tx1784 + tx1785; (*Rule \
1101*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I3, 2, \
ohy3z3);*)\n\ttx1786=tx1699 + tx1772; (*Rule 1103*)\n\ttx1787=DeDPhi tx1786; \
(*Rule 1104*)\n\ttx1788=tx1007 tx1014 tx1045 tx1048 V; (*Rule \
1105*)\n\tohy3x4=tx1787 + tx1788; (*Rule \
1106*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I4, 0, \
ohy3x4);*)\n\ttx1789=2. tx1191 tx1287 tx945 tx971; (*Rule \
1108*)\n\ttx1790=tx1705 + tx1789; (*Rule 1109*)\n\ttx1791=DeDPhi tx1790; \
(*Rule 1110*)\n\ttx1792=tx1012 tx1014 tx1045 tx1048 V; (*Rule \
1111*)\n\tohy3y4=tx1791 + tx1792; (*Rule \
1112*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I4, 1, \
ohy3y4);*)\n\ttx1793=tx1191 tx1684 tx971; (*Rule 1114*)\n\ttx1794=tx1717 + \
tx1793; (*Rule 1115*)\n\ttx1795=DeDPhi tx1794; (*Rule 1116*)\n\ttx1796=tx1014 \
tx1016 tx1045 tx1048 V; (*Rule 1117*)\n\tohy3z4=tx1795 + tx1796; (*Rule \
1118*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 1, I4, 2, \
ohy3z4);*)\n\ttx1797=tx1731 + tx1776; (*Rule 1120*)\n\ttx1798=DeDPhi tx1797; \
(*Rule 1121*)\n\ttx1799=tx1007 tx1018 tx1045 tx1048 V; (*Rule \
1122*)\n\tohz3x4=tx1798 + tx1799; (*Rule \
1123*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I4, 0, \
ohz3x4);*)\n\ttx1800=tx1738 + tx1793; (*Rule 1125*)\n\ttx1801=DeDPhi tx1800; \
(*Rule 1126*)\n\ttx1802=tx1012 tx1018 tx1045 tx1048 V; (*Rule \
1127*)\n\tohz3y4=tx1801 + tx1802; (*Rule \
1128*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I4, 1, \
ohz3y4);*)\n\ttx1803=2. tx1191 tx1381 tx944 tx971; (*Rule \
1130*)\n\ttx1804=tx1744 + tx1803; (*Rule 1131*)\n\ttx1805=DeDPhi tx1804; \
(*Rule 1132*)\n\ttx1806=tx1016 tx1018 tx1045 tx1048 V; (*Rule \
1133*)\n\tohz3z4=tx1805 + tx1806; (*Rule \
1134*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I3, 2, I4, 2, \
ohz3z4);*)\n\ttx1807=DeDPhi tx1758; (*Rule 1136*)\n\ttx1808=-(tx1045 tx1048 \
tx1191 tx1813 tx945 tx946 V); (*Rule 1137*)\n\tohx4y4=tx1807 + tx1808; (*Rule \
1138*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I4, 0, I4, 1, \
ohx4y4);*)\n\ttx1809=DeDPhi tx1764; (*Rule 1140*)\n\ttx1810=-(tx1045 tx1048 \
tx1191 tx1813 tx944 tx946 V); (*Rule 1141*)\n\tohx4z4=tx1809 + tx1810; (*Rule \
1142*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I4, 0, I4, 2, \
ohx4z4);*)\n\ttx1811=DeDPhi tx1782; (*Rule 1144*)\n\ttx1812=-(tx1045 tx1048 \
tx1191 tx1813 tx944 tx945 V); (*Rule 1145*)\n\tohy4z4=tx1811 + tx1812; (*Rule \
1146*)\n\t(*DIHEDRAL_OFF_DIAGONAL_HESSIAN_ACCUMULATE(I4, 1, I4, 2, \
ohy4z4);*)\n\t(*} /*calcOffDiagonalHessian*/*)\n\t(*#endif // \
DIHEDRAL_CALC_OFF_DIAGONAL_HESSIAN ]*)\n\t(*} \
/*calcDiagonalHessian*/*)\n\t(*#endif // DIHEDRAL_CALC_DIAGONAL_HESSIAN \
]*)\n\t(*} /*calcForce*/*)\n\t(*#endif // DIHEDRAL_CALC_FORCE ]*)\n{Energy, \
fx1, fy1, fz1, fx2, fy2, fz2, fx3, fy3, fz3, fx4, fy4, fz4, dhx1x1, dhy1y1, \
dhz1z1, dhx2x2, dhy2y2, dhz2z2, dhx3x3, dhy3y3, dhz3z3, dhx4x4, dhy4y4, \
dhz4z4, ohx1y1, ohx1z1, ohx1x2, ohx1y2, ohx1z2, ohx1x3, ohx1y3, ohx1z3, \
ohx1x4, ohx1y4, ohx1z4, ohy1z1, ohy1x2, ohy1y2, ohy1z2, ohy1x3, ohy1y3, \
ohy1z3, ohy1x4, ohy1y4, ohy1z4, ohz1x2, ohz1y2, ohz1z2, ohz1x3, ohz1y3, \
ohz1z3, ohz1x4, ohz1y4, ohz1z4, ohx2y2, ohx2z2, ohx2x3, ohx2y3, ohx2z3, \
ohx2x4, ohx2y4, ohx2z4, ohy2z2, ohy2x3, ohy2y3, ohy2z3, ohy2x4, ohy2y4, \
ohy2z4, ohz2x3, ohz2y3, ohz2z3, ohz2x4, ohz2y4, ohz2z4, ohx3y3, ohx3z3, \
ohx3x4, ohx3y4, ohx3z4, ohy3z3, ohy3x4, ohy3y4, ohy3z4, ohz3x4, ohz3y4, \
ohz3z4, ohx4y4, ohx4z4, ohy4z4, DihedralDeviation}]\n"}
