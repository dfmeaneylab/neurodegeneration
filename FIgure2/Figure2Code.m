%% A
load('A')
YInjured=y;

% Is it different than baseline? 
[p,tbl,stats] = anova1(YInjured);
c=multcompare(stats);
% 15% damage is first significant



figure
bar(0:5:95,mean(YInjured),'barwidth',1,'facecolor',[1 31 91]/255,'linewidth',1.5)
hold on
errorbar(0:5:95,mean(YInjured),zeros(1,20),std(YInjured),'k.')
K=max([mean(YInjured)+std(YInjured);mean(YInjured)+std(YInjured)]);
M=0:5:95;
plot([0 10],[5.25 5.25],'linewidth',1.5,'color',[1 31 91]/255)
text(5, 5.25*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
xlim([-2.5 100])
ylim([0 6])
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:2:6])
box off
xlabel('Percent Injury')
ylabel('Firing Rate (Hz)')


%% B
load('B')
[p,tbl,stats] = anova1(COVMat);
c=multcompare(stats);
% 60% damage is first significant

figure
bar(0:5:95,mean(COVMat)*100,'barwidth',1,'facecolor',[1 31 91]/255,'linewidth',1.5)
hold on
errorbar(0:5:95,mean(COVMat)*100,zeros(1,20),std(COVMat)*100,'k.')
K=max([mean(COVMat)+std(COVMat);mean(COVMat)+std(COVMat)]);
M=0:5:95;
plot([0 55],[1 1]*100,'linewidth',1.5,'color',[1 31 91]/255)
text(55/2, 1*1.075*100,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
xlim([-2.5 100])
ylim([0 150])
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:25:150])
box off
xlabel('Percent Injury')
ylabel('CoV ISI (%)')

%% RasterPlots
load('C')
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
Title='50 Percent Injury';
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


%% D
load('D')

% Is it different than baseline? 
[p,tbl,stats] = anova1(NumPeaksMat);
c=multcompare(stats);
% 5% first sig

% Is it different than baseline?
[p,tbl,stats] = anova1(PeaksMat);
c=multcompare(stats);
% 5% first sig

% Is it different than baseline?
[p,tbl,stats] = anova1(WidthsMat);
c=multcompare(stats);
% 80% first sig

figure
scatter(0:5:95,mean(NumPeaksMat)./5/60,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
errorbar(0:5:95,mean(NumPeaksMat)./5/60,std(NumPeaksMat)./5/60,'.k')
plot([0 95],[13.25 13.25],'linewidth',1.5,'color',[1 31 91]/255)
text(47.5, 13.25*1.075,'*','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 15])
xlabel('Percent Injury')
ylabel('Frequency (Oscillation / sec)')
plot([70 70],[-3 15],'--','linewidth',1.5,'color',[1 31 91]/255)
box off


figure
scatter(0:5:95,mean(PeaksMat)/20,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
errorbar(0:5:95,mean(PeaksMat)/20,std(PeaksMat)/20,'.k')
plot([0 70],[.09 .09],'linewidth',1.5,'color',[1 31 91]/255)
text(35, .09*1.075,'*','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-.007 .1])
xlabel('Percent Injury')
ylabel('Magnitude (Fraction)')
box off


figure
scatter(0:5:95,mean(WidthsMat)*1000,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
errorbar(0:5:95,mean(WidthsMat)*1000,std(WidthsMat)*1000,'.k')
plot([0 70],[23 23],'k','linewidth',1.5,'color',[1 31 91]/255)
text(70/2, 23*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 25])
xlabel('Percent Injury')
ylabel('FWHM (msec)')
box off


