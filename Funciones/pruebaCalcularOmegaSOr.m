
% Ejemplo de uso
A = [2, -1, 0;
     -1, 2, -1;
     0, -1, 2];

omega = calcular_omega_SOR(A);
if !isempty(omega)
    printf("El parámetro óptimo ω es: %.4f\n", omega);
    printf("ρ(T_ω) sería: %.4f\n", omega - 1);
endif
