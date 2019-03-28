function [f,P1]=newFFT(mat,Fs)   % f is the FFT's x axis, P1 is the FFT's y axis, lg is the function plot's return value
%mat should be column vector.Fs is sampling frequency
d_notch1 = designfilt('bandstopiir','FilterOrder',4, ...
    'HalfPowerFrequency1',49,'HalfPowerFrequency2',51, ...
    'DesignMethod','butter','SampleRate',250);

d_butter = designfilt('bandpassiir','FilterOrder',2, ...
    'HalfPowerFrequency1',2,'HalfPowerFrequency2',30, ...
    'SampleRate',250);

filteredmat = filtfilt(d_butter, filtfilt(d_notch1, mat));

%plot(filteredmat);

Y = fft(filteredmat);
[row,~]=size(filteredmat);
L=row;
if mod(L,2)==1
    L=L-1;
end

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
end