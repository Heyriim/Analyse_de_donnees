%TP4

%% Q1

T16 = [39 39 40 33 36 40 37 41 39 34 42 41 42 44 42 42 39 42 41 40 43 43 40 39 37];
TmoyMax = 37.5;

%L'echantillon est un petit echantillon de variance inconnue
% à 95%

aT = tinv(( 1 + 0.95) ./ 2, length(T16) -1);

% %Test de signification 37.5 est-il compris dans l'intervalle
% 
moy = mean(T16);
ecartType = std(T16);
% 
% borneBasS = moy - aT .*( ecartType ./ sqrt(length(T16) -1 ));
% borneHauteS = moy + aT .*( ecartType ./ sqrt(length(T16) -1 ));
% 
% ISignification = [borneBas borneHaute]

%Test de conformité est-ce que notre moyenne de 39.8° est exeptionnelle ? 
% Si oui elle sera dans compris dans l'intervalle

borneBasC = TmoyMax - aT .*( ecartType ./ sqrt(length(T16) -1 ));
borneHauteC = TmoyMax + aT .*( ecartType ./ sqrt(length(T16) -1 ));

IConforme = [borneBasC borneHauteC];

Test = ( TmoyMax >= borneBasC && TmoyMax <= borneBasC)

disp(['Nous avons l intervalle de conformité  ', '[',num2str(IConforme(1)), ',' num2str(IConforme(2)),']'])

if (Test == true )
    disp('Nous avons une annee exceptionnelle car H0 est rejete pour un  niveau de confiance de 95%.');
else
    disp('H0 est vérifiee avec un niveau de confiance de 95%. C est Une année normale !');
end


% La temperature est expetionnelle car nous ne sommes pas compris dans 
% l'intervalle de conformité. Donc l'echantillon est rejeté

%% Q2
load deerSample.mat % fichier contenant la matrice 

% Nous avons un petit echantillon de variances inconnues 

LenghtSample = 15;

aT2 = tinv(( 1 + 0.95) / 2, 2 * LenghtSample - 2 ); % at avec la somme des deux

MoyTimeInject = mean ( Sample1( :, 2) );
Moy30MinTimeInject = mean ( Sample1( :, 3) );

EcartTypeTimeInject = std ( Sample1( :, 2) );
Ecart30minTimeInject = std ( Sample1( :, 3) );

Calcul = aT2 .* sqrt( EcartTypeTimeInject ^2 ./ LenghtSample + Ecart30minTimeInject ^2 ./ LenghtSample );

Compa2E = abs(MoyTimeInject - Moy30MinTimeInject);

% if (Compa2E < Calcul)
%     disp ([num2str(Compa2E), ' < ', num2str(Calcul)])
%     disp ( 'la différence est très significative donc on rejette l hypothese que  le taux d androgen change apres 30 min après l injection')
% 
% else
%     disp('H0 est vérifiee avec un niveau de confiance de 95%. C est Une année normale !');
% end


% la différence est très significative donc on rejette l'hypothese que 
% le taux d'androgen change apres 30 min après l'injection

%% Q3 

% Grand echantillon de variance inconnue 
% Cas particulier v.a de Bernoulli car il y a une proportion de succes

n = 100 % 100 adults souffrant de tension nerveuse

psucces = 70 / n;

aT3 = norminv( ( 1 + 0.95) ./ 2, 0, 1 );

p1bar = 0.6;
p2bar = 0.7;

% on suppose que n1 = 0   
% Pbar = p2bar

part1 = abs(p1bar - p2bar);
part2 = aT3 * sqrt( ( p2bar *(1 - p2bar) ) /n );

if (part1 > part2)
    fprintf("The new drug is superior to the one commonly prescribed for 0.05 level of significance")
else 
    fprintf("The new drug is not superior to the one commonly prescribed for 0.05 level of significance")
end

