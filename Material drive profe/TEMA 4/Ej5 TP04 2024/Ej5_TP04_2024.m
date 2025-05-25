# TP4 Ejercicio 5 Ej5_TP4_2024.m
clear all;
clc; clf

% funcion
fr=@(x) x.^2;

% en esta buscamos la raiz para la minima distancia
f  = @(x) 4*x.^3 +2*x - 2;
df = @(x) 12*x.^2+2;
a=0;
b=1.5;
x=linspace(a,b,200);
ff=f(x);
ffr=fr(x);
z=@(x) 0.*x;
zz=z(x);
figure(1)
plot(x,ffr,'-+b',x,zz,'-k','linewidth',2);
grid minor

figure(2)
plot(x,ff,'-*r',x,zz,'-k','linewidth',3);
grid minor
x0=0.5;
kmax=100;
tol=10^-4;

[xmin,rh,it,t] = Newton(f,df,x0,kmax,tol)
disp('El punto en x para la minima distancias de f(x) a x=(1,0), es:')
xmin
frmin=fr(xmin)
disp('La distancia minima es:   ')
dmin=sqrt((xmin-1)^2 + frmin^2);
disp(dmin)
