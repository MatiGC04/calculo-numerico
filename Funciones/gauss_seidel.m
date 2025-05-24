function [x, r, it, t] = gauss_seidel(A, b, x0, maxit, tol)
 tic();
 n = length(A(1,:));
 x = x0; # debe inicializarse x
 r = zeros(maxit,1);
 it = 0;
 while ( it < maxit )
   for i = 1:1:n
    x(i) = (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * x0(i+1:n) ) /A(i,i);
   endfor
 r(it+1) = norm(x-x0,inf)/norm(x,inf); %relativo
 % otra manera:
 % r(it+1) = norm( x-x0, inf); %error absoluto
 % r(it+1) = norm((x-x0),inf)/norm((x),inf);
 % r(it+1) = norm(A*x-b,inf); %norma infinito del residuo
 if r(it+1) < tol %then
   r = r(1:it+1);
   it = it +1;
   break;

  endif
 x0 = x;
 it = it + 1;
 endwhile
 t = toc();
 endfunction
