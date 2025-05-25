%Ejercicio 2
%Ej2Taylor.m
% Aproximacion de:
% sin(x) = x - x^3/3!+ x^5/5! - x^7/7! + x^9/9! + . . .

% generamos la funcion: sin(x)
figure(1)
f = @(x) sin(x);
% la graficamos
figure(1)
ezplot(f,[-2*pi 2*pi])
grid on
grid minor

% planteamos las diferentes aproximaciones

P1 = @(x) x;
P3 = @(x) x - x.^3/(factorial(3));
P5 = @(x) x - x.^3/(factorial(3)) + x.^5/(factorial(5));
P7 = @(x) x - x.^3/(factorial(3)) + x.^5/(factorial(5)) - x.^7/(factorial(7));
P9 = @(x) x-x.^3/(factorial(3))+x.^5/(factorial(5))-x.^7/(factorial(7))+x.^9/(factorial(9));


figure(2)
x = linspace(0,2*pi,51);
plot(x,f(x),'or',x,P9(x),'m-diamond')
grid on
grid minor
legend('funcion seno', 'P9')
xlabel('X')
ylabel('funcion f(x) o P9')

figure(3)
x = linspace(-pi/2,pi/2,50);
plot(x,f(x),'or',x,P1(x),'b-*',x,P3(x),'g-*',x,P5(x),'b-*',x,P7(x),'r-*',x,P9(x),'m-diamond')
grid on
grid minor
legend('f(x)','P1','P3','P5','P7','P9')