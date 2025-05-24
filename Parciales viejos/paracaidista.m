%ejercicio paracaidista
pkg load symbolic;
format long
addpath("G:/UNL 2025 CURSADO/Calculo_Numerico/Funciones")
display("a)")
f = @(m) 9.8 .*m.*(1-exp(-(15./m).*5)) -(15*35);

i = linspace(0,1000,1000);
cero = @(x) x*0;
plot(i,f(i),'r-',i,cero(i),'k')

%tiene cero cerca de 100
%uso newton rawson
syms m; %recordar siempre recargar el paquete: pkg load symbolic
f_sym = sym('9.8')*m.*(1-exp(-(15./m).*5)) -(15*35);
df_sym = diff(f_sym,m);
df = matlabFunction(df_sym);
[m,rh,it,t] = newton(f,df,100,1000,1e-5);
m % resultado m = 104.83

display("\n\n b)")
i = linspace(10,30,1000);
%g = @(c) (9.8*110)*(1-exp(-(c./110)*5)) - c*35;
g = @(c) (9.8.*110).*(1-exp(-(c./110).*5)) - c.*35;  % Versión vectorizada correcta
plot(i,g(i),'r-', i, cero(i),'k');

syms c

g_sym = sym('9.8').*110.*(1-exp(-(c./110).*5)) - c.*35;
dg_sym = diff(g_sym,c);
dg = function_handle(dg_sym);
%por medio de la grafica se ve que corta cerca de 15
display("\nNewton")
[c,rh,it,t] = newton(g,dg,15,10000,1e-5);
c
display("\nComo newton falla usare secante")

[c, rh, it, t] = secante(f, -1, 16, 1000, 1e-5);
c

display("\n__biseccion__")
[p, rh, it, E_rel,tiempo] = biseccion(g, -1, 16, 1000, 1e-5);


