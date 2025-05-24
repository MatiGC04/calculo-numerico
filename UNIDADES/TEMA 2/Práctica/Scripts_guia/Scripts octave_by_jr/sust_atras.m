function x = sust_atras(A,b)
  n = length(b);
  x = zeros(n,1);

  s = b(n)/A(n,n);
  x(n) = s;
  for i = n-1:-1:1
    suma=0;
    for j=i+1:1:n
      suma = suma + A(i,j)*x(j);
    endfor
    x(i) = (b(i)-suma)/A(i,i);
  endfor

