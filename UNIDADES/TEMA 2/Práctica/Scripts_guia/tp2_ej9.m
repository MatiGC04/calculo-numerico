%Ejercicio 9
addpath("G:/UNL 2025 CURSADO/Calculo_Numerico/Funciones");

A =[1 -2 3 0;
3 -6 9 3;
2 1 4 1;
1 -2 2 -2]
A1= A
[L, U, A1, r, P] = doolittle_p(A1);
PA = P*A
LU = L*U

display("SI PA = LU SON IGUALES --> PA - LU = 0")
PA - LU
