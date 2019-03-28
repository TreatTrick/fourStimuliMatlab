function []=overlapDevideSum(con,ovlnum,basemean,basestd,maxScdin,lfre,hfre)%con should be a column vector
Fs=250;
[row,~]=size(con);
maxScd=maxScdin;
for i=1:maxScd-ovlnum+1
    startPoint=Fs*(i-1)+1;
    stopPoint=startPoint+ovlnum*Fs-1;
          if stopPoint>row
             [~,p1]=newFFT(con(startPoint:end),250);
        else
         [~,p1]=newFFT(con(startPoint:stopPoint),250);
          end
        startPos3=fix(ovlnum*250/2*lfre/125);
        stopPos3=fix(ovlnum*250/2*hfre/125);
        p4=p1(startPos3:stopPos3);
        plotMat3(i)=max(p4);

end

CM={'r','b','m','g','k'};

mat3mean=plotMat3-basemean;
mat3std=mat3mean/basestd;%standard variable
plot(mat3std);
axis([1 maxScd-ovlnum+1 -6 6]);
xlabel('section');
ylabel('amplitude');
end