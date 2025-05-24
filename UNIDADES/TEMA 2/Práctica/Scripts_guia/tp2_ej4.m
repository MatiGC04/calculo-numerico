%Ejercicio 4 b)
addpath("G:/UNL 2025 CURSADO/Cálculo Numérico/Funciones");
b = [-8 6 -4 4]'
  %para declarar una matriz separo de a ; las columnas
A = [ 1 0 0 0; -1 2 0 0; 2 -1 -1 0; -1 1 -1 2]'
display("Sustitucion hacia adelante")
x = sust_atras(A ,b)
B = A'
display("Sustitucion hacia adelante")
x = sust_adelante(B ,b )

