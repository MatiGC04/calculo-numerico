format long;

addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
%Ejercicio 3
f = @(x) x.^4 + 2*x.^2 - x -3;
a = 1;
b = 3/2;

%funciones g_i(x)
g1 = @(x) (3 + x - 2*x.^2).^(1/4);
g2 = @(x) ((x + 3 - x.^4) / 2).^(1/2);
g3 = @(x) ((x + 3) ./ (x.^2 + 2)).^(1/2);
g4 = @(x) (3*x.^4 + 2*x.^2 + 3) ./ (4*x.^3 + 4*x - 1);

%Calculo puntof fijo y comparo las it y rh
x0 = 1;
kmax = 300;
tol = 1e-9;
[x, rh, it,t] = puntofijo(g1, x0, kmax, tol);
display("___G1(x)__");
rh(end)
it

display("___G2(x)__");
[x, rh, it,t] = puntofijo(g2, x0, kmax, tol);

%rh(end)
%it

[x, rh, it,t] = puntofijo(g3, x0, kmax, tol);
display("___G3(x)__");
rh(end)
it

[x, rh, it,t] = puntofijo(g4, x0, kmax, tol);
display("___G4(x)__");
rh(end)
it
