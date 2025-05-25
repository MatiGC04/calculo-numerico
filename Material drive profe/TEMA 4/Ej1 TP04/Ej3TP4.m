# TP4 Ejercicio 3 Ej3TP4.m
clear all;
clc; clf
f  = @(x) sin(x) + cos(1+x.^2) - 1;
df = @(x) cos(x) - 2*x*sin(1+x.^2);
a=2;
b=2.6;
x=linspace(a,b,200);
ff=f(x);
z=@(x) 0.*x;
zz=z(x);
figure(1)
plot(x,ff,'-+b',x,zz,'-k','linewidth',3);
grid minor

% datos
kmax=100;
maxit=100;
tol=1.0e-10;
% primero aproximo con biseccion
disp('Metodo de biseccion')
[p, rh, it, t] = biseccion(f, a, b, maxit, tol)

x01=p;

x0=a;
x1=b;

disp('Metodo de Newton')
[xNew1,rhNew1,itNew1,tNew1] = Newton(f,df,x01,kmax,tol)

% Metodo de la secante
disp('Metodo de la secante')
[xs, rhs, its, ts] = secante(f, x0, x1, kmax, tol)

xr=linspace(1,7,200);
fr=f(xr);
z=@(x) 0.*x;
zz=z(xr);
figure(2)
plot(xr,fr,'-+b',xr,zz,'-k','linewidth',3);
grid minor
