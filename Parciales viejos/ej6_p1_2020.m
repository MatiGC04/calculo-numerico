%Parcial 1 2020 ej1
format long;
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
pkg load symbolic ;

display("Ejercicio 6 Parcial 1 2023")
f = @(x) sin(x) + cos(1+x.^2) -1;
x0 = 8;
syms x
f_sym = sin(x) + cos(1+x^2) -1;
df_sym = diff(f_sym);
df = matlabFunction(df_sym);

[x,rh,it,t] = newton(f,df,x0,1000,1e-10);
x

display("\n\nEjercicio 4 parcial 2020");
[x,rh,it,t] = newton(f,df,1,1000,1e-10);
x ; %encuentra una raiz en x = 6.935323

%ploteo para ver a que raiz converge
i = linspace(0,8,1000);
cero = @(x) x*0;

plot(i,f(i),'r-','linewidth',3, i, cero(i),'k')
grid on
%Por medio de la grafica se ve que converge a la 5ta raiz
