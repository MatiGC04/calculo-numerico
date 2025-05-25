#Ejercicio6TP05.m
clear all; clc;clf

x=linspace(-1,1,21);

# valores de datos sin perturbar
%f=sin(2*pi*x);

% Valores de datos perturbados
perturbacion = 1.e-04;
f=sin(2*pi*x)+(-1).^[1:21]*perturbacion;

# Con Octave
xx=linspace(-1,1,201);

gr=20; #grado del polinomio de lagrange
p=polyfit(x,f,gr);
% USAMOS EL POLINOMIO CALCULADO
z=polyval(p,xx);

# Spline con valores perturbados
%[a,b,c,d] = trazador_cubico_natural(x,f);
[a,b,c,d] = cubic_spline_natural(x,f)
n = length(a);
xd = x;
M = [d c b a];
S = @(x) a(1)*(x == xd (1));
for i=1:n
 S = @(x) S(x) + ...
 polyval(M(i,:), (x - xd(i))).*(x>xd(i)).*(x<=xd(i+1));
end

% LO GRAFICAMOS
figure(1)
% GRAFICAMOS LOS PUNTOS DADOS.
plot(x,f,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on % para graficar el Spline en la misma grafica.

% Graficamos el polinomio de Lagrange
plot(xx,z,'g-','linewidth',3)

% Grafica de la función Spline Cúbica Natural
plot(xx,S(xx),'k-','linewidth',3)
plot([-1,1],[0,0],'m-')
grid on
grid minor
xlabel('Datos X')
ylabel('Funcion (f(x))')
title('Métodos de Interpolación')

le1=sprintf('Valores dados a interpolar:');
le2=sprintf('Polinomio de Lagrange grado: ',gr);
le3=sprintf('Spline Cubica de los datos:');
le4=sprintf('Linea del cero:');


legend(le1,le2,le3,le4)


