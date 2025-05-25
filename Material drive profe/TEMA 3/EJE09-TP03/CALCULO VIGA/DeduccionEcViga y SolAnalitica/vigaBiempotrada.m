% Programa para calcular los desplazamientos de una viga
% empotrada-empotrada y las reacciones utilizando el método de diferencias finitas
%
% Por: Jordan Mejía
% UFA - ESPE
% APORTE PARA EL PROGRAMA CEINCI-LAB
% 27 de mayo de 2015
%................................................
%................................................
format short
%Datos del Problema
clc;clear all
L=5; % longitud de la viga (m)
P=1.0362; %carga distribuida uniforme (T/m)
E=21000000; %módulo de elasticidad (T/m^2)
a=0.07; %ancho de la viga (m)
d=0.14; %alto de viga (m)
I=a*(d^3)/12; %momento de inercia de la viga (m^4)
EI=E*I %característico de la viga (T*m^2)
n=15; %punto de divisiones interiores de la viga
%Vxxxx=P/EI

h=L/(n+1); %distancia entre punto de división
S=zeros(n); %matriz generalizada
%Uxxxx=(1/h^4)*(1)-(-4)-((6))-(-4)-(1)
%cuarta derivada DF simétricas ordinarias por factores
%aplicando diferencias finitas las fórmulas simétricas ordinarias
%procedemos calcular la matriz generalizada cuadrada de orden n
S(1,1)=7; %posición 1x1
S(n,n)=7; %posición nxn
for i=2:n-1
S(i,i)=6; %valores de la diagonal principla
end
for i=2:n
S(i,i-1)=-4; %valores por debajo de la diagonal principal
end
for i=1:n-1
S(i,i+1)=-4; %valores por encima de la diagonal principal
end
for i=3:n
S(i,i-2)=1; %valores por debajo de la diagonal principal
end
for i=1:n-2
S(i,i+2)=1; %valores por encima de la diagonal principal
end
S; %matriz generalizada con sus respectivos valores
S=S*EI/h^4; %matriz de diferencia finitas
S %matriz final
Q=zeros(n,1); %vector solución
for i=1:n
Q(i,1)=P; %valores del vector igualado a la carga distribuida constante
end
Q;
%Solucion del sistema de ecuaciones por el Método Ax=b Gauss-Jordan
n=length(Q);
S=[S,Q]; %matriz ampliada
for e=1:n
S(e,e:n+1)=S(e,e:n+1)/S(e,e);
for i=1:n
if i~=e
S(i,e:n+1)=S(i,e:n+1)-S(i,e)*S(e,e:n+1);
end
end
end
V=S(1:n,n+1);
disp('El vector de desplazamientos en los puntos asignados es: ')
V; % vector de desplazamientos
disp('El momento de empotramiento en el nudo inicial es: ')
Ma=EI*(2*V(1,1))/h^2 %momento nudo inicial
disp('El momento de empotramiento en el nudo final es: ')
Mb=-EI*((2*V(n,1))/h^2) %momento nudo final
%Regresión progresiva 3era derivada
disp('La reacción vertical en el nudo inicial es: ')
Ra=-EI*(1/h^3*(3*V(1,1)-3*V(2,1)+V(3,1))) %Reacción vertical nudo inicial
%Regresión regresiva 3era derivada
disp('La reacción vertical en el nudo final es: ')
Rb=EI/h^3*(-3*V(n,1)+3*V(n-1,1)-1*V(n-2,1)) %Reacción vertical nudo final
%grafica de la deformada
for i=1:n
u(i)=h*i;
end
x=0:h:L;
y=0;
plot(x,y,'o')
hold on
i=[0 h];
r=[0 -V(1)];
f1=[L-h L];
f2=[-V(n) 0];
title('Deformada 15 puntos')
text(4,-0.000168,' \rightarrow n=15')
%plot(u,-V,'c',i,r,'c',f1,f2,'c'); 
semilogy(u,-V,'c',i,r,'c',f1,f2,'c'); 
grid on
axis([0 L -0.02 0]);
x=0:h:L;
y=0;
plot(x,y,'o')
