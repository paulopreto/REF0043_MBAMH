% Definindo as variaveis constantes
% esteira = ?
anilhas =  7.9500;
eu =  88.800;
eu_anilhas =  96.750;

% Carregando os dados de volts da coleta na esteira
esteiravolt = load('esteira.csv');
esteiravolt = -1 * esteiravolt(:,2:end);
m_esteiravolt = mean(esteiravolt);
ms_esteiravolt = sum(m_esteiravolt)


anilhasvolt = load('anilhas.csv');
anilhasvolt = (-1 * anilhasvolt(:,2:end)) - m_esteiravolt;
m_anilhasvolt = mean(anilhasvolt);
ms_anilhasvolt = sum(m_anilhasvolt)

euvolt = load('peso.csv');
euvolt = (-1 * euvolt(6000:end,2:end)) - m_esteiravolt;
m_euvolt = mean(euvolt);
ms_euvolt = sum(m_euvolt)


eu_e_anilhasvolt = load('pesoeanilhas.csv');
eu_e_anilhasvolt = (-1 * eu_e_anilhasvolt(6000:end,2:end)) - m_esteiravolt;
m_eu_e_anilhasvolt = mean(eu_e_anilhasvolt);
ms_eu_e_anilhasvolt = sum(m_eu_e_anilhasvolt)

% Fazendo os graficos para visualizacao da reta de regressao para calibracao
close all 
plot(ms_anilhasvolt, anilhas, 'ro', 'MarkerSize', 15)
hold on
grid on
title('Reta de calibracao esteira Load cell')
xlabel('Tensao em Volts')
ylabel('Forca peso em kg')
plot(ms_euvolt, eu, 'ko', 'MarkerSize', 15)
plot(ms_eu_e_anilhasvolt, eu_anilhas, 'bo', 'MarkerSize', 15)

%plot([ms_anilhasvolt, ms_eu_e_anilhasvolt], [anilhas, eu_anilhas], 'g-') % Fazendo uma linha do inicio para o fim


% Juntando as variaveis X e Y para realizar a regressao linear com a funcao polyfit.m
x = [ms_anilhasvolt, ms_euvolt, ms_eu_e_anilhasvolt];
y = [anilhas, eu, eu_anilhas];
p = polyfit (x, y, 1);

% Equacao da reta eh: Y = a * X + b
disp(' ')
a = p(1)
b = p(2)
disp(' ')
disp(['Y = ',num2str(a),' * X + ',num2str(b)])

y0 = a * 0 + b;
y1 = a * 1 + b;

plot([0, 1], [y0, y1], 'g-') 
text(0.5 , y1-0.5, ['Y = ',num2str(a),' * X + ',num2str(b)])

pesoesteira = a * ms_esteiravolt + b;
disp('')
disp(['O peso da esteira eh: ', num2str(pesoesteira),' kg'])


