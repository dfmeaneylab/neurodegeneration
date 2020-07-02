%% Index scatter

load('A')
[r,m,b] = regression(Index',ActivityFraction');
figure
h=scatter(Index,ActivityFraction,ones(1,800)*20,...
    'MarkerFaceColor',[1 31 91]/255,'MarkerEdgeColor',[1 31 91]/255)
text(0.25,.2,'r=0.92,P<.001','fontsize',16)
hold on
x=[-1 1]
y=m*x+b;
plot(x,y,'k')
ylim([0 1])
xlabel({'Input - Output';'Input + Output'})
ylabel('Activity Rate (Fraction)')

%% Oscillation Split
load('B')

[y,x]=find(B(:,1158-(-100:100)));
C=sum(B(1:800,1:5000));
D=conv(C,ones(1,50),'same');
fig=figure('units','normalized');
set(fig,'defaultAxesColorOrder',[[0 0 0]; [0 0 0]]);
h1=axes;
yyaxis left
scatter(x(y<801)/5000-0.0065,y(y<801),'marker','.','markeredgecolor',[.2 .2 .2])
hold on
h1.YTick=[];
ylim([0 800])
ylabel('Exc.')
xlabel('Time (s)')
yyaxis right
plot((.0002:.0002:1)-.2316+.02-0.0065,D./1000)
xlim([0 .0270])
ylabel('Fraction')
plot([.0135-0.0027 .0135-0.0027],[0 .15],'--')
plot([.0135-0.0027*3 .0135-0.0027*3],[0 .15],'--')
plot([.0135+0.0027 .0135+0.0027],[0 .15],'--')
plot([.0135+0.0027*3 .0135+0.0027*3],[0 .15],'--')

text(.0135-0.0027*3,.155,'Start','FontSize',20,'HorizontalAlignment','center')
text(.0135,.155,'Peak','FontSize',20,'HorizontalAlignment','center')
text(.0135+0.0027*3,.155,'End','FontSize',20,'HorizontalAlignment','center')


%% Probability Map
load('C')
[~,IEx]=sort(NumberOfSpikes(1:800));
[~,IInh]=sort(NumberOfSpikes(801:1000));


figure('Position', [680   209   618   769])
subplot(5,1,1:4)
imagesc(MeanMatrix(IEx,:))
hold on
plot([2.5 2.5],[0 800],'w--')
plot([4.5 4.5],[0 800],'w--')
plot([6.5 6.5],[0 800],'w--')
plot([8.5 8.5],[0 800],'w--')
set(gca,'YTick',[100 400 700])
set(gca,'YTickLabel',{'Low Index';'Exc';'High Index'})
set(gca,'YTickLabelRotation',90)
set(gca,'XTick',[])
h=colorbar;
ylabel(h,'Fraction')
subplot(5,1,5)
imagesc(MeanMatrix(IInh+800,:))
hold on
plot([2.5 2.5],[0 800],'w--')
plot([4.5 4.5],[0 800],'w--')
plot([6.5 6.5],[0 800],'w--')
plot([8.5 8.5],[0 800],'w--')
set(gca,'XTick',[2.5 5.5  8.5])
set(gca,'XTickLabel',{'Start';'Peak';'End'})
set(gca,'YTick',[100])
set(gca,'YTickLabel','Inh')
set(gca,'YTickLabelRotation',90)
colorbar('Visible','off')

%% Scatter Quintile Timing

load('D')
figure
errorbar(mean(EScatterMean),std(EScatterMean),'ok','MarkerFaceColor','k','markersize',8)
hold on
errorbar(mean(IScatterMean),std(IScatterMean),'^k','MarkerFaceColor',[.5 .5 .5],'markersize',8)
box off
legend('Excitatory','Inhibitory')
legend('boxoff')
ylim([0 1])
ylabel('Average Activity Fraction')
set(gca,'XTick',[1:5])
xlabel('Quintile')
set(gcf,'Position',[680 558 560/3*2 420])



%% BarPlot Fraction of Spikes within each bin


load('E')
EXCNEURONS=SeNStack.*repmat((1:5),10,1);
INHNeurons=SinhNStack.*repmat((1:5),10,1);
[h23,p23]=kstest2(EXCNEURONS(:),INHNeurons(:)) %% Not Significant P=.24

figure
h=bar([mean(SeNStack);mean(SinhNStack)]','barwidth',1);
hold on
errorbar((1:5)-.285/2,mean(SeNStack),std(SeNStack),'.k')
errorbar((1:5)+.285/2,mean(SinhNStack),std(SinhNStack),'.k')
h(1).FaceColor='k';
h(2).FaceColor=[.5 .5 .5];
box off
ylabel('Fraction of Spikes')
xlabel('Quintile')
m=legend('Excitatory','Inhibitory');
legend('boxoff')
set(gcf,'Position',[680 558 560/3*2 420])
set(m,'Position',[.51 .79 .3937 .144]);
%% TIME TO PEAK

load('F')
figure
h=bar(1,[mean(EPTStack)],'barwidth',.4);
hold on
h2=bar(2,mean(IPTStack),'barwidth',.4,'facecolor',[.5 .5 .5]);
errorbar(1:2,[mean(EPTStack);mean(IPTStack)],[std(EPTStack);std(IPTStack)],'.k')
box off
set(gca,'XTick',[1 2]);
set(gca,'XTickLabel',{'Excitatory','Inhibitory'});
ylabel('Fraction Latency to Peak')
set(gcf,'Position',[680   500   465   478]);

