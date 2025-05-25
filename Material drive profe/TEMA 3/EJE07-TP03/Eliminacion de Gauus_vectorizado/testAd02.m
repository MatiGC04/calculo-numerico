% test04
% probamos los metodos
clear all; clc; clf
epsilon = 1e-16;
N=100;
A1=randi(10,N,N);
b1 = randi(10,N,1);

tic()
[x1,P] = elim_gaussPivote(A1,b1);
time=toc()

figure(1)
spy(P)
title('Matriz Pivote') % para ver los intercambios hechos
grid on

figure(2) % para ver la solucion
plot(x1)
title('Solución del sistema A1x1=b1')
grid on