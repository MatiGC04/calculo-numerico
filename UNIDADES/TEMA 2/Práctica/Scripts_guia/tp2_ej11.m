%Ejecicio 11
addpath("G:/UNL 2025 CURSADO/Calculo_Numerico/Funciones");

A = [1, 1 + 0.5e-15, 3;
     2, 2, 20;
     3, 6, 4]
A_copia = A;

display("Doolittle sin pivoteo parcial")
[L1, U1] = doolittle(A_copia);

L1
U1
M_residual = A - L1*U1

A_copia = A;
display("Doolittle con pivoteo parcial")
[L2, U2, A_copia, r, P2] = doolittle_p(A_copia);

L2
U2
P2
M_residual = A - L2*U2
M2_residual = P2*A - L2*U2

