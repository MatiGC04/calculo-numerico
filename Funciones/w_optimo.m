

function [min] =w_optimo(A)
% Verifica que A sea cuadrada
[n, m] = size(A);
if n ~= m
    error('La matriz A debe ser cuadrada.');
endif

Ds = diag(diag(A));
Ls = tril(A, -1);
Us = triu(A, 1);
w = linspace(0 , 2,500);

rad_min = inf;
for j=1 : length(w)
  Tw = inv(Ds + w(j).*Ls)*((1-w(j)).*Ds - w(j).*Us);
  %obtengo el radio espectral
  rad = max( abs( eig(Tw )) );
  if rad<rad_min
    rad_min = rad;
    min = w(j);
  endif
endfor

