function [x, it, rh] = GradienteConjugado(A, b, x0, maxit, tol)
 #tic();
 x=x0;
 r = b - A*x;
 v = r;
 c = r'*r;
 for it=1:maxit
 if norm( v ) < tol
 break;
 endif
 z = A * v;
 t = c / (v' * z);
 x = x + t * v;
 r = r - t * z;
 d = r'*r;
 rh(it) = norm(r,2);
 if rh(it) < tol
 break;
 endif
 v = r + d/c*v;
 c = d;
 endfor
 #t = toc();
 endfunction