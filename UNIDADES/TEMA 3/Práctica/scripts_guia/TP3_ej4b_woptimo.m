%EJERCICIO 4 B)
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones');

%Recordar!!!!!!
% T_j = D^(-1)*(L + U)   % Matriz iteración Jacobi
% T_s = (D - L)^(-1)*U   % Matriz iteración Gauss-Seidel
% donde: D=diag(diag(A)), L=tril(A,-1), U=triu(A,1)
addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones');
A = [10,5,0,0;
      5,10,-4,0;
      0,-4,7,-1;
      0,0,-1,5];
b = [6 25 -11 -11]';

x0 = zeros (size(b));
maxit = 100;
tol = 1e-7;

% 2. Estimación del ω óptimo para SOR
% ya que al ser A una matris simetrica y tridiagonal
% podemos obtener el w optimo
% Calculamos el radio espectral de la matriz de iteración de Jacobi
Ds = diag(diag(A));
Ls = tril(A, -1);
Us = triu(A, 1);

Tj = -inv(Ds)*(Ls + Us);  % Matriz de iteración de Jacobi
r_Tj = max(abs(eig(Tj)));  % Radio espectral p(Tj);

w = 2./(1 + sqrt(1 - r_Tj.^2));
display('El parámetro ω óptimo estimado es:');
%fprintf('El valor es: %.4f\n', w);
w

[x,it,r_h,t]=sor(A,b,x0,maxit,tol,w)





