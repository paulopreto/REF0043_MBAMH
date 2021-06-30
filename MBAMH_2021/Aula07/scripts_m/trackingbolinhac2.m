function [autotrack] = trackingbolinhac2(thld)
% TRACKINGBOLINHA.m
% Aula 7 - dia 2 de junho de 2021
% Tracking de uma bolinha caindo em um sequencia de imagens png
% Criado por Paulo Santiago & Alunos da Turma de MBAMH 2021
% Update 2 de junho de 2021 - 

% evento de sincronizacao 
% c1 sinc frame = 3742
% c2 sinc frame = 3728
% c1 range frames [3735:3742]
% c2 range frames [3721:3728]

pkg load io
pkg load image

if nargin == 0; thld = 0.4;end

block = input('Deseja bloquear areas da imagem? [Y/n] ', 's');

if (block == "Y") || (block == "y")
    im0 = imread('../videos/c2_bolinha_png/c2_000003721.png');
    imshow(im0)
    title('First click UP-LEFT; Second click DOWN-RIGHT')
    [cols, lins] = ginput(2);
    cols = round(cols);
    lins = round(lins);
end

% frame1_c1 = imread('..\videos\c2_bolinha_png\c2_000003721.png');
% caso nao funcione veja de mudar o \ por /
  for i = 1:8
    j = i - 1 + 3721;
    frame1 = imread(['../videos/c2_bolinha_png/c2_00000',num2str(j),'.png']);
    
    if (block == "Y") || (block == "y")
        frame1bw = im2bw(frame1, thld);
        frame1bw = blockregion(frame1bw, cols, lins);
%        frame1bw(:, 1:cols(1)) = 0;
%        frame1bw(:, cols(2):end) = 0;
%        frame1bw(1:lins(1), cols(1):cols(2)) = 0;
%        frame1bw(lins(2):end, cols(1):cols(2)) = 0;
    else
        frame1bw = im2bw(frame1, thld); 
    end
   
    close all
%    figure(1)
    
    subplot(1,2,2)
    imshow(frame1bw)
    title(['Frame = ',num2str(j)])
%    [x,y]=ginput(1)
%    waitforbuttonpress()



%%%%%%%% Modo 1
    [y, x] = find(frame1bw > 0);
    coord_x_bolinha = median([max(x),min(x)]);
    coord_y_bolinha = median([max(y),min(y)]);

%%%%%%%%%    Modo 2 OU assim
%    coord_xy = imfindcircles(frame1bw, [1, 10]);
%    coord_x_bolinha = coord_xy(1);
%    coord_y_bolinha = coord_xy(2);


%%%%%%%%%% Modo 3 OU assim Isabella
%  bolinhastruct = regionprops (frame1bw, 'centroid');
%  bolcell = struct2cell(bolinhastruct);
%  bolinha = cell2mat(bolcell);
%  coord_x_bolinha = bolinha(:,1);
%  coord_y_bolinha = bolinha(:,2);

%    
    subplot(1,2,1)
    hold on
%    set(gcf, 'Position', get(0,'Screensize'));
    imshow(frame1)
    title(['Frame = ',num2str(j)])
    plot(coord_x_bolinha, coord_y_bolinha, 'y+', 'MarkerSize', 6)
    plot(coord_x_bolinha, coord_y_bolinha, 'yo', 'MarkerSize', 6)
    
    autotrack(i,:) = [coord_x_bolinha, coord_y_bolinha];
    nomes = ["c2_",num2str(i),".png"];
    
    saveas(1, nomes);
%    waitforbuttonpress()
    end
dlmwrite ("c2.dat", autotrack, ','); % salvar arquivo .dat de coordenada de tela
end