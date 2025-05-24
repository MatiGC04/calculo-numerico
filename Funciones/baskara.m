
function [r1,r2, leyenda] = baskara (coeficientes)
  n2= coeficientes(1);
  n1= coeficientes(2);
  n0= coeficientes(3);
  if n2==0
    %Luego del codigo error no se ejecuta el codigo...
    error('El coeficiente cuadrático no puede ser cero.');
  endif
  discriminante = n1^2 -4*n2*n0;
  if discriminante>0
    leyenda = "Raices reales y distinas";
    r1 = ((-n1 + sqrt(discriminante) ) / (2 * n2) );
    r2 = ((-n1 - sqrt(discriminante) ) / (2 * n2) );

  elseif discriminante == 0
    leyenda = "Racies reales e iguales";
    r1 = (-n1 )/ (2 * n2);
    r2 = r1;
  else
    leyenda = "Raices imaginarias";
    parte_real= -n1/(2*n2);
    parte_imag= sqrt(-discriminante)/ (2*n2);
    r1 = parte_real + parte_imag*1i; %el 1i muestra como numero imaginario,
    r2 = parte_real - parte_imag*1i; %es decir el n° acompañado del i.
  endif %cierre del if-elseif-else
endfunction
