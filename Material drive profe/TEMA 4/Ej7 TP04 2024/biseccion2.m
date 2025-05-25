function [p, rh, it, tiempo] = biseccion2(f, a, b, maxit, tol)

  tic()
  fa = f(a);
  fb = f(b);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el Teorema valor intermedio');
  endif
   it = 0;
  while (it < maxit)
    it++;
    p = a + (b-a)/2; % calculamos p_i (punto medio del intervalo
    fp = f(p);
    
    if (sign(fp)*sign(fb)<0)
      rh(it) = max(abs([fp,b-p]));
      fa = fp;
      a = p;
    else
      rh(it) = max(abs([fp,p-a]));
      fb = fp;
      b=p;
    endif
    
    if(rh(it)<tol)
      break;
    endif
  
  endwhile
  tiempo = toc();
       
endfunction