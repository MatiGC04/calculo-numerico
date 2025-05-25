% Ejercicio6.m
clear all; clc

f = @(x) 35000000.*x +401000./(x) - 17122.7./(x.^2)-1494500; % x Representa el volumen

df = @(x) 35000000 - (401000./(x.^2)) + ((2*17122.7)./(x.^3)); % x Representa el volumen

x=linspace(0.01,0.06,30);

figure(1)
plot(x,f(x),'b-*')
grid on; grid minor

tol=1*10^-12;
maxit=1000;
kmax=maxit;
a=0.01; b=0.06;

[pbi, rhbi, itbi, E_relbi,tiempobi] = biseccion3(f, a, b, maxit, tol);
pbi

x0=pbi;

[xNewton,rhNewton,itNewton,t] = Newton(f,df,x0,kmax,tol);
