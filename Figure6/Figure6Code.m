%% RasterPlots
load('A')
RasterPlot=false(max(A(:,2))+1,A(end,1)-A(1,1)+1);
RasterPlot(sub2ind(size(RasterPlot),A(:,2)+1,A(:,1)-A(1,1)+1))=1;
B=RasterPlot;
figure('units','normalized')
[y,x]=find(B(:,1:10000));
Title='Before Injury';
h1=axes('position',[.13 .4 .77 .48]);
scatter(x(y<601)/5000,y(y<601),'marker','.','markeredgecolor',[.2 .2 .2])
set(gca,'Ytick',[])
ylim([0 600])
title(Title)
ylabel('Exc.')
h1.XAxis.Visible='off';
h2=axes('position',[.13 .25 .77 .12]);
scatter(x(y>600)/5000,y(y>600),'marker','.','markeredgecolor',[.7 .7 .7])
set(gca,'Ytick',[])
ylabel('Inh.')
xlabel('Time (s)')


RasterPlot=false(max(InjuredA(:,2))+1,InjuredA(end,1)-InjuredA(1,1)+1);
RasterPlot(sub2ind(size(RasterPlot),InjuredA(:,2)+1,InjuredA(:,1)-InjuredA(1,1)+1))=1;
B=RasterPlot;
figure('units','normalized')
[y,x]=find(B(:,1:10000));
Title='50 Percent LFR Injury';
h1=axes('position',[.13 .4 .77 .48]);
scatter(x(y<401)/5000,y(y<401),'marker','.','markeredgecolor',[.2 .2 .2])
set(gca,'Ytick',[])
ylim([0 400])
title(Title)
ylabel('Exc.')
h1.XAxis.Visible='off';
h2=axes('position',[.13 .25 .77 .12]);
scatter(x(y>400)/5000,y(y>400),'marker','.','markeredgecolor',[.7 .7 .7])
set(gca,'Ytick',[])
ylabel('Inh.')
xlabel('Time (s)')



RasterPlot=false(max(PlasticityA(:,2))+1,PlasticityA(end,1)-PlasticityA(1,1)+1);
RasterPlot(sub2ind(size(RasterPlot),PlasticityA(:,2)+1,PlasticityA(:,1)-PlasticityA(1,1)+1))=1;
B=RasterPlot;
figure('units','normalized')
[y,x]=find(B(:,1:10000));
Title='50 Percent LFR Injury + Plasticity';
h1=axes('position',[.13 .4 .77 .48]);
scatter(x(y<401)/5000,y(y<401),'marker','.','markeredgecolor',[.2 .2 .2])
set(gca,'Ytick',[])
ylim([0 400])
title(Title)
ylabel('Exc.')
h1.XAxis.Visible='off';
h2=axes('position',[.13 .25 .77 .12]);
scatter(x(y>400)/5000,y(y>400),'marker','.','markeredgecolor',[.7 .7 .7])
set(gca,'Ytick',[])
ylabel('Inh.')
xlabel('Time (s)')

%% B

load('B')
% Is it different than baseline? 
%Anova1
[p,tbl,stats] = anova1(YInjured);
multcompare(stats);
% Sig the entire way 

[p,tbl,stats] = anova1(YPlasticity);
multcompare(stats);
% NS to 15

% Is it different than no plasticity
for i=1:20
    h(i)=ttest2(YInjured(:,i),YPlasticity(:,i),'Alpha',.05/20);
end


figure
bar(-50,1,'barwidth',1,'facecolor',[1 31 91]/255)
hold on
bar(0:5:95,mean(YPlasticity),'barwidth',1,'facecolor',[153 0 0]/255,'linewidth',1.5)
bar(0:5:95,mean(YInjured),'barwidth',1,'facecolor',[1 31 91]/255,'linewidth',1.5)
errorbar(0:5:95,mean(YPlasticity),zeros(1,20),std(YPlasticity),'k.')
errorbar(0:5:95,mean(YInjured),zeros(1,20),std(YInjured),'k.')
K=max([mean(YPlasticity)+std(YPlasticity);mean(YInjured)+std(YInjured)]);
M=0:5:95;
scatter(M(h>0),K(h>0)+.2,'*k')
plot([0 95],[5.25 5.25],'linewidth',1.5,'color',[1 31 91]/255)
text(95/2, 5.25*1.075,'*','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
plot([0 15],[6.25 6.25],'linewidth',1.5,'color',[153 0 0]/255)
text(15/2, 6.25*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[153 0 0]/255)
xlim([-2.5 100])
ylim([0 7])
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:2:6])
box off
xlabel('Percent Injury')
ylabel('Firing Rate (Hz)')
b=legend({'Injury','Injury+Plasticity'},'Location','best');
legend('boxoff')
set(b,'Position',    [0.5470    0.7711    0.3732    0.1440])



%% C-E Scatter plots Oscillations

load('C')

% Is it different than no plasticity
for i=1:20
    h(i)=ttest2(NInj(:,i),NP(:,i),'Alpha',.05/20);
end

figure
scatter(0:5:95,mean(NInj)./5/60,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
scatter(0:5:95,mean(NP)./5/60,ones(1,20)*100,'filled','markerfacecolor',[153 0 0]/255)
errorbar(0:5:95,mean(NInj)./5/60,std(NInj)./5/60,'.k')
errorbar(0:5:95,mean(NP)./5/60,std(NP)./5/60,'.k')
K=[mean(NP)+std(NP)]./5/60;
M=0:5:95;
scatter(M(h>0),K(h>0)+.5,'*k')
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 15])
xlabel('Percent Injury')
ylabel('Frequency (Oscillation / sec)')
box off
b=legend({'Injury','Injury+Plasticity'},'Location','best');
legend('boxoff')


% Is it different than no plasticity
for i=1:20
    h(i)=ttest2(MagInj(:,i),MagP(:,i),'Alpha',.05/20);
end

figure
scatter(0:5:95,nanmean(MagInj),ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
scatter(0:5:95,nanmean(MagP),ones(1,20)*100,'filled','markerfacecolor',[153 0 0]/255)
errorbar(0:5:95,nanmean(MagInj),nanstd(MagInj),'.k')
errorbar(0:5:95,nanmean(MagP),nanstd(MagP),'.k')
K=[nanmean(MagP)+nanstd(MagP)];
M=0:5:95;
scatter(M(h>0),K(h>0)+.0025,'*k')
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-.007 .1])
xlabel('Percent Injury')
ylabel('Magnitude (Fraction)')
box off
b=legend({'Injury','Injury+Plasticity'},'Location','best');
legend('boxoff')


% Is it different than no plasticity
for i=1:20
    h(i)=ttest2(WidthInj(:,i),WidthP(:,i),'Alpha',.05/20);
end

figure
scatter(0:5:95,nanmean(WidthInj)*1000,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
scatter(0:5:95,nanmean(WidthP)*1000,ones(1,20)*100,'filled','markerfacecolor',[153 0 0]/255)
errorbar(0:5:95,nanmean(WidthInj)*1000,nanstd(WidthInj)*1000,'.k')
errorbar(0:5:95,nanmean(WidthP)*1000,nanstd(WidthP)*1000,'.k')
K=[nanmean(WidthP)+nanstd(WidthP)]*1000;
M=0:5:95;
scatter(M(h>0),K(h>0)+.5,'*k')
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 25])
xlabel('Percent Injury')
ylabel('FWHM (msec)')
box off
b=legend({'Injury','Injury+Plasticity'},'Location','best');
legend('boxoff')


