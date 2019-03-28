
from numpy.fft import fft
from scipy.signal import butter, filtfilt
import matplotlib.pyplot as plt
import numpy as np

def butter_bandpass(lowcut, highcut, fs, order=6):
    nyq = 0.5 * fs
    low = lowcut / nyq
    high = highcut / nyq
    b,a= butter(order, [low, high], btype='band')
    return b,a

def butter_bandstop(lowcut, highcut, fs, order=6):
    nyq = 0.5 * fs
    low = lowcut / nyq
    high = highcut / nyq
    b2, a2 = butter(order, [low, high], btype='bandstop')
    return b2, a2


def butter_bandpass_filter(data, lowcut, highcut, fs, order=5):
    b,a = butter_bandpass(lowcut, highcut, fs, order=order)
    y = filtfilt(b,a, data)
    return y

def butter_bandstop_filter(data, lowcut, highcut, fs, order=6):
    b2, a2 = butter_bandstop(lowcut, highcut, fs, order=order)
    y = filtfilt(b2, a2, data)
    return y

def plotFFT(mat, fs):
    plt.figure()
#    plt.subplot(2,2,1)
#    plt.plot(mat)
    mat=butter_bandstop_filter(mat,49,50,fs,order=5)
    mat=butter_bandpass_filter(mat,4,30,fs,order=5)
#    plt.subplot(2,2,2)
#    plt.plot(mat)
    Ymat=fft(mat)
    L=Ymat.size
    if L%2==1:
        L=L-1
    P2 = abs(Ymat/L)
#    plt.subplot(2,2,3)
#    plt.plot(P2)
    P1=P2[:int(L/2)]
    P1=2*P1
    f=np.arange(0,int(L/2))*fs/L
#    plt.subplot(2,2,4)
    plt.axis([3,30,0,6])
    plt.plot(f,P1)
    plt.show()
    

