function [c] = dif_div(x, y)
% DIF_DIV: Calcula la tabla de diferencias divididas
for i = 1:length(x)
    for j = 2:i
    c(i,j) = (c(i,j-1) - c(i-1, j-1))./ (x(i) - x(i-j));
    end
end
c = diag(c);
endfunction