format long;
pkg load symbolic
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
% Definición de la función
f = @(x) sin(2*pi.*x);
n = 21; % 21 puntos
x = linspace(-1, 1, n);
y = f(x); % puntos de la función

% con esos puntos creo el polinomio interpolador de Lagrange
% Polinomio de interpolacion de Lagrange
pl = polyfit(x, y, n-1); % gracias al teorema de existencia y unicidad de Lagrange, el polinomio interpolador es unico.
z = polyval(pl, x); % polinomio interpolador de Lagrange

[P] = polinomiolagrange(x, y); % utilizo mi funcion de Lagrange

figure(1)
hold on;
plot(x,f(x),'r-','linewidth',1) % grafico la funcion

plot(x,polyval(P,x),'b-','linewidth',2) % grafico el polinomio interpolador
plot(x,polyval(pl,x),'g-','linewidth',3) % grafico el polinomio interpolador

% Spline cubico natural
[a,b,c,d] = cubic_spline_natural(x,y);

% M = [d c b a]; % matriz de coeficientes
xd = x;
S = @(x) a(1)*(x == xd (1));
for i=1:n
 S = @(x) S(x) + ...
 polyval(M(i,:), (x - xd(i))).*(xi>xd(i)).*(xi<=xd(i+1));
end

plot([-1,1],[0,0],'k--')
grid on
grid minor
xlabel('Datos X')
ylabel('Funcion (f(x))')
title('Métodos de Interpolación')

le1=sprintf('Valores dados a interpolar:');
le2=sprintf('Polinomio de Lagrange grado: ',20);
le3=sprintf('Spline Cubica de los datos:');
le4=sprintf('Linea del cero:');