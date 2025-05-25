% Ej17a seccion 1.2 Burden
% Ej17a_12.m
clear all; clc
format short
x0=1.31; y0=3.24;
x1=1.93; y1=4.76;

m = (y1-y0)/(x1-x0)


%y-y1=m*(x-x1);

y = @(x) y1+m*(x-x1);

% primera formula
x = (x0*y1-x1*y0)/(y1-y0)


% segunda formula
xx = x0-((x1-x0)*y0)/(y1-y0)


abscisaO  = y(x)
abscisaOO = y(xx)