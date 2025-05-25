function [coef] = AproxMinCuadrados(x, y, orden)
n = orden + 1;
A = zeros(n,n);
b = zeros(n,1);
k = 0;
for i = 1:n
A(1,i) = sum(x'.^k);
k = k + 1;
endfor
b(1) = sum(y);
for i = 2:n
A(i,1:n-1) = A(i-1,2:n);
A(i,n) = sum(x'.^k);
b(i) = (x.^(i-1))'*y;
k = k + 1;
endfor
coef = A\b; # coef(1) = a_0
endfunction