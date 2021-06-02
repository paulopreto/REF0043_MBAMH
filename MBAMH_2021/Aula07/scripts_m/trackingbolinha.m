function [autotrack] = trackingbolinha(thld)
pkg load io
pkg load image

if nargin == 0
    thld = 0.71;
end

  for i = 1:7
    frame1 = imread(['/home/preto/Documents/Disciplinas_2020/MACMH_MCACCE/Aula5/teste/teste0',num2str(i),'.png']);
    frame1bw = im2bw(frame1, thld);
    close all
%    figure(1)
    
    subplot(1,2,2)
    imshow(frame1bw)
    title(['Frame = ',num2str(i)])
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
    title(['Frame = ',num2str(i)])
    plot(coord_x_bolinha, coord_y_bolinha, 'y+', 'MarkerSize', 12)
    plot(coord_x_bolinha, coord_y_bolinha, 'yo', 'MarkerSize', 12)
    
    autotrack(i,:) = [coord_x_bolinha, coord_y_bolinha];
    nomes = [num2str(i),".png"];
    
    saveas(1, nomes);
%    waitforbuttonpress()
    end
end