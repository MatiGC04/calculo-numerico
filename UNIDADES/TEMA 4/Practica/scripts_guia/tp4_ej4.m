format long;
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
intervalo = linspace(6,7,1000);
f = @(x) sin(x) + cos(1+x.^2) - 1;
origen = @(x) x*0;
plot(intervalo,f(intervalo),'r-','linewidth',3, intervalo,origen(intervalo),'k-','linewidth',3)
grid on;

a = 1;
b = 2;
maxit = 1000;
kmax = maxit;
tol = 1e-10;
[p1, rh, it1, E_rel,tiempo] = biseccion(f, a, b, maxit, tol);

x0 = 1; x1 =2;
[p2, rh, it2, t] = secante(f, x0, x1, kmax, tol);
p2
%defino la deridava de f, es decir f'
df = @(x) cos(x) - sin(1+x.^2).*x*2;
[p3,rh,it3,t] = newton(f,df,2,kmax,tol);
[p4,rh,it4,t] = newton(f,df,2.75,kmax,tol);
display("Biseccion");
it1
p1
display("Secante");
it2
p2
display("Newton");
it3
p3
p4
it4
