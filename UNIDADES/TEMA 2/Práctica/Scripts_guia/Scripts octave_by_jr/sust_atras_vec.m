function x = sust_atras_vec(A,b)
  n = length(b);
  x = zeros(n,1);
  x(n) = b(n)/A(n,n);
  for i = n-1:-1:1
    suma = A(i,i+1:n)*x(i+1:n);
    x(i) = (b(i)-suma)/A(i,i);
  endfor

