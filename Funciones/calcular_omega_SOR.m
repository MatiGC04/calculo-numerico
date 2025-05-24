function omega = calcular_omega_SOR(A)
    % Calcula el parámetro óptimo ω para el método SOR según el Teorema 7.26.
    %
    % Parámetros:
    % A -- matriz cuadrada
    %
    % Retorna:
    % omega -- valor óptimo de ω si A es definida positiva y tridiagonal
    %          [] si no cumple las condiciones

    % 1. Verificar que la matriz sea cuadrada
    [n, m] = size(A);
    if n != m
        disp("Error: La matriz no es cuadrada");
        omega = [];
        return;
    endif

    % 2. Verificar que sea tridiagonal
    es_tridiagonal = true;
    for i = 1:n
        for j = 1:n
            if abs(i - j) > 1 && A(i, j) != 0
                es_tridiagonal = false;
                break;
            endif
        endfor
        if !es_tridiagonal
            break;
        endif
    endfor

    if !es_tridiagonal
        disp("Error: La matriz no es tridiagonal");
        omega = [];
        return;
    endif

    % 3. Verificar que sea definida positiva
    % 3.1. Simétrica (necesaria para definida positiva)
    if !isequal(A, A')
        disp("Error: La matriz no es simétrica (requerido para definida positiva)");
        omega = [];
        return;
    endif

    % 3.2. Todos los autovalores positivos
    autovalores = eig(A);
    if any(autovalores <= 0)
        disp("Error: La matriz no es definida positiva (tiene autovalores no positivos)");
        omega = [];
        return;
    endif

    % Calcular ρ(T_j) - radio espectral de la matriz de Jacobi
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, 1);
    T_j = inv(D) * (L + U);
    rho_Tj = max(abs(eig(T_j)));

    % Calcular ω óptimo
    omega = 2 / (1 + sqrt(1 - rho_Tj^2));
endfunction

