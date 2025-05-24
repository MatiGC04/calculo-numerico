function [x,rh,it,t] = newton(f,df,x0,kmax,tol)
tic();
it = 0;
while it < kmax
  it++;
    x = x0 -(f(x0)/df(x0));
    #fx0 = f(x0);
    %rh(it) = max([abs(fx), abs((x-x0)/x)])
    rh(it) = abs((x-x0))/abs(x);
    %rh(it) = abs((x-x0));
    %E_rela = 2*err/(abs(x)+tol);
    if rh(it) < tol*abs(x)
      break;
    endif

    x0 = x;

endwhile
t =toc();
endfunction
