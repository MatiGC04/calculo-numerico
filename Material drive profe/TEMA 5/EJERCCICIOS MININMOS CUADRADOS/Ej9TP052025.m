%EjParcial parecido al 10 del TP5
#Ej9TP52025.m

clear all; clc; clf
% carga de datos
x = [-1:2]'
y = [-1.1 -0.4 -0.9 -2.7]'
% El ejercicio nos dice que transformemos los datos y en -log(y)
disp('Usamos polyfit, para ajustar ')
c = polyfit(x,log(-y),2) # polinomio de ajuste de orden cuadratico.
# y = -exp(ax^2+bx+c); lo ponemos de esta manera para generar un
# polinomio con el exponente: log(-y) = ax^2 + bx+c; de grado 2

disp('Transformamos c en un polonimo como función')
f = @(x) -exp(polyval(c,x));

# lo vemos graficamente:
xx = linspace(-1.5,2.5,101);
plot(x,y,'o',xx,f(xx))
grid on; grid minor
title('Ajuste por minimos cuadrados con una función exponencial Supuesta')
legend('puntos','funcion: y=-e^((ax^2+bx+c))', 'location','south')
xlabel('valores de x')
ylabel('Valores de la funcion exponencial')

# Medimos el error
disp('medimos el error')
errf = norm(y - f(x)); # error cuadratico usando la funcion norm
disp('Error cuadratico')
disp(errf)

ErrRelat = (f(0) + 0.4)/(-0.4);
# error realtivo en el punto 0
disp('Error relativo en el punto x=0')
disp(ErrRelat)

