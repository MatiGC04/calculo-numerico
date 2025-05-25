# TP4 Ejercicio 7 Ej7_TP04_2024.m
clear all;
clc; clf
#format long
f = @(x) x.*(log(x+3)-17)-1;
df = @(x)(x./(x+3))+ log(x+3)-17;

% =============================================================================
%f = @(x) log(x.^2+1)- exp(x/2).*cos(pi*x);
%df = @(x) (2.*x/(x.^2+1))+pi*exp(x.^2/2)*sin(pi*x) -(0.5)*exp(x.^2/2)*cos(pi*x)
% =============================================================================

a = 0;
b = 1;
fa = f(a);
fb = f(b);

 % vamos duplicando el intervalo hasta que nos de uno que reuna las condiciones
while (sign(fa)*sign(fb) > 0)
a = b;
fa = f(a);
b = 2*b;
fb = f(b);
endwhile

disp('===================')
disp('El valor de a para el intervalor es:')
disp(a)
disp('El valor de b para el intervalor es:')
disp(b)
disp('===================')

maxit = 100;
tol = 1e2;
%[pbi, rhbi, itbi, tbi] = biseccion(f, a, b, maxit, tol);
[pbi, rhbi, itbi, tbi] = biseccion2(f, a, b, maxit, tol);

disp('=============================')
disp('Resultados de la biseccion:')
pbi
itbi
disp('=============================')



# Ahora pbi: es nuestro cero, desde acá lo aproximamos con el Newton

tolNew = 1e-12;
kmax = 50;

x0 = pbi;

[xNew,rhNew,itNew,tNew] = NewtonRaphson(f,df,x0,kmax,tolNew)

disp('=============================')
disp('Resultados de la Newton:')
xNew
itNew
disp('=============================')

disp('Solucion Metodo de Biseccion y de Newton')
Biseccion = [pbi f(pbi)]
Newton = [xNew f(xNew)]

disp('=============================')
disp('RESUMEN:')
disp('[iteracion Residuo] tiempo Biseccion Newton')
ResBi = [itbi min(rhbi)  tbi]
ResNewton = [itNew min(rhNew) tNew]
disp('=============================')

semilogy(rhbi, 'r-o', rhNew, 'b-d')
grid on
title('Tasas de convergencia')
xlabel('iteraciones')
ylabel('residuos')
legend('Biseccion','Newton-Rapshon')

disp('=============================')
disp('comprobamos que es un cero')
Cero_de_f=f(xNew)
disp('=============================')
