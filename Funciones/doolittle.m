
%La factorizacion LU consta de 3 etapas:
% A = LU (con doolittle)
% Ly = b (obtengo y con sus_adelante
% Ux = y (obtengo x con sust_atras
function[L,U] = doolittle (A)
  n = length(A(:,end));
  for k = 1: n
    %Divide todos los elementos debajo de la diagonal en la columna  k
    % por el elemento de la diagonal principal A(k,k)
    A(k+1:n, k) = A(k+1:n,k)/A(k,k); %Esto guarda los multiplicadores que iran en L

    %Resta un producto de matrices para eliminar los elementos debajo de la diagonal.
    A(k+1:n,k+1:n) = A(k+1:n, k+1:n) - A(k+1:n,k)*A(k,k+1:n);
                                     % ^multiplicadores calculados antes

  endfor

  %eye(n) crea una matriz identidad de nxn
  L = eye(n)+tril(A,-1); %tril(A,.1) extrae los elementos de la diagonal inferior, pero excluyendo los de la diag principal
  U = triu(A); %extrae la parte de la triangular superior de la matriz A, incluyendo la diagonal principal POR DEFECTO

endfunction
