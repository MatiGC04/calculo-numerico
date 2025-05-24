function [x,r_h,it,t] = SOR(A,b,x0,itmax,tol,w)
  tic();
  n = length(b);
  x = x0;
  it = 0;
  while (it<itmax)
    for i=1:1:n
      x(i) = w*(b(i)-A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i) + (1-w)*x0(i);
      %hay que verificar que la matriz A no tenga ceros en la diagonal
      %eso se hace antes de iterar, en caso de que si, aplicar piv parcial

    endfor
    %error relativo:
    %   norm(x-x0)/norm(x); -> error relativo(es una aproximacion al error, debido a que el error se calcula con la solucion exacta)
    %   norm(A*x-b) -> se le denomina residuo de la ecuacion;
    %   Una condicion para detener el algoritmo puede ser  norm(A*x-b,inf)<= norm(b,inf)*tol
    %   Una condicion para detener el algoritmo puede ser norm(x-x0,inf)/norm(x,inf) <=tol
    r_h(it+1)=norm(x-x0,inf)/norm(x,inf); %calculo el residuo
    if r_h(it+1) < tol
      it = it +1;
      break;
    endif
    it = it + 1; %actualizo la cantidad de iteraciones
    x0 = x;
  endwhile
  t = toc();
endfunction

