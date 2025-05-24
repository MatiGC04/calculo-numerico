%Ejercicio 7 guia 2
N=10;
tic()
%Definir las diagonales
unos=ones(N,1);
col=[-1*unos 2*unos -1*unos];
%Definir desplazamientos
offsets=[-1, 0, 1]; %indica la pos de la diag inf, principal,sup

%Construir la matriz tridagonal usando spdiags
A= spdiags(col, [-1 0 1],N,N)
A(1,1) = 1;
A(1,2) = 0;
A(N,N)=1;
A(N,N-1)=1;

%contruimos la matriz b
b = (1./(N.^2))*ones(N,1);
b(1)=0;
b(N)=0;
%Construir la matriz dispersa en matriz compelta
A= full(A); %COMANDO FULL completa la matriz
R=gauss1(A,b);
b = R(:,end);
R = R(:,1:end-1);
x=sust_atras(R,b);
x(1)=0;
x(N) =0;

%Mostramos los datos
ejex= linspace(0,1,N);
plot(ejex,x,'-r');
xlabel('eje x');
ylabel('Solucion y');

spy(A,'*r');
display('El tiempo de ejecucion total es de:');
t=toc()
