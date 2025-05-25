%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNIVERSIDAD AUTONOMA DE OCCIDENTE
% DEPTO. DE ENERGETICA Y MECANICA
% MECANICA COPUTACIONAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prof. Enrique Franco G.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Error por redondeo y
% error por truncamiento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = 1;
dfe = exp(x);
h = 1.0;
k = 1;

while (h > 1e-17)
	dfa = (exp(x+h)-exp(x))/h;
	error(k) = abs(dfa-dfe);
	incr(k) = h;
	h = h/1.5;
	k = k+1;
end

plot(log(incr),error,'o-')
xlabel('log(\Delta{x})')
ylabel('|error|')
grid

