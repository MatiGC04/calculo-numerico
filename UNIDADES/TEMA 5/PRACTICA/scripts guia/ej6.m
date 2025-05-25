format long;
pkg load symbolic
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
% Definición de la función
%recordar que spline_clamped(x,y,0,0) != spline_natural(x,y)
% ya que el spline clamped impone a las primeras derivadas de los extremos que sean 0
%mientras que spline natural impone que las segundas derivadas de los extremos sean 0
xx = linspace(1, 3, 100);

x = [1 2 3];
y = [0 4 22/3];
dy0 = 3;
dyN = dy0;

S = splice_sujeta(x,y, dy0 ,dyN); % Spline sujeta
figure(1)
hold on;
plot(xx,S(xx),'r-','linewidth',3) % grafico la Spline
grid on;
grid minor
