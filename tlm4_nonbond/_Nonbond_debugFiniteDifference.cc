// FINITE_DIFFERENCE_TEST 
TEST_FORCE( _evaluateEnergyOnly_Nonbond,  delta2*2.0,
                                                              12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                              12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
f2.8,
index);
TEST_FORCE( _evaluateEnergyOnly_Nonbond,  delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
f0.,
index);
TEST_FORCE( _evaluateEnergyOnly_Nonbond,  delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
f0.,
index);
TEST_FORCE( _evaluateEnergyOnly_Nonbond,  delta2*2.0,
                                                              12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9 - delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                              12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9 + delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
f-2.9,
index);
TEST_FORCE( _evaluateEnergyOnly_Nonbond,  delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
f0.,
index);
TEST_FORCE( _evaluateEnergyOnly_Nonbond,  delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
f0.,
index);
TEST_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond, delta2*2.0,
                                                              12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                     12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                              12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
dh2.82.8,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh2.80.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh2.80.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                       12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0., 0., -2.9 - delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                       12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0., 0., -2.9 - delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                       12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0., 0., -2.9 + delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                       12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0., 0., -2.9 + delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
oh2.8-2.9,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh2.80.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 - delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8 + delta2, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh2.80.,
index);
TEST_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond, delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                     12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
dh0.0.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.0.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 - delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 - delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 + delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 + delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.-2.9,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.0.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.0.,
index);
TEST_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond, delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                     12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
dh0.0.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 - delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 - delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 + delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 + delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.-2.9,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.0.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.0.,
index);
TEST_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond, delta2*2.0,
                                                              12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9 - delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                     12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                              12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9 + delta2, 0., 0., 3.156 10  , 1.73651 10 , 0.),
dh-2.9-2.9,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 - delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 + delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 - delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 + delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh-2.90.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 - delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9 + delta2, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 - delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                                  12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9 + delta2, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh-2.90.,
index);
TEST_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond, delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                     12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
dh0.0.,
index);
TEST_OFF_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond,
delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
oh0.0.,
index);
TEST_DIAGONAL_HESSIAN( _evaluateEnergyOnly_Nonbond, delta2*2.0,
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. - delta2, 0. - delta2, -2.9, 0. - delta2, 0. - delta2, 3.156 10  , 1.73651 10 , 0. - delta2),
                                                     12            6
(ENERGY_FUNCTION, 2.8, 0., 0., -2.9, 0., 0., 3.156 10  , 1.73651 10 , 0.),
                                                                                         12            6
(ENERGY_FUNCTION, 2.8, 0. + delta2, 0. + delta2, -2.9, 0. + delta2, 0. + delta2, 3.156 10  , 1.73651 10 , 0. + delta2),
dh0.0.,
index);
