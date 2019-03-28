dir='down';
freq='7.5';
figure;
for i=1:4
    subplot(2,2,i);
    eval(['NewPlotFFT(NW_',dir,'_',num2str(i),',250,''r'');']);
    title(['NW\_',freq,'Hz\_',num2str(i)]);
end

figure;
for i=1:4
    subplot(2,2,i);
    eval(['NewPlotFFT(WNA_',dir,'_',num2str(i),',250,''b'');']);
     title(['WNA\_',freq,'Hz\_',num2str(i)]);
end

figure;
for i=1:4
    subplot(2,2,i);
    eval(['NewPlotFFT(WA_',dir,'_',num2str(i),',250,''g'');']);
     title(['WA\_',freq,'Hz\_',num2str(i)]);
end