function  x = ident_master()

tic();
Len = 100000; % Tanhos da omostra
PO = 12; % Ponto de operação do sistema 15 25 % Dúvida sobre o ponto de operção
Amp = 1; % Amplitudo da anda de entrada 
NivRuido = 0; 
M = 1; % tempo de amostragem 
uid = idinput(Len,'prbs',[0 0.001],[-1 1]); % Sinal pseudo randômico de entrda  
%clc;
tid = (0:M:Len*M)'; % ventor de tempo(malfeitasso)
tid = tid(1:end-1); % Gabiarra
% Perguntar p o profewssor como tem que ser o sinal de tempo
% taxa de amostragem diminui a precisão do modelo em relação ou ground
% truth
para4nl; % gera os parametros dados pelo professor 
sim('liq4MA'); % experimento simuldado
inp = y1.signals.values(:,3);
g = Lin_Analitica(PO,k12,k23,k34,k2,k4);
out = y1.signals.values(:,2);
tam = length(inp);
vet = (0:M:Len*M);
%vet = vet(1:end-1);
tam1 = length(vet);
ent = idout.signals.values(:,1);
sysL = lsim(g, idout.signals.values(:,1),vet);
model_lin = iddata(sysL(floor(tam1*0.7):end),ent(floor(tam1*0.7):end), 1);
data_id = iddata(inp(1:floor(tam*0.7)),out(1:floor(tam*0.7)), 1); %falores de entrada e saída
data_val = iddata(inp(floor(tam*0.7):end),out(floor(tam*0.7):end), 1);
% Tirar a tendencia 
model_lin = detrend(model_lin);
data_id = detrend(data_id);
data_val = detrend(data_val);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Indentificação Função de Transferência
np = 4;
nz = 1;
model_tf = tfest(data_id,np);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Identificação ARX
order_arx = [4 1 1];
model_arx = arx(data_id,order_arx); 
%H = tf([model_arx.A],[model_arx.B],1);
%Hc = d2c(H,'tustin');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação ARX
order_armax = [4 4 1 1];
model_armax = armax(data_id,order_armax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação Output-Error (EO)
order_oe = [4 4 1];
model_oe = oe(data_id,order_oe);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação Box-Jenkins (JB)
order_bj = [1 1 4 4 1];
model_bj = bj(data_id,order_bj);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%g
%Identificação State-Space (SS)
model_ss = ssest(data_id,4,'Form','canonical');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%subplot(2,1,1);
[YH, FIT, X0] = compare(model_lin,model_tf, model_arx, model_armax, model_oe, model_bj,model_ss);
x = FIT;
mat = cell2mat(FIT);

%subplot(2,1,2);
%compare(data_val,model_tf, model_arx, model_armax, model_oe, model_bj,model_ss);
toc();
end
% camvam fisico transporte digital
