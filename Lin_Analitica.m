function g = Lin_Analitica(qib,k12,k23,k34,k2,k4)
% Função de transferência linearizada do processo de nível 4a ordem
% em função da vazão de entrada e das constantes das válvulas.
%
% Tambem retorna: 
% 'Ponto de Operação'
% 'Constantes de tempo'
% 'Relação entre polo mais rápido/lento'


% @A.Bauchspiess LARA/ENE/UnB - 24/8/2016

%qib=20;k12=23;k23=23;k34=23;k4=2.5

%
k1=0;k3=0;

d=6;    % reservoirs depth
A1=d*9.9;  % cm2   - transversal section of the reservoirs
A2=d*10;  % cm2
A3=d*10;  % cm2
A4=d*10;  % cm2

M=k3+k34*k4/sqrt(k34^2+k4^2);
N=k2+k23*M/sqrt(k23^2+M^2);
P=k1+k12*N/sqrt(k12^2+N^2);

h1b=(qib/P)^2;
h2b=k12^2/(k12^2+N^2)*h1b;
h3b=k23^2/(k23^2+M^2)*h2b;
h4b=k34^2/(k34^2+k4^2)*h3b;

%s='Ponto de Operaçãoo'
%[h1b,h2b,h3b,h4b];  % Ponto de opera??o

a1=k12/(2*A1*sqrt(h1b-h2b));
a2=k23/(2*A2*sqrt(h2b-h3b));
a3=k34/(2*A3*sqrt(h3b-h4b));
b1=k1/(2*A1*sqrt(h1b));
b2=k2/(2*A2*sqrt(h2b));
b3=k3/(2*A3*sqrt(h3b));
b4=k4/(2*A4*sqrt(h4b));

p1=a1+b1;
p2=a1+a2+b2;
p3=a2+a3+b3;
p4=a3+b4;

% Coeficientes da equção caracter?stica linearizada
s0=p1*p2*p3*p4 - a1*a1*p3*p4-a2*a2*p1*p4-a3*a3*p1*p2+a1*a1*a3*a3;
s1=p1*p2*p3+p1*p2*p4+p1*p3*p4+p2*p3*p4-a1*a1*(p3+p4)-a2*a2*(p1+p4)-a3*a3*(p1+p2);
s2=p1*p2+p1*p3+p1*p4+p2*p3+p2*p4+p3*p4-a1*a1-a2*a2-a3*a3;
s3=p1+p2+p3+p4;

g=tf(a1*a2*a3/A1,[1 s3 s2 s1 s0])
r=roots([1 s3 s2 s1 s0])
analitico='Constantes de tempo',-1./r
str='Relação entre polo mais rápido/lento', min(r)/max(r)
