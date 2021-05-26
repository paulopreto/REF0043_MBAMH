% Aula 6 dia 26 de maio de 2021
% Criado por Paulo Santiago & Alunos da Turma de MBAMH 2021
% Curintia!
close all
clear all

% Carregando pacotes necessarios
pkg load image
pkg load io

% Carregando o arquivo de referência 3D real
ref3d = load('calibrador_ref.txt') ./ 1000;

% Carregando as imagens (calibrador e do chute)
calibrador_c1 = imread ('.\image_to_calibration\c1cal.png');
calibrador_c2 = imread ('.\image_to_calibration\c2cal.png');

% Plot das imagens dos calibradores
figure(1)
image(calibrador_c1)
title('Clique em 12 pontos de referência para a calibração')
daspect([1, 1, 1]) % Escala 1:1

% Capturando as coordedas em pixel do calibrador
[pixel_X_calibc1, pixel_Y_calibc1] = ginput(12);
calib_c1 = [pixel_X_calibc1, pixel_Y_calibc1];
close(1)

% Plot das imagens dos calibradores
figure(2)
image(calibrador_c2)
title('Clique em 12 pontos de referência para a calibração')
daspect([1, 1, 1]) % Escala 1:1

% Capturando as coordedas em pixel do calibrador
[pixel_X_calibc2, pixel_Y_calibc2] = ginput(12);
calib_c2 = [pixel_X_calibc2, pixel_Y_calibc2];
close(2)


