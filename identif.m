% Script de entrada de dados 
Len = 100000; % Tanhos da omostra
PO = 10; % Ponto de operação do sistema 15 25 % Dúvida sobre o ponto de operção
Amp = 0.5; % Amplitudo da anda de entrada 
NivRuido = 0;  
M = 2; % tempo de amostragem 
uid = idinput(Len,'prbs',[0 0.001],[-1 1]); % Sinal pseudo randômico de entrda  
tid = (0:1:Len)'; % ventor de tempo(malfeitasso)
tid = tid(1:end-1); % Gabiarra
% Perguntar p o profewssor como tem que ser o sinal de tempo

