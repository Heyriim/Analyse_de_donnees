
%**************************************************************************
%******************************* TP 1 ***********************************
%**************************************************************************
clear;

load ("fisheriris.mat")

% %Question 2
% %renvoie la longueur du tableau 'species'
% length(species) 
% 
% %Question 3
% %Revoie le nom des elements uniques, leur nombre
% %ainsi que leur pourcentage dans la poplation totale
% tabulate(species) 
% 
% %Question 4
% %Les variables quantitative sont les 4 colonnes 
% %du tableau 'meas'
% %Les varaible sont considerÃ© continue (car elles 
% %ont des chiffres aprÃ¨s la virgule --> presque continue)

%Question 5
%On place les differentes colonnes du tableau meas dans les differentes
%variables.
sepalLength = meas(:,1:1);
sepalWidth = meas(:,2:2);
petalLength = meas(:,3:3);
petalWidth = meas(:,4:4);

%Question 6
% %Extraction des valeur 'cout' de la fonction tabulate
% tab = tabulate(species);
% nb_species = cell2mat(tab(:,2:2));
% 
% %Question 7
% figure() %J'affiche tout les graphiques sur la meme figure.
% pl1 = subplot(3, 2, 1)
% pie(nb_species)
% title('Camembert species')
% pl2 = subplot(3, 2, 2)
% histogram(nb_species)
% title('Histograme species')
% 
% %Question 8
% 
% subplot(3, 2, 3)
% histogram(petalLength, 'Normalization', 'probability', 'NumBins', 10)
% title('Frequence relative petalLength')
% subplot(3, 2, 4)
% histogram(petalLength, 'Normalization', 'cdf', 'NumBins', 10)
% title('Frequence relative cumulÃ©e petalLength')
% 
% 
% %Question 9
% %La hauteur de chaque barre de l'histograme des frequences relatives 
% %represente la proportion d'individus de cette classe dans la population 
% %totale.
% %La somme des toutes les barres doit Ãªtre Ã©gale Ã  1.
% 
% %Pour celui des frequences cumulÃ©es, la barre 'n' represente la somme de 
% %0 Ã  'n' des frequences relatives. La derniÃ¨re colonne a donc forcement 
% %une hauteur de 1.
% 
% %Question 10
% subplot(3, 2, 5)
% boxplot(petalLength)
% title('Boite Ã  moustache')

%**************************************************************************
%******************************* TP 2 ***********************************
%**************************************************************************

%Question 1

figure(1)
scatter(petalLength,petalWidth)
xlabel('Petal width')
ylabel('Petal length')
title('Longueur du pétale en fonction de la largeur du pétale')
%lsline trace une ligne

% Question 2
figure(2)
histogram2(petalWidth,petalLength,'NumBins',10)
xlabel('Petal width')
ylabel('Petal length')
title('Histogramme longueur du pétale en fonction de la largeur du pétale')

% Question 3

% Question 4

[corr]=corrcoef(petalWidth,petalLength);
%CovXY=cov(petalLength,petalWidth) % retourne une matrice covariance normalisÃ©
CovXY=corr(2);

% Question 5 

StdX=std(petalWidth); 
StdY=std(petalLength);

% calcul coefficient lineaire

r=CovXY/(StdX*StdY)

% tracer de la droite

a=r*(StdY/StdX);
b=mean(petalLength)-r*(StdY/StdX)*mean(petalWidth);

droite=a*petalLength-b;  % faire avec deux points

figure(3)

plot(petalWidth, petalLength, 'o',petalWidth,droite,'r-')
xlabel('Petal width')
ylabel('Petal length')
title('Longueur du pétale en fonction de la largeur du pétale')

% figure(4)
% y = [setosaPL; versicolorPL ; virginicaPL]; % tableau d'espece
% boxplot(classe,species)

