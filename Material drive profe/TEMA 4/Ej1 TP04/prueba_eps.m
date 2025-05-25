% prueba del eps en el denominador:
% prueba_eps.m
disp('Valor del eps')
disp(eps)
disp('===========================================')
disp('Con valor de p chico: no influye el eps')
p=1e-8;
pn=1.1e-8;
Erel_sin_eps = abs(p - pn) / abs(p)
Erel_con_eps = abs(p - pn) / (abs(p) + eps)
disp('===========================================')
disp('Con valor de p cero')
p1=0;
p1n=1e-12;
Erel_sin_eps = abs(p1 - p1n) / abs(p1)
Erel_con_eps = abs(p1 - p1n) / (abs(p1) + eps)
