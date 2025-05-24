printf("\n");

n=2000;
a = randi([1,10],n,1);
b = randi([1,10],n,1);

id1 = tic();
suma = 0;
for i = 1:n
  for j = 1:i
    suma = suma + a(i)*b(j);
  endfor
endfor
printf("Suma sin factorizacion: ")
suma
tiempo1 = toc(id1);
tiempo1


printf("\n");

id2 = tic();
sum = 0;
sub_suma = 0;
for i = 1:n
  for j = 1:i
    sub_suma = sub_suma + b(j);
  endfor
  sum = sum + sub_suma*a(i);
  sub_suma=0;
endfor
printf("suma mediante factorizacion: ");
sum
tiempo2 = toc(id2);
tiempo2

printf("\n");
printf("Diferencia de tiempos: ");
tiempo1-tiempo2

