function [P] = polinomiolagrange(x, y)
  % PolinomioLagrange: Calcula los coeficientes del polinomio interpolador de Lagrange
  % a partir de los vectores x (abscisas) e y (ordenadas).
  n = length(x);            % Número de puntos
  P = zeros(1, n);               % Polinomio interpolador final P(x), inicializado a 0

  for i = 1: n
    Li_num = [1];                % Numerador del polinomio base L_i(x)
    Li_denom = 1;                % Denominador del polinomio base L_i(x)

    for j = 1:n
      if j != i
        % L_i(x): multiplicamos por (x - x_j)
        Li_num = conv(Li_num, [1, -x(j)]);
        % Acumulamos el denominador (x_i - x_j)
        Li_denom = Li_denom * (x(i) - x(j));
      end
    end

    % L_i(x) = Li_num / Li_denom
    % y_i * L_i(x) = (y(i)/Li_denom) * Li_num

    Li_num = [Li_num, zeros(1, n - length(Li_num))];  % Asegura que Li_num tenga longitud n

    % Sumamos el término y_i * L_i(x) al polinomio total P(x)
    %P = P + (y(i) / Li_denom) * Li_num;
    P = P + [y(i) .* (Li_num ./ Li_denom)];

  end
end
