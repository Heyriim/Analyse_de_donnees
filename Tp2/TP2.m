%**************************************************************************
%******************************* TP 2 *************************************
%**************************************************************************
clear
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
%groupes de valeurs distinctes. Ces valeurs appartiennent a deux
%populations differentes, la correlation reste donc a démontrer.

%Question 2
figure(2);
histogram2(petalWidth, petalLength, 'NumBins', 10);
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
title('Petal length in function of petal width');
xlabel('Width');
ylabel('Length');

%Question 6
%Le coefficient de correlation vaut r = 0.7156 ce qui est relativement
%élevé. Les deux varaibles sont donc correlé positivement (si l'un augmente
%l'autre augmente également).


%Question 7

%
setosaPL = petalLength(1:50);
versicolorPL = petalLength(51:100);
virginicaPL = petalLength(101:150);

figure(4)

y = [setosaPL; versicolorPL ; virginicaPL];
x = [1:150];

%C'est long mais ca marche...
for b = 1 : length(y)
	%Je creer separement chaque barre de l'histograme
	handleToThisBarSeries(b) = bar(x(b), y(b), 'BarWidth', 0.9);
    
    %Du rouge pour setosa
	if b < 51
        set(handleToThisBarSeries(b), 'FaceColor', [1 0 0]);
        
    %Du vert pour versicolor
    elseif b > 50 && b < 101
        set(handleToThisBarSeries(b), 'FaceColor', [0 1 0]);   
        
    %Et enfin du bleu pour virginica
    elseif b > 100
        set(handleToThisBarSeries(b), 'FaceColor', [0 0 1]);
    end

	hold on;

end
title('Histogramme des espèces ');

%Question 8
figure(5);
boxplot(y, species);
title('Boîte à moustache');
ylabel('Length')


%Question 9 

