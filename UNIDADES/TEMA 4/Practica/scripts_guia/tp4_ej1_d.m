% Agregar la ruta donde se encuentra la función
addpath("G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones")
% Definir el valor de 'a' para el cual se calculará la raíz cúbica
a = 27; % Ejemplo: raíz cúbica de 27
xa = 0; % Límite inferior del intervalo
xb = 30; % Límite superior del intervalo

% Llamada a la función rcubica para obtener la raíz cúbica
[p, rh, E_rel, it] = rcubica(a, xa, xb);

% Mostrar los resultados
disp('Raíz cúbica calculada: ')
disp(p)
disp('Valor de p^3: ')
disp(p^3)
disp('Error relativo: ')
disp(E_rel(end)) % Mostrar el último error relativo
disp('Número de iteraciones: ')
disp(it)

