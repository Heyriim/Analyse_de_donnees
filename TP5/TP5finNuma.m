%**************************************************************************
%******************************* TP 5 *************************************
%**************************************************************************

%% Question 1
clear
n_sat = [1:9];
n_obs = [6 15 9 25 17 10 8 7 3];

% 1.a
esp = sum(n_obs .* n_sat) ./ sum(n_obs)

% my_var1 = sum(n_obs .* n_sat.^2) / sum(n_obs) - esp^2
my_var = var(n_sat, n_obs)

% 1.b
%Je calcule les probabilités d'une loi de poisson de parametre lambda =4.47 
%pour un tableau de valeurs théoriques comprises de 0 à 16 (poisspdf). 
%puis je multiplie par sum(n_obs) pour pouvoir comparer ces probabilités à
%l'échantillon empirique.

n_sat_t = [0:16];
n_obs_t = poisspdf(n_sat_t, 4.47) * sum(n_obs)
EffectifTotalTheorique = sum(n_obs_t)           %environ 100 

% 1.c

% npi doit être superieur à 5. On additionne donc les colonnes pour obtenir
% 5 dans chacune d'entre elles. Attention on commence par la fin puis on va
% vers le début. POur savoir quelle colonne ajouter on se base sur la matrice
% théorique  

MatTheorique = [ sum(n_obs_t(1, 1:2)) n_obs_t(1, 3:8 ) sum( n_obs_t( 1,9:17))] % npi
MatReel = [ n_obs(1, 1:7 )   sum(n_obs(1 , 8:9))] % ni 

Chi2Calcule = sum( ( MatReel - MatTheorique).^2 ./ MatTheorique )

r = 8;                              % nombre de classe ici 8 colonnes
k = 1;                              % parametre à estimer 
alpha = 0.95;

Chi2Theorique = chi2inv(alpha , r-k-1)

% Le Chi2Calcule est inferieur a l'inverse d'une loi de poisson à 95% de 6 degrés de
% libertés.

"H0 : on considère que l'échantillon a été produit par une cette loi de poisson"
"Ici nous avons un test d'ajustement car on cherche à déterminer si X suit la loi de poisson" 
if (Chi2Theorique > Chi2Calcule)
    " l'hypothese H0 n'est pas rejetée. Ce n'est donc pas significatif donc cela peut être une loi de poisson. " 
else 
    " l'hypothese est rejetée on ne peut pas admettre que c'est une loi de poisson."
end

%% Question 2
load freshmen.mat

ans = [1:5 ; 3 9 18 36 29 ; 3 3 1 14 13]

male = fresmen(1 ,:);
%male = [3 9 18 36 29];

female = fresmen(2 ,:);
%female = [3 3 1 14 13];

n_male = sum(male);
n_female = sum(female);
% Let's suppose that both sample follow the same law: men and women all
% enjoy initiation at the same level.

%I calcul an approximate value for the mean probability of each category.
p_j = (male + female) /(sum(male) + sum(female))

chi2_male = sum((male - p_j .* n_male).^2 ./ (n_male .* p_j));
chi2_female = sum((female - p_j .* n_female).^2 ./ (n_female .* p_j));
chi2_total = chi2_male + chi2_female
chi2_total_th = chi2inv(0.95, (5-1) * (2-1))

% The chi2 is inferior to P(chi2_0<X)=95 therfore we cannot say that the
% two samples don't follow the same law.

%% Question 3
Re_01 = [23.05 36 31.1 32.65 30.9 31.4 30.85];
Re_02 = [41.85 25.65 46.7 34.5 36.65 31.45 36.13];
Re_04 = [47.05 43.45 43 38.65 41.85 35.45 41.57];
Re_06 = [49.65 73.9 66.45 74.55 62.4 63.75 65.11];

n_value = (length(Re_01) + length(Re_02) + length(Re_04) + length(Re_06))
%Let's make the hypothesys : All mean values are the same, the carbon has
%no influence on the stiffness of the steel.
m_01 = mean(Re_01);
m_02 = mean(Re_02);
m_04 = mean(Re_04);
m_06 = mean(Re_06);

var_01 = var(Re_01, 1);
var_02 = var(Re_02, 1);
var_04 = var(Re_04, 1);
var_06 = var(Re_06, 1);

global_mean = mean([m_01, m_02, m_04, m_06]);
global_var = mean([var_01, var_02, var_04, var_06]);

interfactor_var = (length(Re_01) * (m_01 - global_mean)^2 + length(Re_02) * (m_02 - global_mean)^2 + length(Re_04) * (m_04 - global_mean)^2 + length(Re_06) * (m_06 - global_mean)^2 ) / n_value

F = (interfactor_var / (4 - 1) / (global_var / (n_value - 4)))

% F is way superior to the theorical chi2. Therefore we have to rejet the
% hypothesis that the carbon has no influence on the mechanical
% resistance.
