function S = splice_natural(x,f)
    addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
    [a, b, c, d] = cubic_spline_natural(x, f);
    n = length(a);
    xi = x;
    M = [d c b a];
    S = @(x) a(1)*(x == xi (1));
    % Forma anterior:
    % for i=1:n
    %  S = @(x) S(x) + ...
    %  polyval(M(i,:), (x - xi(i))).*(x>xi(i)).*(x<=xi(i+1));
    % end

    % Nueva forma:
    for i=1:n
    S = @(x) S(x) + polyval([d(i) c(i) b(i) a(i)], (x - xi(i))).*(x>xi(i)).*(x<=xi(i+1));
    end


endfunction
