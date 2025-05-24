function x = sust_adelante_vec(A,b)
  n = length(b);
  x = zeros(n,1);
  x(1) = b(1)/A(1,1);
  for i=2:1:n
    suma = A(i,1:i-1)*x(1:i-1);
    x(i) = (b(i)-suma)/A(i,i);
  endfor

