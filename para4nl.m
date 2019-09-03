% Fourth order liquid level process
% LARA/ENE/UnB Brasilia - Brazil
 
% @Adolfo Bauchspiess - 25th August 2019

% Process Parameters
d=6;      % reservoirs depth
A1=d*9.9; % cm2   - transversal section of the reservoirs
A2=d*10;  % cm2
A3=d*10;  % cm2
A4=d*10;  % cm2

% Relacão entre o polo mais rapido/lento = 14.2287
k1=0; % cm^2.5/s  - sem conexão ao reservatório
k3=0;
k2=4.313;             % furo no tanque 2
k4=4.9667;           % furo no tanque 4
k12=9.0646;
k23=4.6461;
k34=5.2618;

% Relacaoo entre polo mais rapido/lento = 1.171,2
% situacao extrema - muito lento!!
k12=23;k23=23;k34=23;k2=0;k4=2.5;

% Parametros utilizados em ISD - 2019/2
% Valor de k4 de acordo com o último dígito da matrícula
k12=10;k23=10;k34=10;k2=2;
k4 = 3;

NivRuido = 1;              % Multiplicador
vrm  = 0.001*NivRuido;      % ruido de medida
vrh1 = 0.001*NivRuido;      % ruido em h1
vrh2 = 0.0005*NivRuido;     % ruido em h2
vrh3 = 0.0003*NivRuido;     % ruido em h3
vrh4 = 0.0002*NivRuido;     % ruido em h4

%@AB - 13 Ago 2016 - ISD
hmax=50;  % reservoirs heigth
hmin=0;
qmax=120;
qmin=-120;


