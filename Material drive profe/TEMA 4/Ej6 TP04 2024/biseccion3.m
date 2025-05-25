function [p, rh, it, E_rel,tiempo] = biseccion3(f, a, b, maxit, tol)
% calculo con Error relativo.
  tic()
  fa = f(a);
  fb = f(b);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el Teorema valor intermedio');
  endif
   it = 0;
   p=a; % Definimos un primer valor de p
  while (it < maxit)
    it++;
    pold=p;
    % calculo del Punto medio teniendo en cuenta los efectos de error de redondeo
    p = a + (b-a)/2; % calculamos p_i (ver pag 54 Cap. 2 Burden)
    fp = f(p);
    %E_rel(it)=abs((p-pold)/(p+eps));

    if (sign(fp)*sign(fb)<0)
      rh(it) = max(abs([fp,b-p]));
      % NOTA:
      % sumamos a denominador "eps" paraevitar la división por cero o por un número demasiado pequeño.
      % Agregar eps no cambia nada cuando el valor es razonable, pero evita errores numéricos si el valor
      % de p es muy cercano a cero. Es una buena práctica para tener robustez numérica.

      E_rel(it)=abs((p-pold))/(abs(p)+eps);
      fa = fp;
      a = p;
    else
      rh(it) = max(abs([fp,p-a]));
      E_rel(it)=abs((p-pold))/(abs(p)+eps);
      fb = fp;
      b=p;
    endif
    %pold=p;

   % if(rh(it)<tol)
    %  break;
    %endif

    if(E_rel(it)<tol)
      break;
    endif

  endwhile
  tiempo = toc();

endfunction
