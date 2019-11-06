%TP5

%% Q1 a

nbSatellite = 1 :1  :9;
nbObservations = [6 15 9 25  17 10 8 7 3];

effectif =  sum(nbObservations);

esperance = sum(nbObservations .* nbSatellite) / effectif;

variance = sum(nbObservations .* nbSatellite.^2) / effectif - esperance .^2;

%% Q1 b

%loi de poisson de paramètre poisspdf 

lambda = 4.47; 
TheorieSatellite = 0 : 1 : 16;

EffectifLoiPoissTheorique = poisspdf(TheorieSatellite, lambda) * effectif
EffectifTotalTheorique = sum(EffectifLoiPoissTheorique)

%% Q1 c

% npi doit etre superieur a 5. On additionne donc les colonnes pour obtenir
% 5

MatTheorique = [ sum(EffectifLoiPoissTheorique(1, 1:2)) EffectifLoiPoissTheorique(1, 3:8 ) sum( EffectifLoiPoissTheorique( 1,9:17))] % npi
MatReel = [ nbObservations(1, 1:7 )   sum(nbObservations(1 , 8:9))] % ni 


Chi2Calcule = sum( ( MatReel - MatTheorique).^2 ./ MatTheorique )

r = 8;                              % nombre de classe ici 8 colonnes
k = 1;                              % parametre a estimer 
alpha = 0.95;

Chi2Theorique = chi2inv(alpha , r-k-1)

if (Chi2Theorique > Chi2Calcule)
    " l'hypothese n'est pas rejetée. Ce n'est donc pas significatif donc cela peut être une loi de poisson. " 
else 
    " l'hypothese est rejetée on ne peut pas admettre que c'est une loi de poisson."
end

%% Q2 

Tab =  1;
