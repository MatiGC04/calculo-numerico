A = ones(500,1);
B = 2*ones(500,1);
n = length(A(1,:));
suma= 0;
tic

for i=1:n
for j=1:i
suma = suma + A(i,1)*B(j,1);
end
end
suma
toc