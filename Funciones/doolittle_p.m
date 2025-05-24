%Para doolittle_p consta de 3 etapas
% Planteo PA = LU
% El sistema queda PAx = Pb ---> LUx = Pb
% y se escribe como Ly = Pb (sust adelante)
% Ux = y (con sust atras)



function [L, U, A, r, P] = doolitle_p(A)
  n = size(A, 1);
  %defino el vector r, para registrar las permutaciones
  r = 1:n;
  for k = 1:n-1

    %Encuentra el valor máximo (pmax) y su posición relativa (p), de acuerdo al
                       %Usa los valores de r(k:n) como índices de filas
    [pmax, p] = max(abs(A(r(k:n), k)));
    %Como la posicion p es la posicion del subvector A(r(k:n),k)
    %Al sumarle k esto desplaza la posicion p pero como los indices comienzan en 1 en octave, se le resta -1
    p = p + k - 1;

    %si el maximo no se encuentra en la diagonal, entonces invierte
    if p ~= k
      r([p k]) = r([k p]);
    endif

    A(r(k+1:n), k) = A(r(k+1:n), k)/A(r(k), k);
    %Calcula los factores/multiplicadores que se usarán para eliminar elementos debajo del pivote en la columna k
    %Los almacena en la parte triangular inferior de la matriz A (que luego formará parte de L)


    A(r(k+1:n), k+1:n) = A(r(k+1:n), k+1:n) - A(r(k+1:n), k) * A(r(k), k+1:n);
    %Actualiza la submatriz eliminando los elementos debajo del pivote
    %Realiza una combinación lineal de filas usando los multiplicadores recién calculados
  endfor

  %construccion de P
  %toma la matriz identidad de nxn (n=length(r)) y reordena sus filas según r.
  P = eye(length(r))(r, :);


  %aplica las permutaciones de A y las guarda en C para luego dividirlas en L y U
  C = P*A;

  L = eye(n)+tril(C,-1);
  U = triu(C);
endfunction












