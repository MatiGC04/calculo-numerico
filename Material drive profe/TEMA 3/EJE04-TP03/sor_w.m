% sor_w.m
A=[ 10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5]
b=[6 25 -11 -11]'
x0=[ 0 0 0 0]'

tol = 10E-5;
maxit = 1000;

# SOR
 % w = [1.0:0.01:1.3];
 w=linspace(1,1.3,30);
 it_SOR = [];
 for j = 1:length(w)
 [x, rh, it_SOR(j), t] =sor(A, b, x0, maxit, tol, w(j));
 endfor

 z=[w' it_SOR'];
 [pmin,p]= min(it_SOR)
 w(p)

 plot(w,it_SOR)

 grid on;
 grid minor;
