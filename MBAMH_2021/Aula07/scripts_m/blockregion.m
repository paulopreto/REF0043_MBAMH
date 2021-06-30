%% Copyright (C) 2021 preto
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <https://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @deftypefn {} {@var{retval} =} blockregion (@var{input1}, @var{input2})
%%
%% @seealso{}
%% @end deftypefn

%% Author: preto <preto@DESKTOP-3A3RKGL>
%% Created: 2021-06-30

function imblock = blockregion (im, cols, lins)

    im(:, 1:cols(1)) = 0;
    im(:, cols(2):end) = 0;
    im(1:lins(1), cols(1):cols(2)) = 0;
    im(lins(2):end, cols(1):cols(2)) = 0;
    imblock = im;

end
