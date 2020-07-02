%% A


% Is it different than baseline? (How do I display this)
[p,tbl,stats] = anova1(YPlasticity);
multcompare(stats);
% 60% injury ns
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
scatter(M(h>0),K(h>0)+6/30,'*k','linewidth',1.5)
plot([0 60],[5.5 5.5],'linewidth',1.5,'color',[153 0 0]/255)
text(30, 5.5*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[153 0 0]/255)
xlim([-2.5 100])
ylim([0 6])
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:2:6])
box off
xlabel('Percent Injury')
ylabel('Firing Rate (Hz)')
s=legend({'Injury','Injury+Plasticity'},'Location','NorthEast');
legend('boxoff')
set(s,'Position',[0.620833342274030,0.786111115084754,0.373214276773589,0.144047615073976]);

%%  B
load('B')

% Is it different than baseline? 
[p,tbl,stats] = anova1(COVMatP);
multcompare(stats);
% 45% +65-75% injury ns
% Is it different than no plasticity
for i=1:20
    h(i)=ttest2(COVMat(:,i),COVMatP(:,i),'Alpha',.05/20);
end


figure
bar(0:5:95,mean(COVMat)*100,'barwidth',1,'facecolor',[1 31 91]/255,'linewidth',1.5)
hold on
bar(0:5:95,mean(COVMatP)*100,'barwidth',1,'facecolor',[153 0 0]/255,'linewidth',1.5)
errorbar(0:5:95,mean(COVMatP)*100,zeros(1,20),std(COVMatP)*100,'k.')
errorbar(0:5:95,mean(COVMat)*100,zeros(1,20),std(COVMat)*100,'k.')
K=max([mean(COVMatP)*100+std(COVMatP)*100;mean(COVMat)*100+std(COVMat)*100]);
M=0:5:95;
scatter(M(h>0),K(h>0)+1/30,'*k','linewidth',1.5)
plot([0 45],[1 1]*100,'linewidth',1.5,'color',[153 0 0]/255)
text(45/2, 1*100*1.075,'NS','HorizontalAlignment','center','fontsize',20,'color',[153 0 0]/255)
xlim([-2.5 100])
ylim([0 1.7*100])
set(gca,'XTick',[0:25:100])
set(gca,'YTick',[0:.25:1.5]*100)
box off
xlabel('Percent Injury')
ylabel('CoV ISI (%)')
s=legend({'Injury','Injury+Plasticity'},'Location','NorthEast');
legend('boxoff')
%% RasterPlots
load('C')
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

RasterPlot=false(max(PlasticityA(:,2))+1,PlasticityA(end,1)-PlasticityA(1,1)+1);
RasterPlot(sub2ind(size(RasterPlot),PlasticityA(:,2)+1,PlasticityA(:,1)-PlasticityA(1,1)+1))=1;
B=RasterPlot;
figure('units','normalized')
[y,x]=find(B(:,1:10000));
Title='50 Percent Injury + Plasticity';
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
cd('J:\Paper\RA_617_R_RNDt_N')
load('FrequencyStack')
NInj=NumPeaksMat;
PInj=PeaksMat;
WInj=WidthsMat;
cd('J:\Paper\P_N\RA_617_R_RNDt_PN')
load('FrequencyStack')
NP=NumPeaksMat;
PP=PeaksMat;
WP=WidthsMat;

for i=1:20
    h(i)=ttest2(NInj(:,i),NP(:,i),'Alpha',.05/20);
end

figure
bar(0:5:95,mean(NP-NInj)./5/60,'barwidth',1,'facecolor',[153 0 0]/255,'linewidth',1.5)
hold on
errorbar(0:5:95,mean(NP-NInj)./5/60,std(NP-NInj)./5/60,'.k')
K=[mean(NP-NInj)+std(NP-NInj)]/5/60;
M=0:5:95;
scatter(M(h>0),K(h>0)+5/30,'*k','linewidth',1.5)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-1 4])
xlabel('Percent Injury')
ylabel({'\Delta Frequency (Oscillation / sec)'})
plot([70 70],[-3 15],'--','linewidth',1.5,'color',[1 31 91]/255)
plot([75 75],[-3 15],'--','linewidth',1.5,'color',[153 0 0]/255)
box off

for i=1:20
    h(i)=ttest2(PInj(:,i),PP(:,i),'Alpha',.05/20);
end

figure
bar(0:5:75,nanmean(PP(:,1:16)-PInj(:,1:16))./20,'barwidth',1,'facecolor',[153 0 0]/255,'linewidth',1.5)
hold on
errorbar(0:5:75,nanmean(PP(:,1:16)-PInj(:,1:16))/20,nanstd(PP(:,1:16)-PInj(:,1:16))/20,'.k')
K=[mean(PP(:,1:16)-PInj(:,1:16))+std(PP(:,1:16)-PInj(:,1:16))]/20;
M=0:5:75;
scatter(M(h>0),K(h>0)+.025/30,'*k','linewidth',1.5)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
set(gca,'YTick',0:.01:.02)
set(gca,'YTickLabel',{'0','0.01','0.02'})
ylim([-.005 .02])
xlabel('Percent Injury')
ylabel({'\Delta Magnitude (Fraction)'})
plot([70 70],[-3 15],'--','linewidth',1.5,'color',[1 31 91]/255)
plot([75 75],[-3 15],'--','linewidth',1.5,'color',[153 0 0]/255)
box off


for i=1:20
    h(i)=ttest2(WInj(:,i),WP(:,i),'Alpha',.05/20);
end

figure
bar(0:5:75,nanmean(WP(:,1:16)-WInj(:,1:16))*1000,'barwidth',1,'facecolor',[153 0 0]/255,'linewidth',1.5)
hold on
errorbar(0:5:75,nanmean(WP(:,1:16)-WInj(:,1:16))*1000,nanstd(WP(:,1:16)-WInj(:,1:16))*1000,'.k')
K=[mean(WP(:,1:16)-WInj(:,1:16))+std(WP(:,1:16)-WInj(:,1:16))]*1000;
M=0:5:75;
scatter(M(h>0),K(h>0)+12/30,'*k','linewidth',1.5)
set(gca,'xtick',0:25:100)
xlim([-2.5 100])
ylim([-2 10])
xlabel('Percent Injury')
ylabel({'\Delta FWHM (msec)'})
plot([70 70],[-3 15],'--','linewidth',1.5,'color',[1 31 91]/255)
plot([75 75],[-3 15],'--','linewidth',1.5,'color',[153 0 0]/255)
box off

