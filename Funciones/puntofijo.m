function [x, rh, it,t] = puntofijo(g, x0, kmax, tol)
  tic();
  it = 0;
  while it < kmax
    it++;
    x = g(x0);
    rh(it) = abs(x - x0);
    %rh(it) = max(abs([fp,p-a]));
    if rh(it) < tol
      t = toc();
      return;
    endif
    x0 = x;
  endwhile
  %error('No converge en el Kmax iteraciones');
  display('No converge en el Kmax iteraciones');
  t = toc();
endfunction
