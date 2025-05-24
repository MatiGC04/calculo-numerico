addpath("G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones");

tol = 1e-3
f = @(x) x.^3 + x -4;
a = 1
b = 4
% Calcular la cota teórica de iteraciones
n_cota = ceil(log2((b - a) / tol)); % siempre redondeamos hacia arriba
fprintf('La cota teórica del número de iteraciones es: %d\n', n_cota);

maxit = n_cota + 5; %%sumo mas para ver que se cumpla en la it 12

[p, rh, it, E_rel,t] = biseccion(f, a, b, maxit, tol);
p
it
