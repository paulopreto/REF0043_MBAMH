% Aula 8
% GRF_ANALISE.m
% Compara o sinal de plataforma de forca de dois sinais de corrida
% FFS.csv = Corrida de antepe (forefoot strike)
% RFS.csv = Corrida de retrope (rearfoot strike)
% 09/06/2021 - Prof. Paulo Santiago e alunos

pkg load io
close all

% constantes
fs = 1000; % frequencia de aquisicao do sinal
massa_sujeito = 84; % massa do sujeito em kg
acelgravidade = 9.80665; % aceleracao da gravidade


% lendo os arquivos
ffs = dlmread ('FFS.csv',',',7,0);
rfs = dlmread ('RFS.csv',',',7,0);

% definindo a forca vertical e invertendo o sinal 
% e normalizando pelo peso (body weigth)
ffs_fz = -1 * ffs(:, 5) / (massa_sujeito * acelgravidade);
rfs_fz = -1 * rfs(:, 5) / (massa_sujeito * acelgravidade);

% Encontrando os indices (linhas/rows) acima do valor zero
ffs_fz_apoio = find(ffs_fz > 0);
rfs_fz_apoio = find(rfs_fz > 0);

% Selecionando nos dados apenas os valores acima de zero - fase de suporte
ffs_fz_suportfase = ffs_fz(ffs_fz_apoio, :); 
rfs_fz_suportfase = rfs_fz(rfs_fz_apoio, :);

% fazendo os graficos de forca vertical total
subplot(1,2,1)
plot(ffs_fz)
ylabel('Force (Body weights)')
xlabel('Time (s)')
title('Forefoot strike - FFS')

subplot(1,2,2)
plot(rfs_fz)
ylabel('Force (Body weights)')
xlabel('Time (s)')
title('Rearfoot strike - RFS')


% fazendo os graficos de forca vertical apenas do tempo de contato no solo
figure
subplot(1,2,1)
% criando o vetor de tempo para o plot
vtempo_ffs = (0:length(ffs_fz_suportfase)-1) / fs; % vetor tempo
plot(vtempo_ffs, ffs_fz_suportfase)
ylabel('Force (Body weights)')
xlabel('Time (s)')
title('Forefoot strike - FFS')

subplot(1,2,2)
% criando o vetor de tempo para o plot
vtempo_rfs = (0:length(rfs_fz_suportfase)-1) / fs; % vetor tempo
plot(vtempo_rfs, rfs_fz_suportfase)
ylabel('Force (Body weights)')
xlabel('Time (s)')
title('Rearfoot strike - RFS')