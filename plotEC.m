%% B1 PCA
clear;close all;clc
ff = fig('units','inches','width',7,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(2,3,[.10 .04],[.05 .04],[.04 .02]);
load('Data/B1_EC_N0_PCA.mat')
axes(h(1));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(a)','FontWeight','normal')
load('Data/B1_EC_N10_PCA.mat')
axes(h(2));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(b)','FontWeight','normal')
load('Data/B1_EC_N20_PCA.mat')
axes(h(3));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
legend({'model 1','model 2','model 3'})
title('(c)','FontWeight','normal')
load('Data/B1_EC_N30_PCA.mat')
axes(h(4));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(d)','FontWeight','normal')
load('Data/B1_EC_N40_PCA.mat')
axes(h(5));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(e)','FontWeight','normal')
load('Data/B1_EC_N50_PCA.mat')
axes(h(6));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(f)','FontWeight','normal')
% saveas(ff,'Figures/B1_EC_PCA.png')
% saveas(ff,'Figures/B1_EC_PCA.eps','epsc') 
% savefig(ff,'Figures/B1_EC_PCA.fig')
%% B1 UMAP
clear;close all;clc
ff = fig('units','inches','width',7,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(2,3,[.05 .04],[.05 .04],[.04 .02]);
load('Data/B1_EC_N0_Umap.mat')
axes(h(1));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(a)','FontWeight','normal')
load('Data/B1_EC_N10_Umap.mat')
axes(h(2));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(b)','FontWeight','normal')
load('Data/B1_EC_N20_Umap.mat')
axes(h(3));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
legend({'model 1','model 2','model 3'})
title('(c)','FontWeight','normal')
load('Data/B1_EC_N30_Umap.mat')
axes(h(4));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(d)','FontWeight','normal')
load('Data/B1_EC_N40_Umap.mat')
axes(h(5));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(e)','FontWeight','normal')
load('Data/B1_EC_N50_Umap.mat')
axes(h(6));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(f)','FontWeight','normal')
% saveas(ff,'Figures/B1_EC_Umap.png')
% saveas(ff,'Figures/B1_EC_Umap.eps','epsc') 
% savefig(ff,'Figures/B1_EC_Umap.fig')
%% B1 EC demo
clear;close all;clc
cd '/Users/zzknight/Google Drive ASU/ASUResearch/PDE_learning/code_data'
addpath('Gcode')  
load('U_Burgers.mat','U0')
load('Datasets/BurgersMATLAB_N0.mat','x','t')
t = t(11:end);
[x,t] = meshgrid(x,t);
U0 = squeeze(U0(10,:,:));
ff = fig('units','inches','width',2,'height',2,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,1,[.0 .0],[.0 .0],[.0 .0]);
axes(h(1));box on;hold on
imagesc(abs(U0))
colormap(jet)
cmap = flip(colormap,1);
colormap(cmap)
xlim([0 256])
ylim([0 90])
savefig(ff,'Figures/B1_EC_lm.fig')
for i=1:5
    l = -0.2+(i-1)*0.1;
    U1 = U0;
    U1(U1<l) = 0;
    colormap(jet)
    cmap = flip(colormap,1);
    cmap(1,:) = 1;
    imagesc(abs(U1))
    colormap(cmap)
    fName = strcat('Figures/B1_EC_l',num2str(l),'.fig');
    savefig(ff,fName)
end
% savefig(ff,'Figures/B1_EC_l0.2n.fig')
%% B1 EC demo
clear;close all;clc
cd '/Users/zzknight/Google Drive ASU/ASUResearch/PDE_learning/code_data'
addpath('Gcode')  
load('U_Burgers.mat','U0')
load('Datasets/BurgersMATLAB_N0.mat','x','t')
t = t(11:end);
[x,t] = meshgrid(x,t);
U0 = squeeze(U0(10,:,:));
close all
ff = fig('units','inches','width',10,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,2,[.05 .08],[.10 .04],[.06 .02]);
axes(h(1));box on;hold on
surf(t,x,U0)
colormap(jet)
xlabel('$t$','Interpreter','latex')
ylabel('$x$','Interpreter','latex')
zlabel('$u$','Interpreter','latex')
v = [-128.4000 28.1974];view(v);grid on
set(gca,'xtick',0:0.2:1.0)
set(gca,'ytick',-1:0.5:1.0)
set(gca,'xticklabel',0:0.2:1.0)
set(gca,'yticklabel',-1:0.5:1.0)
xlim([0 1])
patch( [-1 -1 1 1] , [-1 1 1 -1], [0.1 0.1 0.1 0.1], 'k', 'FaceAlpha',.5)
text(0.8,0.2,0.15,'$\ell$ = 0.1','Interpreter','latex')
title('(a)','FontWeight','normal')
cd '/Users/zzknight/Google Drive ASU/ASUResearch/Machine Learning for Fluid Mechanics/CodeZZ/Data'
load('B1_EC_N0.mat')
EC = A(10,:);
axes(h(2));box on;hold on
l = linspace(-2,2,100);
plot(l,EC,'b','LineWidth',2.0)
xlabel('$\ell$','Interpreter','latex')
ylabel('$EC$','Interpreter','latex')
grid on
xlim([-0.5 0.5])
set(gca,'xtick',-0.5:0.1:0.5)
set(gca,'ytick',-100:50:200)
set(gca,'xticklabel',-0.5:0.1:0.5)
set(gca,'yticklabel',-100:50:200)
title('(b)','FontWeight','normal')


ax1 = axes('Position',[0.57 0.4 0.05 0.1]);
cd '/Users/zzknight/Google Drive ASU/ASUResearch/PDE_learning/code_data'
addpath('Gcode')  
load('U_Burgers.mat','U0')
load('Datasets/BurgersMATLAB_N0.mat','x','t')
t = t(11:end);
[x,t] = meshgrid(x,t);
U0 = squeeze(U0(10,:,:));
imagesc(abs(U0))
colormap(jet)
cmap = flip(colormap,1);
colormap(cmap)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('$\ell=\ell_m$','FontWeight','normal','Interpreter','latex')

ax2 = axes('Position',[0.7 0.20 0.05 0.1]);
l = -0.1;
U1 = U0;
U1(U1<l) = 0;
colormap(jet)
cmap = flip(colormap,1);
cmap(1,:) = 1;
imagesc(abs(U1))
colormap(cmap)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('$\ell=-0.1$','FontWeight','normal','Interpreter','latex')

ax3 = axes('Position',[0.74 0.8 0.05 0.1]);
l = 0;
U1 = U0;
U1(U1<l) = 0;
colormap(jet)
cmap = flip(colormap,1);
cmap(1,:) = 1;
imagesc(abs(U1))
colormap(cmap)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('$\ell=0$','FontWeight','normal','Interpreter','latex')

ax4 = axes('Position',[0.83 0.26 0.05 0.1]);
l = 0.2;
U1 = U0;
U1(U1<l) = 0;
colormap(jet)
cmap = flip(colormap,1);
cmap(1,:) = 1;
imagesc(abs(U1))
colormap(cmap)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('$\ell=0.2$','FontWeight','normal','Interpreter','latex')
% savefig(ff,'Figures/B1_EC_curve.fig')
% saveas(ff,'Figures/B1_EC_curve.png')
% saveas(ff,'Figures/B1_EC_curve.eps','epsc') 
%% B1 EC noise influence
clear;close all;clc
% cd 'C:\Users\zzhan506\Google Drive\ASUResearch\Machine Learning for Fluid Mechanics\CodeZZ' 
load('Data\B1_EC_Noise.mat')
close all
ff = fig('units','inches','width',5,'height',4,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,1,[.05 .08],[.12 .02],[.14 .02]);
axes(h(1));box on;hold on
l = linspace(-2,2,100);
plot(l,A','LineStyle','--')
load('Data\B1_EC_N0.mat')
plot(l,A(280,:),'b','LineWidth',2.0)
xlabel('$\ell$','Interpreter','latex')
ylabel('$EC$','Interpreter','latex')
grid on
xlim([-0.5 0.5])
set(gca,'xtick',-0.5:0.1:0.5)
set(gca,'ytick',-2000:500:1500)
set(gca,'xticklabel',-0.5:0.1:0.5)
set(gca,'yticklabel',-2000:500:1500)
% savefig(ff,'Figures/B1_EC_noise.fig')
% saveas(ff,'Figures/B1_EC_noise.png')
% saveas(ff,'Figures/B1_EC_noise.eps','epsc') 
%% B1 EC BCs influence
clear;close all;clc
% cd 'C:\Users\zzhan506\Google Drive\ASUResearch\Machine Learning for Fluid Mechanics\CodeZZ' 
load('Data\B1_EC_BCs.mat')
close all
ff = fig('units','inches','width',5,'height',4,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,1,[.05 .08],[.12 .02],[.14 .02]);
axes(h(1));box on;hold on
l = linspace(-2,2,100);
plot(l,A','LineStyle','--')
load('Data\B1_EC_N0.mat')
plot(l,A(280,:),'b','LineWidth',2.0)
xlabel('$\ell$','Interpreter','latex')
ylabel('$EC$','Interpreter','latex')
grid on
xlim([-0.5 0.5])
set(gca,'xtick',-0.5:0.1:0.5)
set(gca,'ytick',-2000:500:1500)
set(gca,'xticklabel',-0.5:0.1:0.5)
set(gca,'yticklabel',-2000:500:1500)
% savefig(ff,'Figures/B1_EC_BCs.fig')
% saveas(ff,'Figures/B1_EC_BCs.png')
% saveas(ff,'Figures/B1_EC_BCs.eps','epsc') 
%% RD PCA
clear;close all;clc
ff = fig('units','inches','width',7,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(2,3,[.10 .04],[.05 .04],[.04 .02]);
load('Data/RD_EC_N0_PCA.mat')
axes(h(1));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(a)','FontWeight','normal')
load('Data/RD_EC_N10_PCA.mat')
axes(h(2));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(b)','FontWeight','normal')
load('Data/RD_EC_N20_PCA.mat')
axes(h(3));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
legend({'model 1','model 2','model 3'})
title('(c)','FontWeight','normal')
load('Data/RD_EC_N30_PCA.mat')
axes(h(4));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(d)','FontWeight','normal')
load('Data/RD_EC_N40_PCA.mat')
axes(h(5));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(e)','FontWeight','normal')
load('Data/RD_EC_N50_PCA.mat')
axes(h(6));box on;hold on
scatter(pcaA(1:100,1),pcaA(1:100,2),20,'r','filled')
scatter(pcaA(101:200,1),pcaA(101:200,2),20,'b','filled')
scatter(pcaA(201:300,1),pcaA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(f)','FontWeight','normal')
% saveas(ff,'Figures/RD_EC_PCA.png')
% saveas(ff,'Figures/RD_EC_PCA.eps','epsc') 
% savefig(ff,'Figures/RD_EC_PCA.fig')
%% RD UMAP
clear;close all;clc
ff = fig('units','inches','width',7,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(2,3,[.05 .04],[.05 .04],[.04 .02]);
load('Data/RD_EC_N0_Umap.mat')
axes(h(1));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(a)','FontWeight','normal')
load('Data/RD_EC_N10_Umap.mat')
axes(h(2));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(b)','FontWeight','normal')
load('Data/RD_EC_N20_Umap.mat')
axes(h(3));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
legend({'model 1','model 2','model 3'})
title('(c)','FontWeight','normal')
load('Data/RD_EC_N30_Umap.mat')
axes(h(4));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(d)','FontWeight','normal')
load('Data/RD_EC_N40_Umap.mat')
axes(h(5));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(e)','FontWeight','normal')
load('Data/RD_EC_N50_Umap.mat')
axes(h(6));box on;hold on
scatter(embedA(1:100,1),embedA(1:100,2),20,'r','filled')
scatter(embedA(101:200,1),embedA(101:200,2),20,'b','filled')
scatter(embedA(201:300,1),embedA(201:300,2),20,'g','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(f)','FontWeight','normal')
% saveas(ff,'Figures/RD_EC_Umap.png')
% saveas(ff,'Figures/RD_EC_Umap.eps','epsc') 
% savefig(ff,'Figures/RD_EC_Umap.fig')
%% PDE2D PCA
clear;close all;clc
ff = fig('units','inches','width',7,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(2,3,[.10 .04],[.05 .04],[.04 .02]);
load('Data/PDE2D_EC_N0_PCA.mat')
axes(h(1));box on;hold on
scatter(pcaA(1:384,1),pcaA(1:384,2),20,'r','filled')
scatter(pcaA(384*1+1:384*2,1),pcaA(384*1+1:384*2,2),20,'b','filled')
scatter(pcaA(384*2+1:384*3,1),pcaA(384*2+1:384*3,2),20,'g','filled')
scatter(pcaA(384*3+1:384*4,1),pcaA(384*3+1:384*4,2),20,'c','filled')
scatter(pcaA(384*4+1:384*5,1),pcaA(384*4+1:384*5,2),20,'m','filled')
scatter(pcaA(384*5+1:384*6,1),pcaA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(a)','FontWeight','normal')
load('Data/PDE2D_EC_N10_PCA.mat')
axes(h(2));box on;hold on
scatter(pcaA(1:384,1),pcaA(1:384,2),20,'r','filled')
scatter(pcaA(384*1+1:384*2,1),pcaA(384*1+1:384*2,2),20,'b','filled')
scatter(pcaA(384*2+1:384*3,1),pcaA(384*2+1:384*3,2),20,'g','filled')
scatter(pcaA(384*3+1:384*4,1),pcaA(384*3+1:384*4,2),20,'c','filled')
scatter(pcaA(384*4+1:384*5,1),pcaA(384*4+1:384*5,2),20,'m','filled')
scatter(pcaA(384*5+1:384*6,1),pcaA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(b)','FontWeight','normal')
load('Data/PDE2D_EC_N20_PCA.mat')
axes(h(3));box on;hold on
scatter(pcaA(1:384,1),pcaA(1:384,2),20,'r','filled')
scatter(pcaA(384*1+1:384*2,1),pcaA(384*1+1:384*2,2),20,'b','filled')
scatter(pcaA(384*2+1:384*3,1),pcaA(384*2+1:384*3,2),20,'g','filled')
scatter(pcaA(384*3+1:384*4,1),pcaA(384*3+1:384*4,2),20,'c','filled')
scatter(pcaA(384*4+1:384*5,1),pcaA(384*4+1:384*5,2),20,'m','filled')
scatter(pcaA(384*5+1:384*6,1),pcaA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
legend({'model 1','model 2','model 3','model 4','model 5','model 6'})
title('(c)','FontWeight','normal')
load('Data/PDE2D_EC_N30_PCA.mat')
axes(h(4));box on;hold on
scatter(pcaA(1:384,1),pcaA(1:384,2),20,'r','filled')
scatter(pcaA(384*1+1:384*2,1),pcaA(384*1+1:384*2,2),20,'b','filled')
scatter(pcaA(384*2+1:384*3,1),pcaA(384*2+1:384*3,2),20,'g','filled')
scatter(pcaA(384*3+1:384*4,1),pcaA(384*3+1:384*4,2),20,'c','filled')
scatter(pcaA(384*4+1:384*5,1),pcaA(384*4+1:384*5,2),20,'m','filled')
scatter(pcaA(384*5+1:384*6,1),pcaA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(d)','FontWeight','normal')
load('Data/PDE2D_EC_N40_PCA.mat')
axes(h(5));box on;hold on
scatter(pcaA(1:384,1),pcaA(1:384,2),20,'r','filled')
scatter(pcaA(384*1+1:384*2,1),pcaA(384*1+1:384*2,2),20,'b','filled')
scatter(pcaA(384*2+1:384*3,1),pcaA(384*2+1:384*3,2),20,'g','filled')
scatter(pcaA(384*3+1:384*4,1),pcaA(384*3+1:384*4,2),20,'c','filled')
scatter(pcaA(384*4+1:384*5,1),pcaA(384*4+1:384*5,2),20,'m','filled')
scatter(pcaA(384*5+1:384*6,1),pcaA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(e)','FontWeight','normal')
load('Data/PDE2D_EC_N50_PCA.mat')
axes(h(6));box on;hold on
scatter(pcaA(1:384,1),pcaA(1:384,2),20,'r','filled')
scatter(pcaA(384*1+1:384*2,1),pcaA(384*1+1:384*2,2),20,'b','filled')
scatter(pcaA(384*2+1:384*3,1),pcaA(384*2+1:384*3,2),20,'g','filled')
scatter(pcaA(384*3+1:384*4,1),pcaA(384*3+1:384*4,2),20,'c','filled')
scatter(pcaA(384*4+1:384*5,1),pcaA(384*4+1:384*5,2),20,'m','filled')
scatter(pcaA(384*5+1:384*6,1),pcaA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
xlabel('PC1')
ylabel('PC2')
title('(f)','FontWeight','normal')
% saveas(ff,'Figures/PDE2D_EC_PCA.png')
% saveas(ff,'Figures/PDE2D_EC_PCA.eps','epsc') 
% savefig(ff,'Figures/PDE2D_EC_PCA.fig')
%% RD UMAP
clear;close all;clc
ff = fig('units','inches','width',7,'height',5,'font','Times New Roman','fontsize',11);
h = tight_subplot(2,3,[.05 .04],[.05 .04],[.04 .02]);
load('Data/PDE2D_EC_N0_Umap.mat')
axes(h(1));box on;hold on
scatter(embedA(1:384,1),embedA(1:384,2),20,'r','filled')
scatter(embedA(384*1+1:384*2,1),embedA(384*1+1:384*2,2),20,'b','filled')
scatter(embedA(384*2+1:384*3,1),embedA(384*2+1:384*3,2),20,'g','filled')
scatter(embedA(384*3+1:384*4,1),embedA(384*3+1:384*4,2),20,'c','filled')
scatter(embedA(384*4+1:384*5,1),embedA(384*4+1:384*5,2),20,'m','filled')
scatter(embedA(384*5+1:384*6,1),embedA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(a)','FontWeight','normal')
load('Data/PDE2D_EC_N10_Umap.mat')
axes(h(2));box on;hold on
scatter(embedA(1:384,1),embedA(1:384,2),20,'r','filled')
scatter(embedA(384*1+1:384*2,1),embedA(384*1+1:384*2,2),20,'b','filled')
scatter(embedA(384*2+1:384*3,1),embedA(384*2+1:384*3,2),20,'g','filled')
scatter(embedA(384*3+1:384*4,1),embedA(384*3+1:384*4,2),20,'c','filled')
scatter(embedA(384*4+1:384*5,1),embedA(384*4+1:384*5,2),20,'m','filled')
scatter(embedA(384*5+1:384*6,1),embedA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(b)','FontWeight','normal')
load('Data/PDE2D_EC_N20_Umap.mat')
axes(h(3));box on;hold on
scatter(embedA(1:384,1),embedA(1:384,2),20,'r','filled')
scatter(embedA(384*1+1:384*2,1),embedA(384*1+1:384*2,2),20,'b','filled')
scatter(embedA(384*2+1:384*3,1),embedA(384*2+1:384*3,2),20,'g','filled')
scatter(embedA(384*3+1:384*4,1),embedA(384*3+1:384*4,2),20,'c','filled')
scatter(embedA(384*4+1:384*5,1),embedA(384*4+1:384*5,2),20,'m','filled')
scatter(embedA(384*5+1:384*6,1),embedA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
legend({'model 1','model 2','model 3','model 4','model 5','model 6'})
title('(c)','FontWeight','normal')
load('Data/PDE2D_EC_N30_Umap.mat')
axes(h(4));box on;hold on
scatter(embedA(1:384,1),embedA(1:384,2),20,'r','filled')
scatter(embedA(384*1+1:384*2,1),embedA(384*1+1:384*2,2),20,'b','filled')
scatter(embedA(384*2+1:384*3,1),embedA(384*2+1:384*3,2),20,'g','filled')
scatter(embedA(384*3+1:384*4,1),embedA(384*3+1:384*4,2),20,'c','filled')
scatter(embedA(384*4+1:384*5,1),embedA(384*4+1:384*5,2),20,'m','filled')
scatter(embedA(384*5+1:384*6,1),embedA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(d)','FontWeight','normal')
load('Data/PDE2D_EC_N40_Umap.mat')
axes(h(5));box on;hold on
scatter(embedA(1:384,1),embedA(1:384,2),20,'r','filled')
scatter(embedA(384*1+1:384*2,1),embedA(384*1+1:384*2,2),20,'b','filled')
scatter(embedA(384*2+1:384*3,1),embedA(384*2+1:384*3,2),20,'g','filled')
scatter(embedA(384*3+1:384*4,1),embedA(384*3+1:384*4,2),20,'c','filled')
scatter(embedA(384*4+1:384*5,1),embedA(384*4+1:384*5,2),20,'m','filled')
scatter(embedA(384*5+1:384*6,1),embedA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(e)','FontWeight','normal')
load('Data/PDE2D_EC_N50_Umap.mat')
axes(h(6));box on;hold on
scatter(embedA(1:384,1),embedA(1:384,2),20,'r','filled')
scatter(embedA(384*1+1:384*2,1),embedA(384*1+1:384*2,2),20,'b','filled')
scatter(embedA(384*2+1:384*3,1),embedA(384*2+1:384*3,2),20,'g','filled')
scatter(embedA(384*3+1:384*4,1),embedA(384*3+1:384*4,2),20,'c','filled')
scatter(embedA(384*4+1:384*5,1),embedA(384*4+1:384*5,2),20,'m','filled')
scatter(embedA(384*5+1:384*6,1),embedA(384*5+1:384*6,2),20,'y','filled')
set(gca,'xtick',[])
set(gca,'ytick',[])
title('(f)','FontWeight','normal')
% saveas(ff,'Figures/PDE2D_EC_Umap.png')
% saveas(ff,'Figures/PDE2D_EC_Umap.eps','epsc') 
% savefig(ff,'Figures/PDE2D_EC_Umap.fig')