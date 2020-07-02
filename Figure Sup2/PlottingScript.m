
load('A')
figure
imagesc((FRMat(:,:,2)-FRMat(:,:,1))./FRMat(:,:,1)*100);
S=colorbar;
set(gca,'YDir','normal','YTick',[1 2 3],'YTickLabel',{'RS';'IB';'CH'},'XTickLabel',{'FS';'RS';'IB'})
ylabel(gca,'Excitatory')
xlabel(gca,'Inhibitory')
ylabel(S,'\Delta Firing Rate (%)')
title('25% Damage')


figure
imagesc((FRMat(:,:,3)-FRMat(:,:,1))./FRMat(:,:,1)*100);
S=colorbar;
set(gca,'YDir','normal','YTick',[1 2 3],'YTickLabel',{'RS';'IB';'CH'},'XTickLabel',{'FS';'RS';'IB'})
ylabel(gca,'Excitatory')
xlabel(gca,'Inhibitory')
ylabel(S,'\Delta Firing Rate (%)')
title('50% Damage')



