%Ejercicio 5
addpath("G:/UNL 2025 CURSADO/Cálculo Numérico/Funciones");
b = [17.1 65.1 186.0 82.7 84.2 63.7 119.7 ]';
A = zeros(7,7);
A(1,:) = [16.87 ,0.1650 ,0.2019 ,0.3170 ,0.2340 ,0.1820 ,0.1100];
A(2,:) = [0.0,
 27.70,
 0.8620,
 0.0620,
 0.0730,
 0.1310,
 0.1200];

A(3,:) = [0.0,
 0.0,
 22.35,
 13.05,
 4.420,
 6.001,
 3.043];

A(4,:) = [0.0,
 0.0,
 0.0,
 11.28,
 0.0,
 1.110,
 0.3710];

A(5,:) = [0.0,
 0.0,
 0.0,
 0.0,
 9.850,
 1.1684,
 2.108];

A(6,:) = [0.0,
 0.0,
 0.0,
 0.0,
 0.2990,
 15.98,
 2.107];

A(7,:) = zeros(1,7);
A(7,7) = 4.670;

x = sust_atras(A,b)

display("Presion total (en μm) :")
total = sum(x)

display("Difrerencia con respecto a la precion de 38.78μm de Hg")
dif = total - 38.78


