## Copyright (C) 2025 Estudiante
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} doolittle (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Estudiante <Estudiante@LAB2M03>
## Created: 2025-04-07

function[L,U] = doolittle (A)
  n = length(A(:,end);
  for i = 1:1:n
    A(k+1:n, k) = A(k+1:n)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n, k+1:n) - A(k+1:n,k)*A(k,k+1:n);
  endfor

  L = eye(n)+tril(A,-1);
  U = triu(A);
endfunction
