## Copyright (C) 2021 paulo
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
## @deftypefn {} {@var{retval} =} loademg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: paulo <paulo@DESKTOP-08T54RA>
## Created: 2021-07-14

function retval = loademg ()
  pkg load io
  emg = dlmread ("tab_emg.csv");
  musc1 = emg(:,1);
  plot(musc1)
  pause(5)
  disp("Deu tudo certo! Vai ser feliz")

end
