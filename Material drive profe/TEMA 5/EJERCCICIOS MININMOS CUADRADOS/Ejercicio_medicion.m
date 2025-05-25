clear all; clc; clf
% medicion.m
% Ejemplo ajuste de curvas por minimos cuadrados.
% ver como levantar un archivo datos.dat

x=[0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 10.5 11 11.5]';
y=[10.08 12.03 11.38 18.81 20.53 28.5 31.38 38.4 48.39 60.6 66.66 82.61 91.37 ...
105.44 122.53 137.77 152.74 172.65 188.84 207.77 230.94 251.35 274.07 295.95]';

n = length(x);
xx=linspace(0,14,201);

% Ajuste lineal
cp1 = polyfit(x,y,1)
f1 = @(x) polyval(cp1,x);

figure(1)
plot(x,y,'or', xx,f1(xx),'-b')
hold on
grid on; grid minor;

Err1 = norm(y-f1(x)) % norma euclidea (error absoluto)

% Ajuste cuadratico
cp2 = polyfit(x,y,2)
f2 = @(x) polyval(cp2,x);

plot(xx,f2(xx),'-k')
Err2 = norm(y-f2(x)) % norma euclidea (error absoluto)


% Ajuste cuadratico
cp4 = polyfit(x,y,4)
f4 = @(x) polyval(cp4,x);

plot(xx,f4(xx),'-g')
Err4 = norm(y-f4(x)) % norma euclidea (error absoluto)
