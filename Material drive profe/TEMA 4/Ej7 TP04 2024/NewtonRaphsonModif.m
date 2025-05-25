% Método de Newton Modificado
function [x,rh,it,t] = NewtonRaphsonModif(f,df,x0,m,kmax,tol)
% m : multiplicidad
tic();
it = 0;

fx0 = f(x0);
while it < kmax
    x = x0 - m*(fx0/df(x0));
    fx = f(x);
    rh(it+1) = abs(fx);
    if rh(it+1) < tol && abs(x-x0)<tol
      break;
    end
    
    fx0 = fx;
    x0 = x;
it = it+1;
end
t = toc();
end
