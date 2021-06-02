function [autotrack] = trackingbolinha(thld)
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

if nargin == 0
    thld = 0.71;
end

% frame1_c1 = imread('..\videos\c1_bolinha_png\c1_000003735.png');
  for i = 1:8
    j = i - 1 + 3735;
    frame1 = imread(['..\videos\c1_bolinha_png\c1_00000',num2str(j),'.png']);
    frame1bw = im2bw(frame1, thld);
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
    nomes = [num2str(i),".png"];
    
    saveas(1, nomes);
%    waitforbuttonpress()
    end
dlmwrite ("c1.dat", autotrack, ','); % salvar arquivo .dat de coordenada de tela
end