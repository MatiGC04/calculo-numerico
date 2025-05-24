A=[ 10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
b=[6 25 -11 -11]';
x0=[ 0 0 0 0]';

tol = 10E-5;
maxit = 1000;
Ds = diag(diag(A));
Ls = tril(A, -1);
Us = triu(A, 1);
w = linspace(0 , 2,100);

rad_min = 9;
for j=1 : length(w)
  Tw = inv(Ds + w(j).*Ls)*((1-w(j)).*Ds - w(j).*Us);
  %obtengo el radio espectral
  rad = max( abs( eig(Tw )) );
  if rad<rad_min
    rad_min = rad;
    min = w(j);
  endif
endfor
min
