function  x = rcubica(a)
  %x^(1/3) = a
  %x = sqrt(a,3)  =>  x^3 - a = 0

  if a == 1 || a == -1 || a == 0
    x = a;
  endif

  neg = false;
  if a < 0
    neg = true;
    a = a*(-1);
  endif

  f = @(x) x^3 - a;

  if a > 1
      % 0 < sqrt(a,3) < a
      xmin = 0;
      xmax = a;
  else
      % a < sqrt(a,3) < 1
      xmin = a;
      xmax = 1;
  endif

  tol = 10e-12; % NO SE SI ES EL ERROR RELATIVO
  tole = 10e-12/ abs(a);
  kmax = 100000000;


  [x,h] = biseccion(f,xmin,xmax,kmax,tol);
    if neg == true
      x = x*(-1);
    endif

endfunction
