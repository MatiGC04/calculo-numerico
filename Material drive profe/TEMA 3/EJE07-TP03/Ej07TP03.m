% Ej07TP03.m
clear all, clc
% GENERAMOS LA MATRIZ DEL EJERCICIO
% Resolucion de sistemas Ax=b
% Por metodos directos e iterativos
clear all, clc
A1 = [3 1 1; 1 3 -1; 3 1 -5] % PRIMERA MATRIZ DEL EJERCICIO
% A1 = [3 1 1; 3 1 -5; 1 3 -1] % SEGUNDA MATRIZ DEL EJERCICIO

%b1 = [ 5 3 -1]'
b1 = [ 5 -1 3]'

disp('===========================================')
disp('DATOS: ')
maxit=100
tol = 0.0001
KA1 =cond(A1)
rhoA1 = max(abs(eig(A1)))
lambda= eig(A1)
n1 = length(A1(:,1))
x0=zeros(n1,1)

disp('===========================================')
disp('DATOS matriz iteracion: ')

[rhoA] = RadioEspectral(A1,'gs',1.2);
disp('Radio espectral matriz Iteracion Gauss-Seidel')
disp(rhoA)

disp('Metodos Iterativos')
disp('Calculo por Gauss-Seidel')

[x, r, it, t] = GaussSeidel(A1, b1, x0, maxit, tol);
disp('Solucion')
disp(x)
disp('Iteraciones')
disp(it)
disp('Tiempo de calculo')
disp(t)
disp('===========================================')
disp('Metodos Directos')
disp('Calculo por Eliminacion de Gauss')

tic()
[xGauss,P] = elim_gaussPivote(A1,b1)
tGauss=toc()

disp('===========================================')
