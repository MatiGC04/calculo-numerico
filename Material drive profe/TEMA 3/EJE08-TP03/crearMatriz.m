function [A,b,x0] = crearMatriz(n)
% Ej8-TP03
% Creamos la matriz y el vector del lado derecho
% MATRIZ
 % 2i si j = i
 % 0.5i si j = i + 2 o j = i - 2
 % 0.25i si j = i + 4 o j = i - 4
 % 0 en otra posicion

A = zeros(n,n) + diag(2*[1:n],0) + diag(0.5*[3:n],-2) + diag(0.5*[1:n-2],2) + diag(0.25*[5:n],-4) + diag(0.25*[1:n-4],4);

b = pi*ones(n,1);

x0 = zeros(n,1);

endfunction

