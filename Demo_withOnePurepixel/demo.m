clear all; 
clc;
tic;
load('data4');
load('VCA_4');
count = 1000;
%%
E = eye(c); 
abf(:,ind) = E;
%% Using index obtained by VCA to obtain new data
new_mixed = mixed(Index,:);
new_abf = abf(:,Index);
%% PCA
[nlength,nbands]=size(mixed);
h_img= mixed;
meanh  = mean(h_img);
stdh   = std(h_img);
sd_img = (h_img-repmat(meanh,nlength,1))./repmat(stdh,nlength,1);%±ê×¼»¯Í¼Ïñ
[pcoef, score, latent] = pca(sd_img);
perc = cumsum(latent)/sum(latent)*100;
Nend=sum(perc<99.99)+1;
pca_img = sd_img*pcoef(:,1:Nend-1);
pca_img = pca_img(Index,:);
%% Feature distance matrix
distmat = pdist(pca_img,'seuclidean');
dis_mix = squareform(distmat);
clear distmat;
%% DivergentSubet
y = DivergentSubet(dis_mix,count);
[lab,lab_y] = num_end_de(y,new_abf);%Deleting repeated elements.
% You can observe lab_x to determine the number of endmembers.
toc;