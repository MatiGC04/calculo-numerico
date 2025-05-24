%Ejercicio 7
addpath('G:/UNL 2025 CURSADO/Calculo_Numerico/Funciones');
n = 1000; %input("Ingrese n :  ");

A = zeros(n,n);
x = linspace(1,n,n);
b = pi*ones(n,1);
%Elementos diag principal
d1 = diag(2*x(1:end));

%Diagonal +-2
d2 = diag(0.5*x(1:end-2),-2);
d3 = diag(0.5*x(1:end-2),2);

%Diagonal +- 4
d4 = diag(0.25*x(1:end-4),4);
d5 = diag(0.25*x(1:end-4),-4);

A = A + d1 + d2 + d3 + d4 + d5;

tol = 1e-5;
x0 = ones(n,1);
maxit = n;
display("______________Jacobbi______________");

[x,r_h,it,t] = jacobbi(A,b,x0,maxit,tol);
display("tiempo de ejecucion")
it
t
figure;
semilogy(r_h , 'b-','LineWidth',1.5);
hold on;


display("--ERROR :");
error1 = norm(A*x - b,inf)


display("______________Gauss_seidel______________");
[x,r_h,it,t] = gauss_seidel(A,b,x0,maxit,tol);
it
t

%veo el error de precision
display("--ERROR :");
error1 = norm(A*x - b,inf)

%Muestro la grafica:
semilogy(r_h,'r-','LineWidth',1.5);




display("______________SOR______________");
%tic();
%[w] = wOptimo(A,b,x0,maxit,tol)
%w = 0.8818;
w = 0.9545;
%t1 = toc()
[x,r_h,it,t]=SOR(A,b,x0,maxit,tol,w);
it


display("--ERROR :");
error1 = norm(A*x - b,inf)

%Muestro la grafica:
semilogy(r_h,'g-','LineWidth',1.5);

%agrego titulos
title('Convergencia de Métodos Iterativos');
xlabel('Nro de iteraciones');
ylabel('Norma infinito del Residuo')
legend('Jacobi','Gauss-seidel','SOR(w optimo');
grid on;
