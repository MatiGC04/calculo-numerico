
format long
addpath("G:/UNL 2025 CURSADO/Calculo_Numerico/Funciones")
n = 39;

A = zeros(n,n);

D1 = diag(2*ones(n,1));
D2 = diag(-1*ones(n-1,1),-1);
D3 = diag(-1*ones(n-1,1),1);

A = A + D1 + D2 + D3;

h = 1/40;

%arbo el vector b

b = zeros(n,1);

u0 = 5;
u1 = 6;

u = @(x) 20.*(h.^2).*exp(-10.*(x-0.7).^2);
x = linspace(0,1,41)';
x(20)
x_interior = x(2:end-1); %///como las condiciones u(0) y u(1) ya estan fijadas debo obtener las demas 39

%construyo b:
b = zeros(n,1);
for i=1 : n
  b(i) = u(x_interior(i));
endfor

b(1) = b(1) + u0;
b(39) = b(39) + u1;
############################
%forma alternativa de construir b
% b = 20*h^2 * exp(-10*(x_interior - 0.7).^2);
% Ajuste por condiciones de frontera:
% b(1) = b(1) + 5; % + u(0)
% b(end) = b(end) + 6; % + u(1)



%obtengo las iteraciones con gauss-seidel
tol = 1e-6;
x0 = zeros(n,1);
maxit = 1000000;
[x, r, it, t] = gauss_seidel(A, b, x0, maxit, tol);
it
mostrar_numero(x(20),6,'sig')
