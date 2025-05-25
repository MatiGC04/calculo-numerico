# Ejercicio 11
# Ej10TP052025.m

clear all; clc; clf
% carga de datos
t = [4 8 12 16 20 24]';
c = [1590 1320 1000 900 650 560]';


lc =log(c); % logaritmo en base 2
r = polyfit(t,lc,1);

m = length(t);
st = sum(t);
st2=sum(t.^2);

slc=sum(lc);
slct=sum(lc.*t);

M=[m -st; st -st2];
f=[slc; slct];

coef=M\f
b=exp(coef(1));

tt=linspace(0,50,201);
y=@(t) b*exp(-coef(2).*t)

plot(t,c,'ok',tt,y(tt),'-b')
grid on; grid minor
title('Metodo de linealizacion de Datos')

% Punto b)
CFU = y(0);
disp('Concentracion al final de la tormenta y comienzo del conteo (CFU / 100 mL:)')
disp(CFU)


% punto c)
t200=(log(200)-log(b))/(-coef(2));
disp('El tiempo (horas) en el que la concentracion sera 200 CFU / 100 mL:')
disp(t200)
