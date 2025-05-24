function [w_min] = wOptimo (A,b,x0,maxit,tol)

  min=maxit;
  w = linspace(0.01 , 1.99,100);
  for i=1:length(w)

    [~,it,~,~]=SOR(A,b,x0,maxit,tol,w(i));

    if(it<min)
      w_min=w(i);
      min=it;
    endif
  endfor

  %tambien se puede usar la formula, si la matriz es definida positiva
  %y tridiagonal
  %w = 2/( 1+sqrt( 1 - (RadJacobi(A)^2) ) )

endfunction
