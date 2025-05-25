% Ejercicio 6  - Ej6TP052025.m
clear all; clc; clf;
x1 = [ 1 2 3]';
y1 = [ 0 4 22/3]';

df1=3;
df2=3;

[S,dS,ddS]=funcion_spline(x1,y1,df1,df2);

figure(1)
x=linspace(1,3,51);
plot(x, S(x), 'b-')
hold on
plot(x1,y1,'ko')
legend('S(x)','Ptos.Intervalo','location','north')
title('Ejercicio 6- Spline Cubica Sujeta')
grid on; grid minor
hold off
disp('La Spline Cubica Sujeta será:')
disp(S)

