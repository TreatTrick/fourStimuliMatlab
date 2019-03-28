function [] = dataClassify(textfile)
fidin = fopen(textfile,'r');
last=250*10;
nline=0;
allDataRow=1;
% BTRow=1;
para1=5;
deloop1=1;
deloop2=1;
deloop3=1;
deloop4=1;
while ~feof(fidin)
    tline = fgetl(fidin);
    nline = nline + 1;
    if(nline>6)
        splitcell=regexp(tline,',','split');
        str=splitcell{1};
        dStr=splitcell{2};
        loopNum=splitcell{3};
        
        alldata(allDataRow,:)=str2double(splitcell{para1});
        allDataRow=allDataRow+1;
        switch(str)
            %             case 'black'
            %                 BT(BTRow,:) = str2double(splitcell{para1});
            %                 BTRow=BTRow+1;
            case 'restTime'
                if str2num(loopNum(2:end))>=deloop1
                    row=0;
                    deloop1=deloop1+1;
                    if ~exist(['RTseries',dStr(2:end)])
                        eval(['RTseries',dStr(2:end),'=1;'])
                    else
                        eval(['RTseries',dStr(2:end),'=','RTseries',dStr(2:end),'+1;'])
                    end
                    series=num2str(eval(['RTseries',dStr(2:end)]));
                else
                    series=num2str(eval(['RTseries',dStr(2:end)]));
                    [row,~]=size(eval(['RT_',dStr(2:end),'_',series]));
                end
                eval(['RT_',dStr(2:end),'_',series,'(row+1,:) = str2double(splitcell{para1});'])
            case 'wordsNoAtten'
                if str2num(loopNum(2:end))>=deloop2
                    row=0;
                    deloop2=deloop2+1;
                    if ~exist(['WNAseries',dStr(2:end)])
                        eval(['WNAseries',dStr(2:end),'=1;'])
                    else
                        eval(['WNAseries',dStr(2:end),'=','WNAseries',dStr(2:end),'+1;'])
                    end
                    series=num2str(eval(['WNAseries',dStr(2:end)]));
                else
                    series=num2str(eval(['WNAseries',dStr(2:end)]));
                    [row,~]=size(eval(['WNA_',dStr(2:end),'_',series]));
                end
                eval(['WNA_',dStr(2:end),'_',series,'(row+1,:) = str2double(splitcell{para1});'])
            case 'noWords'
                if str2num(loopNum(2:end))>=deloop3
                    row=0;
                    deloop3=deloop3+1;
                    if ~exist(['NWseries',dStr(2:end)])
                        eval(['NWseries',dStr(2:end),'=1;'])
                    else
                        eval(['NWseries',dStr(2:end),'=','NWseries',dStr(2:end),'+1;'])
                    end
                    series=num2str(eval(['NWseries',dStr(2:end)]));
                else
                    series=num2str(eval(['NWseries',dStr(2:end)]));
                    [row,~]=size(eval(['NW_',dStr(2:end),'_',series]));
                end
                eval(['NW_',dStr(2:end),'_',series,'(row+1,:) = str2double(splitcell{para1});'])
            case 'wordsAtten'
                if str2num(loopNum(2:end))>=deloop4
                    row=0;
                    deloop4=deloop4+1;
                    if ~exist(['WAseries',dStr(2:end)])
                        eval(['WAseries',dStr(2:end),'=1;'])
                    else
                        eval(['WAseries',dStr(2:end),'=','WAseries',dStr(2:end),'+1;'])
                    end
                    series=num2str(eval(['WAseries',dStr(2:end)]));
                else
                    series=num2str(eval(['WAseries',dStr(2:end)]));
                    [row,~]=size(eval(['WA_',dStr(2:end),'_',series]));
                end
                eval(['WA_',dStr(2:end),'_',series,'(row+1,:) = str2double(splitcell{para1});'])
        end
    end
end
% for i=1:4
%     eval(['WNA',num2str(i),'=WNA',num2str(i),'(1:last);'])
%     % NW=NW(1:last
%     eval(['WA',num2str(i),'=WA',num2str(i),'(1:last);'])
% end

save(['StimulusWithWords_',textfile(1:end-4),'.mat'])
fclose(fidin);
end