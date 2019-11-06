clear; close all; clc; 
load('fisheriris.mat')
%whos


%% plot a bar diagram 
% c = categorical({'setosa', 'versicolor', 'virginica'});
% bar(c, [length(strmatch('setosa', species)),length(strmatch('versicolor', species)), length(strmatch('virginica', species))]);
% title("Répartition des différentes espèces de l'échantillon");
% ylim([0,70]);xlabel("Espèces"); ylabel("Effectif");

%% Question 8:
% petalLength = meas(:,3);
% 
% figure;
% suptitle('Relative frequency Histogram');
% subplot(2,2,1)
% num_bins = 10;
% [histFreq, histXout] = hist(petalLength, num_bins);
% bar(histXout, histFreq/sum(histFreq));
% title(strcat(num2str(num_bins), ' bins'));
% xlabel('Petal length');ylabel('Relative frequency ');
% subplot(2,2,2)
% num_bins = 30;
% [histFreq, histXout] = hist(petalLength, num_bins);
% bar(histXout, histFreq/sum(histFreq));
% title( strcat(num2str(num_bins), ' bins'));
% xlabel('Petal length');ylabel('Relative frequency ');
% subplot(2,2,3)
% num_bins = 70;
% [histFreq, histXout] = hist(petalLength, num_bins);
% bar(histXout, histFreq/sum(histFreq));
% title( strcat(num2str(num_bins), ' bins'));
% xlabel('Petal length');ylabel('Relative frequency ');
% subplot(2,2,4)
% num_bins = 100;
% [histFreq, histXout] = hist(petalLength, num_bins);
% bar(histXout, histFreq/sum(histFreq));
% title( strcat(num2str(num_bins), ' bins'));
% xlabel('Petal length');ylabel('Relative frequency ');

%% Question 8 histogramme des fréquences cumulées 
petalLength = meas(:,3);

figure;
suptitle('Cumulative frequency Histogram');
subplot(2,2,1)
binrange  = 0:0.8:8 ;
num_bins = 8/0.8; 
bar(binrange, cumsum ((( histc(petalLength, binrange))/length(petalLength)) )); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length');ylabel('Cumulative frequency ');

subplot(2,2,2)
binrange  = 0:0.32:8;
num_bins = 8/0.32; % 25
bar(binrange, cumsum ((( histc(petalLength, binrange))/length(petalLength)) )); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length');ylabel('Cumulative frequency ');

subplot(2,2,3)
binrange  = 0:0.16:8 ; %50
num_bins = 8/0.16; 
bar(binrange, cumsum ((( histc(petalLength, binrange))/length(petalLength)) )); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length');ylabel('Cumulative frequency ');

subplot(2,2,4)
binrange  = 0:0.08:8;
num_bins = 8/0.08; %100
bar(binrange, cumsum((( histc(petalLength, binrange))/length(petalLength)))); 
title(strcat(num2str(num_bins), ' bins'));
xlabel('Petal length'); ylabel('Cumulative frequency ');

%% Question 9 boite à moustaches:
figure;
boxplot(petalLength);
title('Boite à moustaches')
ylabel('longeur des pétales');  xlabel('petalLength');

%% Question 10:
moyenne=mean(petalLength);

mediane=median(petalLength);

ecarttype=std(petalLength);

variance=var(petalLength); 

quartiles=quantile(petalLength,3);  % diviser l'échnatillon en 4 sous-groupes