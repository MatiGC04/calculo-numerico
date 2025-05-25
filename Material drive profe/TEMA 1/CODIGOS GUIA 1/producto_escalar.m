clear all; clc
PE= 0
n = input('Ingrese el valor de n:...')
a = zeros(1,n);
b = zeros(1,n); 
tic()
for i = 1: n
    a(i) = randi([1,100],1,1);
    b(i) = randi([1,100],1,1);
end

disp(a)
disp(b)

for i = 1: n
    PE =PE +a(i)*b(i);
end
t =toc
fprintf('El producto escalar entre los dos vectores es de: %7d \n', PE)
fprintf('El tiempo para el producto escalar entre los dos vectores es de: %7f \n', t)