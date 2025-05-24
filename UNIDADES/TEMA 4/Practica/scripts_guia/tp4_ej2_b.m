addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
f = @(x) x.^3 + 4.*x.^2 -10;
a = 1
b = 2
p0 = 1.5
tol = 1e-3
maxit = 100
g1 = @(x) (1/2).*( 10 - x.^3 ).^(1/2);
g2 = @(x) (10/(4+x)).^(1/2);

display("Punto fijo para g1")
[xf, rh1, it,t] = puntofijo(g1, p0, maxit, tol);
xf(end)
it
rh1;

display("Punto fijo para g2")
[xf, rh2, it,t] = puntofijo(g2, p0, maxit, tol);
xf(end)
it
rh2;


figure(1)
x = linspace(a,b,100);
plot(x,f(x),'r-','linewidth',3)
grid on
xlabel('x')
ylabel('y=f(x)')
title('Grafica de la funcion ')

figure(2)
semilogy(rh1,'r-*')
xlabel('iteraciones')
ylabel('Convergencia del metodo')
hold on
semilogy(rh2,'b-d')
legend('Conv(g1(x)', 'Conv(g2(x)', 'Location', 'best')

