%Ejercicio 3
%Ej3.m
% Aproximacion de:
% cos(x) = 1 - x^2/2!+ x^4/4! - x^6/6! + . . .

% generamos la funcion: cos(x)
figure(1)
f = @(x) cos(x);
% la graficamos
figure(1)
ezplot(f,[-pi pi])
grid on, grid minor

% planteamos las diferentes aproximaciones

g1 = @(x) ones(size(x));
g2 = @(x) 1 - x.^2/(factorial(2));
g4 = @(x) 1 - x.^2/(factorial(2)) + x.^4/(factorial(4));
g6 = @(x) 1 - x.^2/(factorial(2)) + x.^4/(factorial(4)) - x.^6/(factorial(6));

figure(2)
x = linspace(-pi,pi,101);
plot(x,f(x),'or',x,g6(x),'m-diamond')
grid on

figure(3)
x = linspace(-pi,pi,101);
plot(x,f(x),'or',x,g1(x),'b-*',x,g2(x),'g-*',x,g4(x),'k-*',x,g6(x),'m-diamond')
grid on, grid minor;
legend('g1','g2','g3','g4','g6')
title('Ejercicio 3 Guia 1')
