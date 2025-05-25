clear all;clc
n = [10,100,1000,2000]';
t = zeros(length(n),1)'; % mide tiempo
for j = 1: length(n);    
a = zeros(1,n(j));
b = zeros(1,n(j)); 
s =zeros(1,n(j));

tic()
for i = 1: n(j)
    a(i) = randi([1,10],1,1);
    b(i) = randi([1,10],1,1);
end

s = 0;
s1 = 0;

for i=1:n(j)
for k=1:i
s1 = s1 + a(i)*b(k);
end
end

t(j) = toc;

end

disp('El vector de terminos es de: \n')
disp(n)
disp('El vector de tiempo es de: \n')
disp(t)
%Generamos un vector con los dos valores n y t

figure(1)
plot(n,t,'-*b');
title('Grafica cantidad vs tiempo')
grid on
