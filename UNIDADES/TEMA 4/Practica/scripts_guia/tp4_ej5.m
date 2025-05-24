format long;
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;

% Función f(x) = D'(x)
xi = linspace(0,1,1000);
f = @(x) 2*x - 2 + 4*x.^3;
plot(xi,f(xi),'r-','linewidth',3);
grid on;
hold on;
% Derivada f'(x)
df = @(x) 2 + 12*x.^2;

% Método de Newton
x0 = 1; % buen valor inicial, cerca del punto (1, 0)
tol = 1e-4;
kmax = 100;

[x, rh, it] = newton(f, df, x0, kmax, tol);

disp("Raíz aproximada x = ");
disp(x);
disp("Número de iteraciones:");
disp(it);
plot(x,f(x),'b*','linewidth',3);
