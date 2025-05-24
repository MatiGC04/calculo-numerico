addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;
E = @(t) ((t + 1/3).^3 + 1/3).*exp(-t);
figure(1)
cero = @(x) x*0;
t0 = linspace(0, 20,100);
plot(t0,E(t0), 'r-', 'linewidth',3, t0,cero(t0), 'k', 'linewidth',3);#se puede ver que hay un maximo cercano a 2.4


syms t;
E_sim = ((t + sym(1)/3).^3 + sym(1)/3).*exp(-t);
dE_sym = diff(E_sim, t);
dE2_sym = diff(dE_sym,t);

dE1 = matlabFunction(dE_sym);


dE2 = matlabFunction(dE2_sym);
figure(2)
plot(t0,dE1(t0), 'r-', 'linewidth',3, t0,cero(t0), 'k', 'linewidth',3);
tol = 1e-5;
%para encontrar la raiz uso biseccion
display("Uso Biseccion");
[t0, rh, it, E_rel,tiempo] = biseccion(dE1, -10, 15, 1000, tol);
t0
it

%para encontrar la segunda que esta cerca de 10 uso newton}
display("Uso Newton");
[xf, rh, it] = newton(dE1, dE2, 2.4, kmax, tol);
xf
it
display("\n Uso Secante");
[tf, rh, it, t] = secante(dE1, -15, 5, kmax, tol);
tf
it
