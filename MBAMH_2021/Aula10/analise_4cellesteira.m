% Limpando as variaveis e graficos
clear all
close all

% Valores conhecidos - constantes
mass_sujeito = 88.8; % kg ?????
mass_anilhas = 7.95; % kg
mass_sujeito_anilhas = 96.75; % kg

% Carregando os dados
esteira = load('esteira.csv');
esteira = esteira(:,2:end);

peso_sujeito = load('peso.csv');
peso_sujeito = peso_sujeito(6000:end,2:end);

anilhas = load('anilhas.csv');
anilhas = anilhas(:,2:end);

peso_anilhas = load('pesoeanilhas.csv');
peso_anilhas = peso_anilhas(6000:end,:);

corrida1 = load('corrida12kmh.csv');
corrida1 = corrida1(:,2:end);

corrida2 = load('multicorrida12kmh.csv');
corrida2 = corrida2(:,2:end);


% Mostrar o grafico dos sinais
figure(1)
subplot(2, 2, 1)
plot(esteira(:,2:end))
title('Esteira')

subplot(2, 2, 2)
plot(peso_sujeito(:,2:end))
title('Peso Sujeito')

subplot(2, 2, 3)
plot(anilhas(:,2:end))
title('Anilhas')

subplot(2, 2, 4)
plot(peso_anilhas(:,2:end))
title('Anilhas + Peso do Sujeito')

figure(2)
subplot(2, 1, 1)
plot(corrida1)
title('Corrida 1')

subplot(2, 1, 2)
plot(corrida2)
title('Corrida 2')


volts_anilhas = sum(mean(anilhas));
volts_pesoanilhas = sum(mean(peso_anilhas));

