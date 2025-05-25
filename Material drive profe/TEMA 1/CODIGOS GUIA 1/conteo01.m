
clear all
clc;
A = ones(500,1);
B = 2*ones(500,1);
n = length(A(1,:));
suma= 0;
suma1=0;
tic

for i=1:n
   suma1 = suma1 + A(i,1);
    for j=1:n
        suma = suma + suma1* B(j,1);
    end
end

suma1
toc