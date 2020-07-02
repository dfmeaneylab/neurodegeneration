load('B')
figure
subplot(2,1,1)
plot(0:.2:400,ENeuron,'k')
ylim([-80 40])
set(gca,'YTick',[-80:40:40])
ylabel('Voltage (mV)')
title('Excitatory Neuron')
box off
subplot(2,1,2)
plot(0:.2:400,INeuron,'color',[.5 .5 .5])
ylim([-80 40])
set(gca,'YTick',[-80:40:40])
ylabel('Voltage (mV)')
box off
title('Inhibitory Neuron')
xlabel('Time (msec)')




%% NeuroSphere
load('C')
PercentPopulation=.08;
NConnectionsPerNeuron=2;


figure
[x,y,z]=sphere;
h=surf(x,y,z);
set(h,'Visible','off')
hold on
% Neurons
scatter3(PositionXYZCoordinates(1:floor(800*PercentPopulation),1),...
    PositionXYZCoordinates(1:floor(800*PercentPopulation),2),...
    PositionXYZCoordinates(1:floor(800*PercentPopulation),3),...
    ones(size(1:floor(800*PercentPopulation)))*70,'Markerfacecolor',[1 31 91]/255,'MarkerEdgecolor',[1 31 91]/255)
scatter3(PositionXYZCoordinates(801:801+floor(200*PercentPopulation),1),...
    PositionXYZCoordinates(801:801+floor(200*PercentPopulation),2),...
    PositionXYZCoordinates(801:801+floor(200*PercentPopulation),3),...
    ones(size(801:801+floor(200*PercentPopulation)))*70,'Markerfacecolor',[153 0 0]/255,'MarkerEdgecolor',[153 0 0]/255)
set(gcf,'Position',  [680   481   487   497])
% Connections


C=Connectivity([1:floor(800*PercentPopulation) 801:801+floor(200*PercentPopulation)],...
    [1:floor(800*PercentPopulation) 801:801+floor(200*PercentPopulation)]);
[m,k]=find(C>0);
for i=1:floor(800*PercentPopulation)
    [q,w]=find(k==i);
    for j=1:NConnectionsPerNeuron
        Position=[linspace(PositionXYZCoordinates(i,1),...
            PositionXYZCoordinates(m(q(j)),1),...
            100);...
            linspace(PositionXYZCoordinates(i,2),...
            PositionXYZCoordinates(m(q(j)),2),...
            100);...
            linspace(PositionXYZCoordinates(i,3),...
            PositionXYZCoordinates(m(q(j)),3),...
            100);];
        for e=1:length(Position)
            Position(:,e)=Position(:,e)./sqrt(sum(Position(:,e).^2));
        end
        plot3(Position(1,:),Position(2,:),Position(3,:), 'color',[4,94,167]/255,'linewidth',1)
    end
end

C=Connectivity;
[m,k]=find(C<0);
for i=801:801+floor(200*PercentPopulation)
    [q,w]=find(k==i);
    for j=1:NConnectionsPerNeuron
        Position=[linspace(PositionXYZCoordinates(i,1),...
            PositionXYZCoordinates(m(q(j)),1),...
            100);...
            linspace(PositionXYZCoordinates(i,2),...
            PositionXYZCoordinates(m(q(j)),2),...
            100);...
            linspace(PositionXYZCoordinates(i,3),...
            PositionXYZCoordinates(m(q(j)),3),...
            100);];
        for e=1:length(Position)
            Position(:,e)=Position(:,e)./sqrt(sum(Position(:,e).^2));
        end
        plot3(Position(1,:),Position(2,:),Position(3,:), 'color',[194,0,77]/255,'linewidth',1)
    end
end





%% RasterPlots
load('D')
RasterPlot=false(max(A(:,2))+1,A(end,1)-A(1,1)+1);
RasterPlot(sub2ind(size(RasterPlot),A(:,2)+1,A(:,1)-A(1,1)+1))=1;
B=RasterPlot;

figure('units','normalized')
[y,x]=find(RasterPlot(:,1:10000));
h1=axes('position',[.13 .5 .77 .5]);
scatter(x(y<601)/5000,y(y<601),'marker','.','markeredgecolor',[.2 .2 .2])
set(gca,'Ytick',[])
ylim([0 600])
ylabel('Exc.')
h1.XAxis.Visible='off';
h2=axes('position',[.13 .3 .77 .15]);
scatter(x(y>600)/5000,y(y>600),'marker','.','markeredgecolor',[.7 .7 .7])
set(gca,'Ytick',[])
ylabel('Inh.')
xlabel('Time (s)')


[y,x]=find(B(:,4001:6000));
C=sum(B(:,4001:6000));
D=conv(C,ones(1,50),'same');
fig=figure('units','normalized');
set(fig,'defaultAxesColorOrder',[[0 0 0]; [0 0 0]]);
PositionVec=[.15 .6 .7 .3];
set(gcf,'Position',PositionVec)
h1=axes('position',[.13 .25 .77 .65]);
yyaxis left
scatter(x(y<801)/5000+.8,y(y<801),'marker','.','markeredgecolor',[.2 .2 .2])
hold on
h1.YTick=[];
ylim([0 800])
ylabel('Exc.')
xlabel('Time (s)')
yyaxis right
plot((.0002:.0002:.4)+.8,D./1000)
ylabel('Fraction')




