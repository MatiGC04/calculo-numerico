addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;

p = @(x) 230*x.^4 + 18*x.^3 + 9*x.^2 -221*x - 9;

%si es punto fijo, p(x)=x --> g(x) = p - x = 0
g = @(x) p(x) - x;
x0 = 0;
kmax = 1000;
tol = 1e-6;

i = linspace(-0.041,2,1000);
cero = @(x) x*0;
plot(i,g(i),'r-',i,cero(i),'k');
hold on
%se ve por la grafica que los 0 de la funcion estan entre -300 y +300
%como la funcion es siempre positiva en sus extremos, aplico newton

syms x;
g_sym = 230*x.^4 + 18*x.^3 + 9*x.^2 -222*x - 9;
dg_sym = diff(g_sym);
dg = matlabFunction(dg_sym);
[x1,rh,it,t] = newton(g,dg,-300,kmax,tol);
x1

[x2,rh,it,t] = newton(g,dg,300,kmax,tol);
x2
tol = 1e-6;
printf("%.6f\n", x1);
display("numero x1 en 6 decimales exactos")
mostrar_numero(x1,6,'dec')
plot(x1, g(x1), 'b*', 'LineWidth', 3);
plot(x2, g(x2), 'g*', 'LineWidth', 3);


