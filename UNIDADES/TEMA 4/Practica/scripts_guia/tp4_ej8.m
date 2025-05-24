addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;

tol = 1e-5;
E = @(t) ((t + 1/3).^3 + 1/3).*exp(-t);
f = @(t) E(t) - 1.5;  % Función cuya raíz buscamos

%busco graficamente el punto q sea 0
i = linspace(0,10,100);
origen = @(x) x*0;
plot(i,f(i),'r-','linewidth',3,i,origen(i),'k','linewidth',3);

%por la grafica se ve que la grafica tiene dos raices, una cercana a 3 y la otra 1.5
syms t;                                       % Declarar variable simbólica
f_s = ( (t + 1/3).^3 + 1/3 ).*e.^(-t);        % Definir la función
df_sym = diff(f_s, t);                        % Calcular derivada simbólica
df = matlabFunction(df_sym);
[t1, rh, it] = newton(f, df, 3, 1000, 1e-5);
t1
[t2, rh, it] = newton(f, df, 1.5, 1000, 1e-5);
t2

display("Con biseccion no funciona pq f(a)*f(b)>0 para todo t")
%[x0, rh, it, E_rel,tiempo] = biseccion(f, -10, 15, 1000, tol);

if abs(f(t1)) <tol
  display("es raiz valida",num2str(t1))
endif
if abs(f(t2)) <tol
  display("es raiz valida",num2str(t2))
endif

