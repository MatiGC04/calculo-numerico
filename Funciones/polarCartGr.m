
function [x, y] = polarCartGr(r, t)
% Conversion de coordenadas polares a cartesianas,
% el angulo esta dado en grados.
  [x, y] = polarCart(r, t*pi/180)
endfunction
