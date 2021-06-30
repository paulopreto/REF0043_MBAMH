%% Area da mao em pixel
pkg load image

img = imread('mao_blur.png');

close all

figure
subplot(1,2,1)
imshow(img)

imgbw = im2bw(img, 0.35);
subplot(1,2,2)
imshow(imgbw)

quantidade_um = sum(sum(imgbw));

fator_calibracao = 1

areamao = fator_calibracao * quantidade_um
