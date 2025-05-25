clear all;
clc
a=[1:1:1000];
b=[2:1:1001];
n = length(a)

s = 0;
s1 = 0;
tic
for i=1:n
for j=1:i
s1 = s1 + a(i)*b(j);

end

end
toc