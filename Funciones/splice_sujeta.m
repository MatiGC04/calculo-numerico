function S = splice_sujeta(x,f,dy0,dyN)
    addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
    [a,b,c,d] = cubic_spline_clamped(x,f,dy0,dyN);

    % matriz de coeficientes
    xi = x;
    S = @(x) a(1)*(x==xi(1));
    for i=1:length(xi)-1
        S = @(x) S(x) + polyval([d(i) c(i) b(i) a(i)], (x - xi(i))).*(x>xi(i)).*(x<=xi(i+1));
    endfor

endfunction