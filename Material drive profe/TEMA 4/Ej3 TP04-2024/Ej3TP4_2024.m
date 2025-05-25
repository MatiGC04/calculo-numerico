clear all;
clc; clf
%Ej3TP4_2024.m
f  = @(x) x.^4+2*x.^2-x-3 ;
x=linspace(1,3/2,100);
x0=1
tol=10^-7
kmax=1000
figure(1)
plot(x,f(x),'k-')
grid on; grid minor
z =@(x) x==0;
hold on
plot(x,z(x),'r-')
title('Cero de la funcion')
hold off

% metodo de punto fijo

%g1 = @(x) (3+x-2*x.^2).^(0.25);
%g2 = @(x) ((x+3-x.^4)/2).^(0.5);
%g3 = @(x) ((x+3)./(x.^2+2)).^(0.5);
g4 = @(x) ((3*x.^4+2*x.^2+3)./(4*x.^3+4*x-1));

figure(2)
h=@(x) x;
hold on
% plot(x,g1(x),'b-')
% plot(x,g2(x),'b-')
%plot(x,g3(x),'b-')
plot(x,g4(x),'b-')
title('Grafica del Punto Fijo')
grid on, grid minor
ylim([1,1.5])

plot(x,h(x),'k-')
hold off

%[x1, rh1, it1,t1] = puntofijo(g1, x0, kmax, tol);
%[x2, rh2, it2,t2] = puntofijo(g2, x0, kmax, tol);
%[x3, rh3, it3,t3] = puntofijo(g3, x0, kmax, tol);
[x4, rh4, it4,t4] = puntofijo(g4, x0, kmax, tol);

%x1
%x2
%x3
x4
%it1
%it2
%it3
it4
valor_del_cero=f(x4)

figure(3)
semilogy(rh4,'b-')
title('Convergencia')
hold on
%plot(rh2)
%plot(rh3)
%plot(rh4)
grid on, grid minor



