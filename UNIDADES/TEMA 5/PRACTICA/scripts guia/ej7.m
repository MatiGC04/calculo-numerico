clc;
clear;
clf;
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;
pkg load symbolic
%{
    Ejercicio 7. (Aula) Se quiere determinar la trayectoria plana seguida por un brazo robot indus-
trial (idealizado por un punto material) durante un ciclo de trabajo. El brazo robot debe satisfacer
las siguientes restricciones: se debe encontrar en reposo en el punto (0, 0) en el instante inicial.
Luego de 1s se debe encontrar en el punto (2, 4), 1s después debe alcanzar el punto (6, 6) y dete-
nerse allı́ (primera etapa). En una segunda etapa retoma inmediatamente su movimiento y alcanza,
luego de otro segundo más el punto (3, 2) para finalmente retornar al origen luego de otro segundo
más, donde quedará detenido para repetir el ciclo de trabajo.
Encuentre el trazador cúbico sujeto correspondiente utilizando el código desarrollado en el ejercicio
7 y luego realice las siguientes gráficas: (a) x vs. t (etapas 1 y 2 en la misma gráfica), (b) y vs. t
(idem anterior), y finalmente (c) en el plano xy la trayectoria completa encontrada.

%}
% Primera Etapa
x1 = [0 2 6];
y1 = [0 4 6];
t1 = [0 1 2];
dy0 = 0;
dyN = 0;

% Segunda etapa
x2 = [6 3 0];
y2 = [6 2 0];
t2 = [2 3 4];

% Grafica x vs t (etapa 1 y 2)
S_xt1 = splice_sujeta(t1,x1, dy0 ,dyN); % Spline sujeta
S_xt2 = splice_sujeta(t2,x2, dy0 ,dyN); % Spline sujeta
figure(1)
hold on;
plot(t1,S_xt1(t1),'r-','linewidth',3) % grafico la Spline
plot(t2,S_xt2(t2),'b-','linewidth',3) % grafico la Spline
grid on;
legend('Etapa 1','Etapa 2')
%grafico puntos xi y ti
plot(t1,x1,'ro','linewidth',3) % grafico la Spline
plot(t2,x2,'bo','linewidth',3) % grafico la Spline
xlabel('t')
ylabel('x')

% grafica y vs t (etapa 1 y 2)
S_yt1 = splice_sujeta(t1,y1, dy0 ,dyN); % Spline sujeta
S_yt2 = splice_sujeta(t2,y2, dy0 ,dyN); % Spline sujeta
figure(2)
hold on;
plot(t1,S_yt1(t1),'g-','linewidth',3) % grafico la Spline
plot(t2,S_yt2(t2),'k-','linewidth',3) % grafico la Spline
grid on;
legend('Etapa 1','Etapa 2')
%grafico puntos yi y ti
plot(t1,y1,'go','linewidth',3) % grafico la Spline
plot(t2,y2,'ko','linewidth',3) % grafico la Spline
xlabel('t')
ylabel('y')

% grafica xy (etapa 1 y 2)
figure(3)
hold on;
plot(S_xt1(t1),S_yt1(t1),'r-','linewidth',3) % grafico la Spline
plot(S_xt2(t2),S_yt2(t2),'b-','linewidth',3) % grafico la Spline
grid on;
legend('Etapa 1','Etapa 2')
%grafico puntos xi y ti
plot(S_xt1(t1),S_yt1(t1),'ro','linewidth',3) % grafico la Spline
plot(S_xt2(t2),S_yt2(t2),'bo','linewidth',3) % grafico la Spline
xlabel('x(t)')
ylabel('y(t)')