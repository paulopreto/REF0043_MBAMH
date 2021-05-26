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
    title('Clique em 12 pontos de referencia para a calibracao')
    daspect([1, 1, 1]) % Escala 1:1

    % Capturando as coordedas em pixel do calibrador
    [pixel_X_calibc1, pixel_Y_calibc1] = ginput(12);
    calib_c1 = [pixel_X_calibc1, pixel_Y_calibc1];
    dlmwrite ('.\image_to_calibration\c1_refpixel.txt', calib_c1, ',')
    close(1)

    % Plot das imagens dos calibradores
    figure(2)
    image(calibrador_c2)
    title('Clique em 12 pontos de referencia para a calibracao')
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


res_medchute = input("Deseja medir os pontos anatomicos?\n [Sim] digite 1\n [Nao] digite 0 \n  ");

if res_medchute == 1
    % Carregar a imagem do chute para medida dos pontos anatomicos de interesse
    chute_c1 = imread ('.\image_chute_to_rec3D\cam1\c1_043.png');
    chute_c2 = imread ('.\image_chute_to_rec3D\cam2\c2_039.png');

    figure(3)
    image(chute_c1)
    title('Clique em 5 pontos anatomicos')
    daspect([1, 1, 1]) % Escala 1:1
    [pixel_X_chutec1, pixel_Y_chutec1] = ginput(5);
    c1_chute = [pixel_X_chutec1, pixel_Y_chutec1];
    dlmwrite ('.\image_chute_to_rec3D\c1_043.txt', c1_chute, ',')
    close(3)

    figure(4)
    image(chute_c2)
    title('Clique em 5 pontos anatomicos')
    daspect([1, 1, 1]) % Escala 1:1
    [pixel_X_chutec2, pixel_Y_chutec2] = ginput(5);
    c2_chute = [pixel_X_chutec2, pixel_Y_chutec2];
    dlmwrite ('.\image_chute_to_rec3D\c2_039.txt', c2_chute, ',')
    close(4)
    disp('Arquivos de tela do chute salvos!')
end

if res_medchute == 0
    c1_chute = load('.\image_chute_to_rec3D\c1_043.txt');
    c2_chute = load('.\image_chute_to_rec3D\c2_039.txt');
    disp('Arquivos de chute carregados com sucesso!')
end

% Criar o DLT para calibracao de cada cameras
c1_dlt = DLT_calibration(ref3d, calib_c1);
c2_dlt = DLT_calibration(ref3d, calib_c2);

dlmwrite ('.\image_to_calibration\c1_dlt.ref', c1_dlt, ',');
dlmwrite ('.\image_to_calibration\c2_dlt.ref', c2_dlt, ',');

disp('Arquivos de DLT calibration salvos no diretorio de image_to_calibration!')


% Reconstruir em 3D o calibrador
DLTs = [c1_dlt ; c2_dlt];

nlin = size(calib_c1, 1);

for i = 1:nlin
    cc2d = [calib_c1(i,:) ; calib_c2(i,:)];
    cc3d_calibrador(i, :) = rec3d(DLTs, cc2d)';
end
disp(' ')
disp(cc3d_calibrador)

disp(' ')
materror = ref3d - cc3d_calibrador

