%TP1%

clear % nettoie les figures et les variables
load('fisheriris.mat')  % charge le fichier qui contient la matrice de l'iris (meas 4 colonnes sepal length, sepal width, petal length et petal width. species 1 colonne)
whos % liste les variables par ordre alphabÃ©tique, tailles et types

[unitmeas,varmeas]=size(meas)
[unitspecies,varspecies]=size(species)

[OccuSpe,nbspe]=unique(species)

%  Occurences=unique(meas(: , 1)) % trie les occurences
%  nbOccu=histc(meas,Occurences) % donne le nombre d'occurence dans la matrice

sepalLenght=meas(:,1);
sepalWidth=meas(:,2);
petalLength=meas(:,3);
petalWidth=meas(:,4);

indexSetosa=strmatch('setosa',species);
indexVersicolor=strmatch('versicolor',species);
indexViginica=strmatch('virginica',species);
lengthSetosa=length(indexSetosa);
lengthVersicolor=length(indexVersicolor);
lengthViginica=length(indexViginica);

% cat = categorical({'setosa', 'versicolor', 'virginica'});
% bar(cat, [lengthSetosa,lengthVersicolor,lengthViginica]);
% pie(cat, [lengthSetosa,lengthVersicolor,lengthViginica]);
% title("Répartition des différentes espèces de fleur mesurées");
% ylim([0,70]); mettre une limite au graphe
% xlabel("Espèces"); 
% ylabel("Effectif");

figure;
title('Histogramme de fréquences cumulées');
subplot(2,2,1)
binrange  = 0:0.8:8 ;
num_bins = 8/0.8; 
bar(binrange, cumsum ((( histc(petalLength, binrange))/length(petalLength)) ), 'c'); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length');ylabel('fréquences cumulées ');

subplot(2,2,2)
binrange  = 0:0.32:8;
num_bins = 8/0.32; % 25
bar(binrange, cumsum ((( histc(petalLength, binrange))/length(petalLength)) )); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length');ylabel('fréquences cumulées');

subplot(2,2,3)
binrange  = 0:0.16:8 ; %50
num_bins = 8/0.16; 
bar(binrange, cumsum ((( histc(petalLength, binrange))/length(petalLength)) )); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length');ylabel('fréquences cumulées');

subplot(2,2,4)
binrange  = 0:0.08:8;
num_bins = 8/0.08; %100
bar(binrange, cumsum((( histc(petalLength, binrange))/length(petalLength))), 'c'); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length'); ylabel('fréquences cumulées');

figure;
boxplot(petalLength);
title('Boite à moustaches')
ylabel('longeur des pétales');  xlabel('petalLength');

moyenne=mean(petalLength)
mediane=median(petalLength)
ecarttype=std(petalLength)
variance=var(petalLength)
quartiles=quantile(petalLength,3)
