%% Sistemas de ecuaciones lineales - Análisis completo
addpath('G:/UNL 2025 CURSADO/Calculo_Numerico/Funciones');
% Primer sistema de ecuaciones:
% 3x + y + z = 5
% x + 3y - z = 3
% 3x + y - 5z = -1

A1 = [3  1  1;
      1  3 -1;
      3  1 -5];

b1 = [5; 3; -1];

% Segundo sistema (reordenado):
% 3x + y + z = 5
% 3x + y - 5z = -1
% x + 3y - z = 3

A2 = [3  1  1;
      3  1 -5;
      1  3 -1];

b2 = [5; -1; 3];

display("La solucion X1 con el metodo de gauss tradicional");
x1 = gauss1(A2,b2)

display("La solucion X1 con el metodo de gauss con pivoteo");


x2 = gauss_p(A2,b2)


display("La solucion X1 con el metodo de gauss con seidel");
x0 = [0 0 0]';
maxit = 100;
tol = 1e-9;
            %diag(A2) devuelve el vector columna de diagonal A
            %diag(diag(A2)) crea la matriz diagonal
T_gs = -inv(diag(diag(A2)) + tril(A2,-1))*triu(A2,1);

r_T_gs = max(abs(eig(T_gs)))

[x,r_h,it,t] = gauss_seidel(A2,b2,x0,maxit,tol);

x


display("La solucion exacta es:")
x = A2\b2
