%Ejercicio 8 b)
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones');


b= [1 2 3]';
A1 = [ 8 4 1 ; 2 6 2; 2 4 8];

A2 = [5.00e-02, 5.57e+02, -4.00e-02;
      1.98e+00, 1.94e+02, -3.00e-03;
      2.74e+02, 3.11e+00, 7.50e-02];
A3= [ 1 2 -1; 2 4 0; 0 1 -1];

% Solicitar al usuario que ingrese un número (1, 2 o 3)
n = input('Ingrese el número de matriz a usar (1, 2 o 3): ');

% Asignar la matriz seleccionada a An
switch n
    case 1
        An = A1;
    case 2
        An = A2;
    case 3
        An = A3;
    otherwise
        error('Número no válido. Debe ser 1, 2 o 3.');
end

% Mostrar información sobre la matriz seleccionada
fprintf('\nMatriz seleccionada A%d:\n', n);
disp(An);



display("USO DE DOOLITTLE NORMAL")
display("Obtengo primero A = LU")
[L U] = doolittle(An);
display("Resuelvo primero el sistema Ly = b");
y1 = sust_adelante(L,b);
display("Luego resuelvo el sistema Ux = y");
x1 = sust_atras(U,y1)
display("RESIDUO |Ax - b| ")
res= abs(An*x1 -b)

display("USO DE DOOLITTLE_P")
display("Obtengo primero A = LU")

[L, U, A, r, P] = doolittle_p(An);
display("Resuelvo primero el sistema Ly = b");
Pb = P*b;
y2 = sust_adelante(L,Pb);
display("Luego resuelvo el sistema Ux = y");
x2 = sust_atras(U,y2)
display("RESIDUO |Ax - b| ")
res= abs(An*x2 -b)

