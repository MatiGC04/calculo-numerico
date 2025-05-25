# Ej11TP052025.m

clear all; clc; clf

# datos del archivo datos_velocidades.txt
T=linspace(0,5,26)';
velo=load('datos_velocidades.txt'); % carga del archivo
size(velo)
size(T)
figure(1)
plot(T,velo,'o')
hold on
grid on; grid minor;

% pruebo ajustar con polinomios
% polinomio grado 5
cp6=polyfit(T,velo,6);
p6=@(t) polyval(cp6,t);
%===========================
% polinomio grado 4
cp4=polyfit(T,velo,4);
p4=@(t) polyval(cp4,t);

tt=linspace(0,10,101)';
size(tt)

plot(tt,p6(tt),'b')
plot(tt,p4(tt),'r')

hold off;

figure(2)
plot(T,velo,'o')
hold on
grid on; grid minor;

f1=@(t) sin(2*t);
f2=@(t) t.^2;
f3=@(t) 2.^t;
% probamos usar distintas funciones que reemplacen 2^t
%f3=@(t) t.*cos(t);
%f3=@(t) (t.^2).*cos(t);

f4=@(t) 1+0.*t;

F=@(t) [f1(t) f2(t) f3(t) f4(t)];


coef=F(T)\velo
F(T)
%[coef] = eliminacion_gauss(F(T), velo);

g=@(t) F(t)*coef;

plot(tt,g(tt),'k')


plot(tt,g(tt),'k-')

Err_p6=norm(velo-p6(T))
Err_g=norm(velo-g(T))


pol6=p6(6)

pol4=p4(6)
g6=g(6)
