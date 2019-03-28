
from numpy.fft import fft
from scipy.signal import butter, filtfilt

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

def returnFFT(mat, fs):
    mat=butter_bandstop_filter(mat,49,50,fs,order=5)
    mat=butter_bandpass_filter(mat,4,30,fs,order=5)

    Ymat=fft(mat)
    L=Ymat.size
    if L%2==1:
        L=L-1
    P2 = abs(Ymat/L)
    P1=P2[:int(L/2)]
    P1=2*P1
    return P1

    

