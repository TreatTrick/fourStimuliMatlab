import returnFFT
import math
def secFFT(mat):
    p3=[]
    Fs=250
    ovnum=5
    time=10
    matlen=len(mat)
    maxScd=time-ovnum+1
    pPerScd=Fs*ovnum
    for i in range(0,maxScd):
        startPoint=int(Fs*(i))
        stopPoint=int(startPoint+pPerScd-1)
        if stopPoint>matlen:
            p1=returnFFT.returnFFT(mat[startPoint:],Fs)
        else:  
            p1=returnFFT.returnFFT(mat[startPoint:stopPoint],Fs)
        startPosition=int(math.floor(len(p1)*7.1/125))
        stopPosition=int(math.floor(len(p1)*7.9/125))
        p2=p1[startPosition:stopPosition]
        p2=max(p2)
        p3.append(p2)
    return p3

def secPerTen(mat):
    time=30
    sec=3
    tPerSec=time/sec
    plist=[]
    for i in range(sec):
        matIn=mat[int(i*tPerSec*250):int((i+1)*tPerSec*250-1)]
        p3=secFFT(matIn)
        plist.append(p3)
    return plist

        
    
    
#secFFT(WNAre1[0:10*250-1])
            

