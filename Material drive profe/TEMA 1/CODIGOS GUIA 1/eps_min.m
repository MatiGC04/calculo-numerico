% CALCULO DEL EPSILON MINIMO DE LA MAQUINA
function [emin] = eps_min()
x = 1.0;
while (1 > 0)
    emin = x;
    x = x/2;
    if (x ==0)
        break
    end
end

    