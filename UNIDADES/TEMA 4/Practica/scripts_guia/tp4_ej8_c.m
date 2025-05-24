addpath('G:\UNL 2025 CURSADO\Calculo_Numerico\Funciones')
format long;

% Definición de la función y derivadas simbólicas
E = @(t) ((t + 1/3).^3 + 1/3).*exp(-t);
syms t;
E_sim = ((t + sym(1)/3)^3 + sym(1)/3)*exp(-t);
dE_sym = diff(E_sim, t);      % Primera derivada (E')
dE2_sym = diff(dE_sym, t);    % Segunda derivada (E'')
dE3_sym = diff(dE2_sym, t);   % Tercera derivada (E''') para verificar máximos

% Conversión a funciones numéricas
dE1 = matlabFunction(dE_sym);    % E'
dE2 = matlabFunction(dE2_sym);   % E''
dE3 = matlabFunction(dE3_sym);   % E'''

% Visualización de E'' para identificar raíces
figure(1)
t_vals = linspace(0, 5, 1000);
plot(t_vals, dE2(t_vals), 'LineWidth', 2);
hold on;
plot(t_vals, zeros(size(t_vals)), 'k-', 'LineWidth', 1);
grid on;
title('Segunda Derivada E''''(t)');
xlabel('t');
ylabel('E''''(t)');

% Parámetros comunes
tol = 1e-5;
kmax = 1000;

%% Método 1: Bisección para E''(t) = 0
display("--- Método de Bisección ---");
[t_bisec, ~, it_bisec] = biseccion(dE2, 0.5, 2.5, kmax, tol);
fprintf('Raíz encontrada en t = %.5f\n', t_bisec);
fprintf('Iteraciones: %d\n', it_bisec);
fprintf('Verificación E''''(t) = %.2e\n', dE2(t_bisec));

%% Método 2: Newton-Raphson para E''(t) = 0
display("\n--- Método de Newton ---");
[t_newton, ~, it_newton] = newton(dE2, dE3, 1.5, kmax, tol);
fprintf('Raíz encontrada en t = %.5f\n', t_newton);
fprintf('Iteraciones: %d\n', it_newton);
fprintf('Verificación E''''(t) = %.2e\n', dE2(t_newton));

%% Método 3: Secante para E''(t) = 0
display("\n--- Método de la Secante ---");
[t_sec, ~, it_sec] = secante(dE2, 1.0, 2.0, kmax, tol);
fprintf('Raíz encontrada en t = %.5f\n', t_sec);
fprintf('Iteraciones: %d\n', it_sec);
fprintf('Verificación E''''(t) = %.2e\n', dE2(t_sec));

%% Comparación de resultados y verificación del máximo
display("\n--- Resultados Finales ---");
t_results = [t_bisec; t_newton; t_sec];
iterations = [it_bisec; it_newton; it_sec];

% Verificar que sea un máximo (E'''(t) < 0)
for i = 1:length(t_results)
    fprintf('\nMétodo %d:\n', i);
    fprintf('t = %.5f\n', t_results(i));
    fprintf('E''''(t) = %.2e\n', dE2(t_results(i)));
    fprintf('E''''''(t) = %.2e → ', dE3(t_results(i)));

    if dE3(t_results(i)) < 0
        fprintf('Es un MÁXIMO de E''(t)\n');
    else
        fprintf('No es un máximo (revisar)\n');
    end
end

% Mostrar el mejor resultado
[~, idx] = min(abs(dE2(t_results)));
fprintf('\n--- Mejor solución encontrada ---\n');
fprintf('t = %.5f\n', t_results(idx));
fprintf('E(t) = %.5f\n', E(t_results(idx)));
fprintf('E''(t) = %.5f (Máxima tasa de crecimiento)\n', dE1(t_results(idx)));
fprintf('E''''(t) = %.2e\n', dE2(t_results(idx)));
fprintf('E''''''(t) = %.2e\n', dE3(t_results(idx)));
