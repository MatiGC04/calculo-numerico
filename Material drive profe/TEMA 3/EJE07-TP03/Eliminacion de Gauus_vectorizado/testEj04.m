% TestEj04.m
% prueba codigos sustitucion hacia atras y hacia adelante
% Sistema A x = b
clear all
clc

A = [ 1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2]

n = length(A(:,1))

b = [-8 6 -4 4]'

U = A;

L = A';

y = sust_adelante_op(L,b,n);
disp('La solucion del ejercicio 4 con sustitucion hacia adelante es:')
y

disp('===============================================')
x = sust_atras_op(U,b,n);

disp('La solucion del ejercicio 4 con sustitucion hacia atras es:')
x




