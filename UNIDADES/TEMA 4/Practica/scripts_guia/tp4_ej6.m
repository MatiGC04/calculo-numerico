addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;

a = 0.0401;
b = 42.7e-6;
T = 300;
p = 3.5e+7;
k = 1.3806503e-23;
tol = 1e-12;
N = 1000;
f = @(V) [ p + a*(N./V).^2 ].*(V-N.*b) - k.*N.*T;

%Para usasr biseccion primero grafico la funcion v.



%pkg load symbolic  % Cargar el paquete simbólico

syms V;                      % Declarar variable simbólica
f2 = [ p + a*(N./V).^2 ].*(V-N.*b) - k.*N.*T;           % Definir la función
df_sym = diff(f2, V);        % Calcular derivada simbólica
df = matlabFunction(df_sym); % Convertir a función anónima

v0 = 0.04;
kmax = 1000;
display("__Newton Rawson__")
[v, rh, it] = newton(f, df, v0, kmax, tol);
v
it

display("__BISECCION__")
[v1, rh, it1, E_rel,tiempo] = biseccion(f, -4, 4, kmax, tol);
v1
it

