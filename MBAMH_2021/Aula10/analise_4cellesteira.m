% Limpando as variaveis e graficos
clear all
close all

% Valores conhecidos - constantes
mass_sujeito = 88.8; % kg ?????
mass_anilhas = 7.95; % kg
mass_sujeito_anilhas = 96.75; % kg

% Carregando os dados
esteira = load('esteira.csv');
esteira = -1 * esteira(:,2:end);

peso_sujeito = load('peso.csv');
peso_sujeito = -1 * peso_sujeito(6000:end,2:end);

anilhas = load('anilhas.csv');
anilhas = -1 * anilhas(:,2:end);

peso_anilhas = load('pesoeanilhas.csv');
peso_anilhas = -1 * peso_anilhas(6000:end,2:end);

%corrida1 = load('corrida12kmh.csv');
%corrida1 = -1 * corrida1(:,2:end);

%corrida2 = corrida2(:,2:end);
%corrida2 = -1 * load('multicorrida12kmh.csv');


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

%figure(2)
%subplot(2, 1, 1)
%plot(corrida1)
%title('Corrida 1')
%
%subplot(2, 1, 2)
%plot(corrida2)
%title('Corrida 2')


% tara = mean(esteira);
volts_anilhas = sum(mean(anilhas));
volts_pesoanilhas = sum(mean(peso_anilhas));


figure(3)
plot([volts_anilhas, volts_pesoanilhas], [mass_anilhas, mass_sujeito_anilhas], 'o', 'markersize', 10)
hold on
plot([volts_anilhas, volts_pesoanilhas], [mass_anilhas, mass_sujeito_anilhas], 'xr', 'markersize', 10)
plot([volts_anilhas, volts_pesoanilhas], [mass_anilhas, mass_sujeito_anilhas], 'g')
xlabel('Volts')
ylabel('kg')

%% Renomeando as variaveis para ficar mais facil a visualizacao na formula
xV1 = volts_anilhas;
xV2 = volts_pesoanilhas;
ykg1 = mass_anilhas;
ykg2 = mass_sujeito_anilhas;

%% Encontra a equacao da reta para dois pontos 
%p = polyfit([xV1, xV2], [ykg1, ykg2], 1)
%mr = p(1);
%br = p(2);

mr = (ykg2 - ykg1) / (xV2 - xV1); % coeficiente angular
br = -1 * (mr * xV1 - ykg1); % coeficiente linear

%% y = a.x + b
peso_sujeito_volts = sum(mean(peso_sujeito));
preto_kg = mr * peso_sujeito_volts + br;

disp(["O peso do Paulo Preto eh de ", num2str(preto_kg), " kg"])
