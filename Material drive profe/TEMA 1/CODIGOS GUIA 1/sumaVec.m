clear all;clc
n = [10,100,1000,2000]';
t = zeros(length(n),1)';
for j = 1: length(n);    
a = zeros(1,n(j));
b = zeros(1,n(j)); 
s =zeros(1,n(j));

tic()
for i = 1: n(j)
    a(i) = randi([1,10],1,1);
    b(i) = randi([1,10],1,1);
end

for i = 1: n(j)
    s(i) = [a(i) + b(i)];
end

t(j) = toc;

end

disp('El vector de terminos es de: \n')
disp(n)
disp('El vector de tiempo es de: \n')
disp(t)
%Generamos un vector con los dos valores n y t
v =[n t'];
disp('Tabla compartiva de elementos de los vectores y tiempos')
disp(v)

figure(1)
plot(n,t,'-*b');
title('Grafica cantidad vs tiempo')
grid on
