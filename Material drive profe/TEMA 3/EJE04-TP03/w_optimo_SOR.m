% Calculo del w optimo para el metodo SOR
function [w] = w_optimo_SOR(A)
M = diag(diag(A));
G = diag(ones(length(A),1))-inv(M)*A;
w = 2 / (1 + sqrt(1 - (max(eig(G)))^2));

end %function