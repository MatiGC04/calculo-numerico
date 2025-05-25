# Ejercicio 8 Mosquitos
#Ej9TP0MC2025.m

clear all; clc; clf

# carga de datos
x = [0 1 2 3 4 5 6]'
y = [432 599 1012 1909 2977 4190 5961]'
y10 = 14900; % para el punto f)
n = length(x);
x10 = 10; % para el punto f)

xx=linspace(-1,11.5,201);

p6 = polyfit(x, y,6); % ultimo parametro: representa el grado del polinomio

p1 = polyfit(x, y,1); % grado 1 - lineal
p2 = polyfit(x, y,2); % grado 2 - cuadrático
p3 = polyfit(x, y,3); % grado 3 - cubico

figure(1)
hold on
plot(xx, polyval(p6,xx),'k',"linewidth",2);
plot(xx, polyval(p1,xx),'b',"linewidth",2);
plot(xx, polyval(p2,xx),'g',"linewidth",2);
plot(xx, polyval(p3,xx),'m',"linewidth",2);

plot(x, y,'ro',"linewidth",2); % grafica de los puntos medidos
plot(x10,y10,'*k',"linewidth",2); % punto a las 10 semanas
grid on;grid minor
xlabel ('Mediciones')
ylabel('Cantidad')
title('Ajuste de diferentes polinomios')
legend('p6-grado6', 'p1-Lineal', 'p2-Cuadratico', 'p3-cubico','datos','location', 'south')
# Calculo del error cuadratico medio
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
hold on
plot(xx, polyval(p1,xx),'b',"linewidth",2);
plot(xx, polyval(p2,xx),'g',"linewidth",2);
plot(xx, polyval(p3,xx),'m',"linewidth",2);

plot(x, y,'ro',"linewidth",2); % grafica de los puntos medidos
plot(x10,y10,'*k',"linewidth",2); % punto a las 10 semanas
grid on;grid minor
xlabel ('Mediciones')
ylabel('Cantidad')
title('Polinomios de mejor Ajuste')
legend('p1-Lineal', 'p2-Cuadratico', 'p3-cubico','datos','location', 'north')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Errores producidos por cada curva de ajuste:')
disp('Polinomio lineal')
ecm1 = sum((y - polyval(p1,x)).^2)/n;
disp(ecm1)

disp('Polinomio cuadratico')
ecm2 = sum((y - polyval(p2,x)).^2)/n;
disp(ecm2)

disp('Polinomio cubico')
ecm3 = sum((y - polyval(p3,x)).^2)/n;
disp(ecm3)

disp('Polinomio de grado 6:')
ecm6 = sum((y - polyval(p6,x)).^2)/n;
disp(ecm6)



