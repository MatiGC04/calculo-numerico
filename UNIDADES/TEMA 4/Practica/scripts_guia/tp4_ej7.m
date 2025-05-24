addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
%pkg install -forge symbolic
pkg load symbolic
format long;
%log(x) es Ln(x)
f = @(x) x.*(log(x + 3) - 17) -1;

%defino intervalos de inicio:
a = 0;
b = 1;
tol = 1e-2;

%voy buscando el valor de f tal que se cumpla la
% condicion necesaria del teorema de Bolzano:
% si f es continua en [a,b] donde, la funcion evaluada en los extremos tiene
% signos opuestos ( f(a)*f(b) <0 )
while f(a)*f(b) > 0
    b = 2 * b;
end
display("Intervalo definido")
disp(['[', num2str(a), ', ', num2str(b), ']']); %num2str convierte en str los valores

% En este punto, [a, b] contiene una raíz
kmax = 1000;
display("__Biseccion, valor cercano__")
[x0, rh, it, E_rel,tiempo] = biseccion(f, a, b, kmax, tol);
x0
tol = 1e-12;



%aplico newton:
%Declaro la funcion simbolica para derivarla, y obtener df.
syms x;                      % Declarar variable simbólica
f_s = x.*(log(x + 3) - 17) -1;          % Definir la función
df_sym = diff(f_s, x);        % Calcular derivada simbólica
df = matlabFunction(df_sym); % Convertir a función anónima

display("__newton__")
[xf, rh, it] = newton(f, df, x0, kmax, tol);
xf
