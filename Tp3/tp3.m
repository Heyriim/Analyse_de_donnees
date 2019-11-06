%TP3

%% Question 1

sample = [0.82 0.87 0.77 0.96 0.75 0.83 0.87 0.81];    

% petit échantillon gaussien, variance inconnue
% Attention sous matlab alph= 0.95 le taux de confiance tandis que dans le
% cours alpha = 0.05 le seuil

% utilisation du theoreme de la limite centrale 

ecartTypeSample = std(sample);
MoyenneSample = mean(sample);
aT = tinv((1+0.95)/2,length(sample)-1); % détermine les bornes de confiance on a erf(aT)=1-alpha/2 donc pour obtenir at on utilise l'inverse du tableau

% on a un degré de liberté de n-1 

borneBas = MoyenneSample - aT*(ecartTypeSample/sqrt(length(sample)-1));
borneHaute = MoyenneSample + aT*(ecartTypeSample/sqrt(length(sample)-1));

IQ1 = [borneBas borneHaute]

%% Question 2

sample2 = [0.84 0.87 0.89 0.73 0.84 0.81 0.88 0.85 0.89 0.79 0.79 0.90 0.59 0.75 0.67 0.76 0.86 0.88 0.70 0.75 0.81 0.77 0.83 0.84 0.71 0.78 0.59 0.91 0.74 0.68 0.77 0.66 0.80 0.74 1.02 0.91 0.55 0.84 0.66 0.77];

% ici nous avons un grand echantillon car n>30 

ecartTypeSample2 = std(sample2);
MoyenneSample2 = mean(sample2);

aT2 = norminv((1+0.95)/2,0,1);

%ici on prend norminv car grand echantillon

borneBas2 = MoyenneSample2 - aT2*(ecartTypeSample2/sqrt(length(sample2)));
borneHaute2 = MoyenneSample2 + aT2*(ecartTypeSample2/sqrt(length(sample2)));

IQ2 = [borneBas2 borneHaute2]

%% Question 3

n = 1000

% Intervalle de confiance à 95%

aTQ395 = tinv((1+0.95)/2,n) % TD on a 1.96 

% Pour Dupond

PempDupond = 500/1000;
bBdup = PempDupond -  aTQ395 * ( sqrt(PempDupond*(1-PempDupond)) / sqrt(n));
bHdup = PempDupond + aTQ395 * ( sqrt(PempDupond*(1-PempDupond)) / sqrt(n));
IDupond = [bBdup bHdup]             % attendu I=[0.469 0.531]

% Pour Durand

PemDurand = 250/1000;

bBdurand = PemDurand -  aTQ395 * ( sqrt(PemDurand*(1-PemDurand)) / sqrt(n));
bHdurand = PemDurand +  aTQ395 * ( sqrt(PemDurand*(1-PemDurand)) / sqrt(n));
IDurand = [bBdurand bHdurand]       % attendu I=[0.223 0.277]

% Pour Duroc

PempDuroc = 50/1000;
bBduroc = PempDuroc -  aTQ395 * ( sqrt(PempDuroc*(1-PempDuroc)) / sqrt(n));
bHduroc = PempDuroc +  aTQ395 * ( sqrt(PempDuroc*(1-PempDuroc)) / sqrt(n));
IDuroc = [bBduroc bHduroc]          % attendu I=[0.036 0.064]

% Intervalle de confiance à 99%

aTQ399 = tinv((1+0.99)/2,n) % TD on a 2.58 

% Pour Dupond

bBdup99 = PempDupond - aTQ399 * ( sqrt(PempDupond*(1-PempDupond)) / sqrt(n-1));
bHdup99 = PempDupond + aTQ399 * ( sqrt(PempDupond*(1-PempDupond)) / sqrt(n-1));
IDupond99 = [bBdup99 bHdup99]             

% Pour Durand

bBdurand99 = PemDurand -  aTQ399 * ( sqrt(PemDurand*(1-PemDurand)) / sqrt(n));
bHdurand99 = PemDurand +  aTQ399 * ( sqrt(PemDurand*(1-PemDurand)) / sqrt(n));
IDurand99 = [bBdurand99 bHdurand99]      

% Pour Duroc

bBduroc99 = PempDuroc -  aTQ399 * ( sqrt(PempDuroc*(1-PempDuroc)) / sqrt(n));
bHduroc99 = PempDuroc +  aTQ399 * ( sqrt(PempDuroc*(1-PempDuroc)) / sqrt(n));
IDuroc99 = [bBduroc99 bHduroc99]         


%%  Question 4

% Pour Duval avec 17%

PempDuval=0.17

% Intervalle de confiance à 95%

% on reprend la valeur aTQ395 = 1.96 
% précision de 0.01 d'après le td n = 5420

precision = 0.01

newN =( aTQ395 / precision * sqrt(PempDuval * (1-PempDuval)))^2;
nTd = (1.96 * ((sqrt(PempDuval*(1-PempDuval)))/(precision)))^2;


disp (['Dans le TD n = ' num2str(nTd)]) 
disp (['Ici n = ' num2str(newN)])  %normal car pas le même at




