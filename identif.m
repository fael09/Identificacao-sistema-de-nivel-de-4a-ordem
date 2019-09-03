% Script de entrada de dados 
Len = 10000000; % Tanhos da omostra
PO = 15; % Ponto de operação do sistema 15 25 % Dúvida sobre o ponto de operção
Amp = 10; % Amplitudo da anda de entrada 
cont = 1;
M = 5; % tempo de amostragem 
uid = idinput(Len,'prbs',[0 0.000015],[-1 1]); % Sinal pseudo randômico de entrda  
tid = (0:1:Len)'; % ventor de tempo(malfeitasso)
tid = tid(1:end-1); % Gabiarra
% Perguntar p o profewssor como tem que ser o sinal de tempo

