con={'MH','ML','MM'};
d_notch1 = designfilt('bandstopiir','FilterOrder',4, ...
    'HalfPowerFrequency1',49,'HalfPowerFrequency2',51, ...
    'DesignMethod','butter','SampleRate',250);

d_butter = designfilt('bandpassiir','FilterOrder',2, ...
    'HalfPowerFrequency1',2,'HalfPowerFrequency2',30, ...
    'SampleRate',250);
for i=1:3
figure;
mat=eval(con{i});
mat=mat(:,3);
filteredmat = filtfilt(d_butter, filtfilt(d_notch1, mat));
plot(filteredmat(1:end/2));
hold on;
x=(5001:1:10000);
plot(x,filteredmat(end/2+1:end))
ylim([-60,60]);
title(['XQ-2\_',con{i}]);
end