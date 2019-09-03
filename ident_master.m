para4nl; % gera os parametros dados pelo professor 
identif; % parametros dado pelo aluno
sim('liq4MA'); % experimento simuldado
inp = y1.signals.values(:,3);
out = y1.signals.values(:,2);
tam = length(inp);
data_ind = iddata(inp(1:floor(tam*0.7)),out(1:floor(tam*0.7)), 1); %falores de entrada e saída
data_val = iddata(inp(floor(tam*0.7):end),out(floor(tam*0.7):end), 1);
% Tirar a tendencia 
data_ind = detrend(data_ind);
data_val = detrend(data_val);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Indentificação Função de Transferência
np = 4;
nz = 1;
model_tf = tfest(data_ind,np,nz);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Identificação ARX
order_arx = [4 1 1];
model_arx = arx(data_ind,order_arx); 
%H = tf([model_arx.A],[model_arx.B],1);
%Hc = d2c(H,'tustin');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação ARX
order_armax = [4 4 1 1];
model_armax = armax(data_ind,order_armax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação Output-Error (EO)
order_eo = [4 4 1];
model_eo = oe(data_ind,order_eo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação Box-Jenkins (JB)
order_bj = [1 1 4 4 1];
model_bj = bj(data_ind,order_bj);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identificação State-Space (SS)
model_ss = ssest(data_ind,4,'Form','canonical');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
compare(data_val,model_tf, model_arx, model_armax, model_eo, model_bj, model_ss);