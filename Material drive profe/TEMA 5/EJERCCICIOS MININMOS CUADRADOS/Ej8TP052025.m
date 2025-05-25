# Ej8TP052025.m
clear all; clc; clf
# datos
x = [0 1 2 3 4 5 6]'
y = [432 599 1012 1909 2977 4190 5961]'

xx=linspace(-1,10.5,201);


# interpolamos con lagrange
[PL, L] = Lagrange(x,y);
plag = @(x) polyval(PL,x);

figure(1)
 plot(x,y,'ro', xx,plag(xx),'k')
 grid on
 hold on
 xlabel ('X')
 ylabel('Y')
 legend('datos', 'Lagrange')

# Ajuste de datos

# Lineal

cp = polyfit(x,y,1);
p1 = @(x) polyval(cp,x);

figure(1)
hold on;
grid on; grid minor
plot(xx,p1(xx),'b')

legend('datos', 'Lagrange', 'Lineal')
%=============================================================
# Cuadratico
cp2 = polyfit(x,y,2);
p2 = @(x) polyval(cp2,x);

plot(xx,p2(xx),'g-x')

legend('datos', 'Lagrange', 'Lineal','Cuadratico')

%=============================================================
# Cuadratico
cp3 = polyfit(x,y,3);
p3 = @(x) polyval(cp3,x);

plot(xx,p3(xx),'r-o')

legend('datos', 'Lagrange', 'Lineal','Cuadratico','p3')
%=============================================================
cp4 = polyfit(x,y,4);
p4 = @(x) polyval(cp4,x);

plot(xx,p4(xx),'m-')

legend('datos', 'Lagrange', 'Lineal','Cuadratico','p3', 'Cuartico')

%=============================================================
cp5 = polyfit(x,y,5);
p5 = @(x) polyval(cp5,x);

plot(xx,p5(xx),'r-')

legend('datos', 'Lagrange', 'Lineal','Cuadratico','p3', 'Cuartico','p5')

%===================================================
cp6 = polyfit(x,y,6);
p6 = @(x) polyval(cp6,x);

plot(xx,p6(xx),'c')

legend('datos', 'Lagrange', 'Lineal','Cuadratico','p3','Cuartico','p5','p6')
%====================================================
# Newton
[PN, c, N] = PolIntNewton(x, y);
pnew = @(x) polyval(PN,x);

plot(xx,pnew(xx),'k')
legend('datos', 'Lagrange', 'Lineal','Cuadratico','p3','Cuartico','p5','p6','Newton')


% valor a las 10 semanas
x10=10;
y10=14900;

plot(x10,y10,'*k',"linewidth",2);
legend('datos', 'Lagrange', 'Lineal','Cuadratico','p3','Cuartico','p5','p6','Newton','y10', 'location','north')

%====================================================
% CALCULO DE ERRORES
disp('Calculo de Errores')

%========================================
ErrLag = norm(y10-plag(10))
ErrNew = norm(y10-pnew(10))

%========================================
ErrLineal = norm(y10-p1(10))
ErrorRelativo_Lineal = abs((y10-p1(10))/y10)
%Errorlineal= norm(y - p1(x))
%========================================
Error_y10p2 = norm(y10-p2(10))
ErrorRelativo_p2 = abs((y10-p2(10))/y10)
%ErrorCuadratico= norm(y - p2(x))
%========================================

Error_y10p3 = norm(y10-p3(10))
ErrorRelativo_p3 = abs((y10-p3(10))/y10)
%ErrorCuadratico= norm(y - p2(x))
%========================================
Error_y10p4 = norm(y10-p4(10))
ErrorRelativo_p4 = abs((y10-p4(10))/y10)
%ErrorCuartico= norm(y - p4(x))
%========================================
%========================================
Error_y10p5 = norm(y10-p5(10))
ErrorRelativo_p5 = abs((y10-p5(10))/y10)
%ErrorCuartico= norm(y - p4(x))
%========================================
Error_y10p6 = norm(y10-p6(10))
ErrorRelativo_p6 = abs((y10-p6(10))/y10)
%ErrorCuartico= norm(y - p4(x))
