
function [x] = gauss1 (A, b)

  n=length(b);
  A=[A b];
  % Eliminacion
  for k=1:n-1
    for i=k+1:n
      m = A(i,k)/A(k,k); %Calculo el multiplicador que hará 0
      A(i,k)=0; %Hago 0 los valores debajo del pivote
      for j=k+1:n+1
        A(i,j) = A(i,j)-m*A(k,j); % A los elementos de que estan sobre la misma fila les aplico la operacion de matriz
       endfor
    endfor
  endfor
  if (A(n,n)==0)
  disp("no hay sol. unica")
  endif
  x=sust_atras1(A); %retrosustitucion

endfunction
