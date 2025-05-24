function [r1,r2] = bashkara(x)
  discriminante = x(2)^2-4*x(1)*x(3);
  r1 = (-x(2)+sqrt(x(2)^2-4*x(1)*x(3)))/(2*x(1));
  r2 = (-x(2)-sqrt(x(2)^2-4*x(1)*x(3)))/(2*x(1));
  if(discriminante<0)
    printf("El polinomio tiene raices complejas \n");
  else
    printf("El polinomio tiene raices reales \n");
  endif
endfunction
