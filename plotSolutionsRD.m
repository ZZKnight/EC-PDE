clear;clc
load('.\Data\U_RD.mat')
U0 = squeeze(U0);
U1 = squeeze(U1);
U2 = squeeze(U2);
%%
close all
ff = fig('units','inches','width',10,'height',2,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,5,[.00 .01],[.01 .09],[.04 .02]);
for i = 1:5
    axes(h(i));box on;
    U_ = squeeze(U0(i*10,:,:));
    imagesc(U_)
    xticks([])
    yticks([])
    if i==3, title('(a)','FontWeight','normal'), end
end
text(0,0,'$t$ increases','Interpreter','latex')
% saveas(ff,'Figures/solRD_U0.png')
% saveas(ff,'Figures/solRD_U0.eps','epsc') 
% savefig(ff,'Figures/solRD_U0.fig')
%%
close all
ff = fig('units','inches','width',10,'height',2,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,5,[.00 .01],[.01 .09],[.04 .02]);
for i = 1:5
    axes(h(i));box on;
    U_ = squeeze(U1(i*10,:,:));
    imagesc(U_)
    xticks([])
    yticks([])
    if i==3, title('(b)','FontWeight','normal'), end
end
text(0,0,'$t$ increases','Interpreter','latex')
% saveas(ff,'Figures/solRD_U1.png')
% saveas(ff,'Figures/solRD_U1.eps','epsc') 
% savefig(ff,'Figures/solRD_U1.fig')
%%
close all
ff = fig('units','inches','width',10,'height',2,'font','Times New Roman','fontsize',11);
h = tight_subplot(1,5,[.00 .01],[.01 .09],[.04 .02]);
for i = 1:5
    axes(h(i));box on;
    U_ = squeeze(U2(i*10,:,:));
    imagesc(U_)
    xticks([])
    yticks([])
    if i==3, title('(c)','FontWeight','normal'), end
end
text(0,0,'$t$ increases','Interpreter','latex')
% saveas(ff,'Figures/solRD_U2.png')
% saveas(ff,'Figures/solRD_U2.eps','epsc') 
% savefig(ff,'Figures/solRD_U2.fig')