%EJ 8
%Datos del problema
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones');
Nh = 99;
n = Nh -3 ;
L = 5; %[m]
h = L ./ Nh
w = 0.07;
s = 0.14;


% en esta matriz voy a incluir los valores de borde.
A = zeros(n, n);
% defino f(x) = P(x) / (E*J), P(X)= CTE = 1.0326e + 4[N/M]
P = [1.0326e+4]; E =(210e+3); J =(w*s^3)/12;
f = P./( (E*J) );
b = ((h^4)*f).*ones(n);

D1 = 6*ones(n,1);
D2 = -4*ones(n-1,1);
D3 = ones(n-2,1);

% Construyo A
A = A + diag(D1) + diag(D2,-1) + diag(D2,1) + diag(D3,2) + diag(D3,-2);

display("_______METODO DE GAUSS_______");
tic();
x = gauss1(A,b);
display("TIEMPO");
t = toc()
display("Error");
residuo = norm(A*x - b, inf)

display("_______GAUSS P_______");
tic();
x = gauss_p(A,b);
display("TIEMPO");
t = toc()
display("Error");
residuo = norm(A*x - b, inf)

display("_______GAUSS SEIDER_______");
tol = 1e-8;
maxit = 1000;
x0 = ones(length(b),1);
[x, r, it, t] = gauss_seidel(A, b, x0, maxit, tol);
t
residuo = norm(A*x - b, inf)

display("_______Jacobbi_______");
[x,r_h,it,t] = jacobbi(A,b,x0,maxit,tol);
residuo = norm(A*x - b, inf)
t



display("_______SOR_______");
tic();
[w] = wOptimo(A, b, x0, maxit, tol)
%w = 0.1;
t = toc();


[x, r, it, t] = SOR(A, b, x0, maxit, tol,0.9);
t
error = norm(A*x - b, inf)


