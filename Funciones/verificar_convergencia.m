function verificar_convergencia(T)
    % Verifica si el método iterativo con matriz T converge
    % según el criterio del radio espectral

    % Calcular autovalores
    autovalores = eig(T);

    % Calcular radio espectral
    radio = max(abs(autovalores));

    % Mostrar resultados
    printf('📈 Radio espectral: %.6f\n', radio);

    if radio < 1
        disp('✅ El método iterativo CONVERGE (radio espectral < 1).');
    else
        disp('❌ El método iterativo NO CONVERGE (radio espectral >= 1).');
    end
end

