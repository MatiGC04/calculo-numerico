function [p, rh, it, E_rel,tiempo] = biseccion(f, a, b, maxit, tol)
% calculo con Error relativo.
  tic()
  if sign(f(a))*sign(f(b)) > 0
    %error('No se cumple la regla de los signos y el Teorema valor intermedio');
    display("No se cumple la regla de los signos y el Teorema valor intermedio");
  endif
   it = 0;
   p=a; % Definimos un primer valor de p
  while (it < maxit)
    it++;
    pold=p;
    % calculo del Punto medio teniendo en cuenta los efectos de error de redondeo
    p = a + ((b-a)/2); % calculamos p_i (ver pag 54 Cap. 2 Burden)

    %E_rel(it)=abs((p-pold)/(p+eps));

    %[a ..... p ..... b]
    % si f(p)*f(b)<0 --> a = p
    % el intervalo se actualiza a [a...b] = [p....b]
    if (sign(f(p))*sign(f(b))<0)

      %Evaluo, que tan cerca esta f(p) de 0
      % y que tan "chico" se ha hecho el intervalo
      rh(it) = max(abs([f(p),b-p]));

      % NOTA:
      % sumamos a denominador "eps" paraevitar la división por cero o por un número demasiado pequeño.
      % Agregar eps no cambia nada cuando el valor es razonable, pero evita errores numéricos si el valor
      % de p es muy cercano a cero. Es una buena práctica para tener robustez numérica.
      E_rel(it)=abs((p-pold))/(abs(p)+eps);

      a = p;
    else
      rh(it) = max(abs([f(p),p-a]));
      E_rel(it)=abs((p-pold))/(abs(p)+eps);
      b=p;
    endif
    %pold=p;

  %_____Condiciones de Corte____
  %Se puede usar rh o E_Rel

   %if(rh(it)<tol)
    %  break;
    %endif

   %Ventaja: te asegurás que realmente estás cerca de una raíz o que el intervalo ya es casi un punto.
   %Riesgo: puede tardar más iteraciones que con E_rel



    if(E_rel(it)<tol)
      break;
    endif
    %Ventaja: es rápido; detecta cuando el valor de "p" ya no cambia significativamente.
    %Riesgo: puede pasar que p ya no cambie mucho, pero f(p) todavía no sea suficientemente chico
    %(es decir que f(p) no está tan cerca de cero)



  endwhile
  tiempo = toc();

endfunction
