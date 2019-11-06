%**************************************************************************
%******************************* TP 2 *************************************
%**************************************************************************

load ("fisheriris.mat")

sepalLength = meas(:,1:1);
sepalWidth = meas(:,2:2);
petalLength = meas(:,3:3);
petalWidth = meas(:,4:4);

%Question 1
figure(1)
scatter(petalWidth, petalLength);
title('Petal length in function of petal width');
xlabel('Width');
ylabel('Length');

%Les points semblent former un droite. A première vu la longueur du petal
%semble être proportionnelle a sa largueur. En revanche on voit deux
%groupes de valeurs distinctes. Ces valeurs appartiennent a deux population
%differentes, la correlation reste donc a démontrer.

%Question 2
figure(2);
histogram2(petalWidth, petalLength, 'NumBins', 10);
title('Effectif petalWidth en fonction petalLength')
xlabel('Width');
ylabel('Length');
zlabel('Number of element');

%La position de chaque colonnes represente sa largeurs et sa longueur, sa 
%hauteur represente le nombre d'effectifs dans la chacune des catégories.

%Question 3
figure(3)
%Recuperation de la matricede variance/covariance
[corr] = corrcoef(petalWidth, petalLength);
covXY = corr(2);

%Calcul du coefficient de correlation
r = covXY / (std(petalLength) .* std(petalWidth));

%Calcul des paramètres de l'equation de la droite de regression
a = r*std(petalLength)/std(petalWidth);
b = mean(petalLength) - r*std(petalLength)/std(petalWidth)*mean(petalWidth);

%Question 5
%Calcul de deux point pour tracer la droite
p1 = [0, 2.5];
p2 = [b, 2.5*a + b];

plot(petalWidth, petalLength, 'o', p1, p2, 'r-');


%Question 6
%Le coefficient de correlation vaut r = 0.7156 ce qui est relativement
%élevé. Les deux varaibles sont donc correlé positivement (si l'un augmente
%l'autre augmente également).


%Question 7

setosaPL = petalLength(1:50);
versicolorPL = petalLength(51:100);
virginicaPL = petalLength(101:150);

figure(4)

y = [setosaPL; versicolorPL ; virginicaPL];
histogram(setosaPL, 'FaceColor', 'b', 'NumBins', 10)
hold on 
histogram(versicolorPL, 'FaceColor', 'g', 'NumBins', 10 )
hold on 
histogram(virginicaPL, 'FaceColor', 'r', 'NumBins', 10 )
ylabel("Effectifs")
legend('Setosa', ' Versicolor','Virginica', 'Location', 'Northeast');


%Question 8
figure(5)
boxplot(y, species)
title('Boîte à moustache de la longueur pour chaque ');
ylabel('Length')

%Question 9 
%Calcul de la variance intr-classe

mean_petal = mean(y);
set_mean = mean(setosaPL);

%Calcul des moyennes
mean_setosa = mean(setosaPL);
mean_versicolor = mean(versicolorPL);
mean_virginica = mean(virginicaPL);

%Calcul des variances
var_inter = 50 .*(mean_setosa - mean_petal) .^ 2 + 50 .*(mean_versicolor - mean_petal) .^ 2 + 50 .* (mean_virginica - mean_petal) .^ 2;
var_intra = (50 .* var(setosaPL) + 50.*var(versicolorPL) + 50.*var(virginicaPL))./150;
var_inter = var_inter ./ 150;
my_variance = var_intra + var_inter;

%différence entre les deux variables matlab et calculée. 

var(y) - my_variance

%Calcul du coefficient de correlation entre nos variables qualitatives et
%quantitative

S_yx = sqrt(var_inter/my_variance)