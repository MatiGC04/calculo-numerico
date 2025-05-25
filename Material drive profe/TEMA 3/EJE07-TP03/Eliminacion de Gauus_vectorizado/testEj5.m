#testEj5
clear all; 
clc
# generamos la matriz del ejercicio
A1 = [ 8 4 1; 2 6 2; 2 4 8];

#A2 = [5e-2 5.57e2 -4e-2; 1.98 1.94e2 -3e-3; 2.74e2 3.11 7.50e-2];

#A3 = [1 2 -1; 2 4 0; 0 1 -1];

NroCond=cond(A1) # Calculo el nro de condicion
# Calculo su determinante
det(A1)

n = length(A1(:,1));


[PA1,P1] = doolittle_Corr(A1);

# de acuerdo al codigo PA = A(r,:), de esta extraemos L y U


# PA: matriz resultado

P1 # Esta es la matriz Pivote (P)

# La matriz resultado PA tiene la factorizacion LU y hay que extraerla.


L = eye(n) + tril(PA1,-1) # Extrae la matriz triangular inferiorto

U = triu(PA1,0)

# Comprobamos: Si a la matriz A original la multiplicamos por la matriz pivote (P)
# y le restamos la factorizacion LU, deberiamos obtener la matriz nula con error de maquina

Res = (P1*A1 - L*U) # ojo no confundir PA con P*A
