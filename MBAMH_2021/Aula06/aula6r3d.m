% Aula 6 dia 26 de maio de 2021
% Criado por Paulo Santiago & Alunos da Turma de MBAMH 2021

clc
close all
clear all

% Carregando pacotes necessarios
pkg load image
pkg load io

% Carregando o arquivo de referencia 3D real
ref3d = load('calibrador_ref.txt') ./ 1000;

res_calib = input("Deseja medir os pontos de calibracao das duas cameras?\n [Sim] digite 1\n [Nao] digite 0 \n  ");

if res_calib == 1
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
    dlmwrite ('.\image_to_calibration\c1_refpixel.txt', calib_c1, ',')
    close(1)

    % Plot das imagens dos calibradores
    figure(2)
    image(calibrador_c2)
    title('Clique em 12 pontos de referência para a calibração')
    daspect([1, 1, 1]) % Escala 1:1

    % Capturando as coordedas em pixel do calibrador
    [pixel_X_calibc2, pixel_Y_calibc2] = ginput(12);
    calib_c2 = [pixel_X_calibc2, pixel_Y_calibc2];
    dlmwrite ('.\image_to_calibration\c2_refpixel.txt', calib_c2, ',')
    close(2)
    disp('Arquivos de tela salvos!')
end

if res_calib == 0
    % Carregando os arquivos de coordenadas em pixels de tela do calibrador
    calib_c1 = load('.\image_to_calibration\c1_refpixel.txt');
    calib_c2 = load('.\image_to_calibration\c2_refpixel.txt');
    disp('Arquivos de tela carregados!')
end