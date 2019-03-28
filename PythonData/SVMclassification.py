from sklearn.model_selection import train_test_split 
from sklearn.svm import SVC  
from sklearn.metrics import classification_report, confusion_matrix  
import secFFT
from sklearn.model_selection import cross_val_score

#data=loadmat('attentionChange-DXQ.mat')
#CA=data['CA']
#CA=CA.reshape(CA.size)
#DA=data['DA']
#DA=DA.reshape(DA.size)

#cutTime=5
#fs=250
#cutPoint=fs*cutTime
#section=int(CA.size/cutPoint)
#X=[]
#for i in range(0,section):
#    cutData=CA[i*cutPoint:(i+1)*cutPoint]
#    fftData=returnFFT(cutData,fs)
#    X.append(fftData);
#
#for i in range(0,section):
#    cutData=DA[i*cutPoint:(i+1)*cutPoint]
#    cutData.reshape(cutData.size)
#    fftData=returnFFT(cutData,fs)
#    X.append(fftData);
X=[] 
section=12
for i in range(4):
    mat=eval('WNAre'+str(i+1))
    xlist=secFFT.secPerTen(mat)
    X+=xlist
for i in range(4):
    mat=eval('WAre'+str(i+1))
    xlist=secFFT.secPerTen(mat)
    X+=xlist   
Y=[0]*section
Y+=[1]*section

clf =SVC(kernel='linear', C=1)
scores = cross_val_score(clf, X, Y, cv=12)
print("Accuracy: %0.2f (+/- %0.2f)" % (scores.mean(), scores.std() * 2))

#Xtrain, Xtest, ytrain, ytest=train_test_split(X,Y,test_size=0.2)
#svclassifier = SVC(kernel='linear')  
#svclassifier.fit(Xtrain, ytrain) 
#ypred = svclassifier.predict(Xtest) 
#print(confusion_matrix(ytest,ypred))  
#print(classification_report(ytest,ypred)) 