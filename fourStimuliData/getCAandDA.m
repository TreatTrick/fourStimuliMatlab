for i=1:10
    eval(['temp=CA',num2str(i),'(:,3);']);
    CA((i-1)*3750+1:3750*i,1)=temp;
    eval(['temp=DA',num2str(i),'(:,3);']);
    DA((i-1)*3750+1:3750*i,1)=temp;
end