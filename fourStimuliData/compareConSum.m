figure;
dir='down';
freq='7.5Hz';
maxScdIn=10;
ovnum=5;
lfre=7.1;
hfre=7.9;
for i=1:4
eval(['base=NW_',dir,'_',num2str(i),';']);
eval(['compare=WNA_',dir,'_',num2str(i),';']);
eval(['compare2=WA_',dir,'_',num2str(i),';']);

subplot(2,2,i);
hold on;
[basemean,basestd]=baseOverlapSum(base,ovnum,maxScdIn,lfre,hfre);
overlapDevideSum(base,ovnum,basemean,basestd,maxScdIn,lfre,hfre);
overlapDevideSum(compare,ovnum,basemean,basestd,maxScdIn,lfre,hfre);
overlapDevideSum(compare2,ovnum,basemean,basestd,maxScdIn,lfre,hfre);
legend(['NW\_',freq],['WNA\_',freq],['WA_\',freq]);
end