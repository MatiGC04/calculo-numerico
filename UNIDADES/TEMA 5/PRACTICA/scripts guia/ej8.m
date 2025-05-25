clc;
clear all;
clf; % Limpio la consola, las variables y la figura
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;
pkg load symbolic

%{
Ejercicio 8. (Aula) Un biólogo realiza un experimento de reproducción de mosquitos y toma las
siguientes mediciones
% Datos tabulados: cada fila es [semana, cantidad]
% | Semana | Cantidad |
% |--------|----------|
% |   0    |   432    |
% |   1    |   599    |
% |   2    |  1012    |
% |   3    |  1909    |
% |   4    |  2977    |
% |   5    |  4190    |
% |   6    |  5961    |

(a) Determinar el polinomio p6 de grado menor o igual que 6 que interpola los datos de la tabla.
(b) Determinar la función lineal p1 que mejor aproxima en el sentido de cuadrados mı́nimos los
datos dados (modelo lineal).
(c) Determinar el polinomio p2 de grado ≤ 2 que mejor aproxima en el sentido de cuadrados
mı́nimos los datos dados (modelo cuadrático).
(d) Graficar los datos y la evolución de los tres modelos calculados durante las seis semanas. De-
terminar el error cuadrático en cada caso. ¿cuál de los modelos le parece que es más apropiado
y por qué?
(e) Predecir cuál será la cantidad de mosquitos al cabo de 10 semanas según los diferentes modelos
propuestos. ¿Sigue pensando que el modelo más apropiado es el que eligió en el item anterior?
(f ) Si se sabe que la medición a las 10 semanas es de 14900 mosquitos, calcule el error relativo de
cada una de sus predicciones y verifique si el modelo que consideró más apropiado es el que
da la mejor predicción. %}