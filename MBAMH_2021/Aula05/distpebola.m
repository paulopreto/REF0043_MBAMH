% Aula 5 dia 19 de maio de 2021
% Carregando pacotes necessarios
pkg load image
pkg load io
close all
clear all

% Carregando as imagens (calibrador e do chute)
calibrador = imread ('c2calibrador.png');
contatope = imread ('c2contatope.png');

% Plot da imagem do calibrador
figure(1)
image(calibrador)
title('Clique em dois pontos de referência para a calibração')
daspect([1, 1, 1]) % Escala 1:1

% Capturando as coordedas em pixel do calibrador
[pixel_X_calib, pixel_Y_calib] = ginput(2);
calib = [pixel_X_calib, pixel_Y_calib];
close(1)

vreal = input('Qual o valor da medida real dos dois pontos do calibrador?  ');
fator_calib = vreal / norm(calib(1,:) - calib(2,:));


figure(2)
% Plot da imagem do chute
image(contatope)
daspect([1, 1, 1])
title('Clique em dois pontos que deseja fazer a medida de distância entre eles')

% Capturando as coordedas em pixel do calibrador
[pixel_X_pebola, pixel_Y_pebola] = ginput(2);
distpe2bol_pixels = [pixel_X_pebola, pixel_Y_pebola];
close(2)

distancia_pe_bola = norm(distpe2bol_pixels(1,:) - distpe2bol_pixels(2,:)) * fator_calib;
disp(['A distância do pé de apoio para bola foi de: ', num2str(distancia_pe_bola), ' metros'])




