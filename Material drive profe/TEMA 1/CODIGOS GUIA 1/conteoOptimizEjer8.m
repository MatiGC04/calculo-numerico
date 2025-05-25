clear all
clc

a=[1:1:1000];
b=[2:1:1001];
n = length(a)
suma = 0;
s2=  0;
tic
for i=1:n
  
for j=1:i
suma = suma + b(j);
end
s2 = s2 + suma*a(i);
suma = 0;
end
toc