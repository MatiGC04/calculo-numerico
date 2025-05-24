function mostrar_numero(valor, T, tipo)
    % tipo = 'sig' (cifras significativas)
    %      o 'dec' (decimales exactos)
    if strcmp(tipo, 'sig')
        fprintf('%.*g\n', T, valor);  % MATLAB usa fprintf
    elseif strcmp(tipo, 'dec')
        fprintf('%.*f\n', T, valor);
    else
        fprintf('Tipo no válido. Usa ''sig'' o ''dec''\n');
    end
endfunction
