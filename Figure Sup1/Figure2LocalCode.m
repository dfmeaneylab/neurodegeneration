%% A

load('A')
YInjured=FRMat/60/5;

% Is it different than baseline? 
[p,tbl,stats] = anova1(YInjured);
c=multcompare(stats);



figure
bar(0:5:95,mean(YInjured),'barwidth',1,'facecolor',[1 31 91]/255,'linewidth',1.5)
hold on
errorbar(0:5:95,mean(YInjured),zeros(1,20),std(YInjured),'k.')
K=max([mean(YInjured)+std(YInjured);mean(YInjured)+std(YInjured)]);
M=0:5:95;
plot([0 35],[5.25 5.25],'linewidth',1.5,'color',[1 31 91]/255)
text(35/2, 5.25*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
xlim([-2.5 100])
ylim([0 6])
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:2:6])
box off
xlabel('Percent Injury')
ylabel('Firing Rate (Hz)')



%% COV



[p,tbl,stats] = anova1(COVMat);
c=multcompare(stats);
% 70 is first sig

figure
bar(0:5:95,mean(COVMat)*100,'barwidth',1,'facecolor',[1 31 91]/255,'linewidth',1.5)
hold on
errorbar(0:5:95,mean(COVMat)*100,zeros(1,20),std(COVMat)*100,'k.')
K=max([mean(COVMat)*100+std(COVMat)*100;mean(COVMat)*100+std(COVMat)*100]);
M=0:5:95;
plot([0 70],[1 1]*100,'linewidth',1.5,'color',[1 31 91]/255)
text(70/2, 1*1.075*100,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
xlim([-2.5 100])
ylim([0 1.5]*100)
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:.25:1.5]*100)
box off
xlabel('Percent Injury')
ylabel('CoV ISI (%)')
%% C-E
load('C')

% Is it different than baseline? 
[p,tbl,stats] = anova1(NumPeaksMat);
c=multcompare(stats);
% 10% first sig

% Is it different than baseline? 
[p,tbl,stats] = anova1(PeaksMat);
c=multcompare(stats);
% 10% first sig

% Is it different than baseline?
[p,tbl,stats] = anova1(WidthsMat);
c=multcompare(stats);
% 60% first sig

figure
scatter(0:5:95,mean(NumPeaksMat)./5/60,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
errorbar(0:5:95,mean(NumPeaksMat)./5/60,std(NumPeaksMat)./5/60,'.k')
plot([0 5],[14 14],'k','linewidth',1.5,'color',[1 31 91]/255)
text(5/2, 14*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 15])
xlabel('Percent Injury')
ylabel('Frequency (Oscillation / sec)')
plot([80 80],[-3 15],'--','linewidth',1.5,'color',[1 31 91]/255)
box off


figure
scatter(0:5:95,mean(PeaksMat)/20,ones(1,20)*100,'filled','markerfacecolor',[1 31 91]/255)
hold on
errorbar(0:5:95,mean(PeaksMat)/20,std(PeaksMat)/20,'.k')
plot([0 5],[.09 .09],'linewidth',1.5,'color',[1 31 91]/255)
text(5/2, .09*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
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
plot([0 55],[23 23],'k','linewidth',1.5,'color',[1 31 91]/255)
text(55/2, 23*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[1 31 91]/255)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 25])
xlabel('Percent Injury')
ylabel('FWHM (msec)')
box off

