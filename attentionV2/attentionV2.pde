//<>// //<>// //<>//
import oscP5.*; // oscP5 and neP5 is for communicating with openBCI-GUI
import netP5.*;

Stimulus s1;
//Stimulus s2;
//Stimulus s3;
//Stimulus s4;


OscP5 oscP5;//initialize OscP5 class
NetAddress myBroadcastLocation; //define a new NetAddress class to save the ip and port of openBCI-GUI
OscMessage m;//defien a message 


float flickerTime=60100;//the checkerboard's flickering time

boolean changeFlag=true;
int noFlashTime=5000;
int tikMM=0;
int tokMM=0;
int backTik=0;
int backTok=0;
boolean backTikFlag=true;
boolean resetFlagMM=true;
boolean resetFlagML=true;
boolean resetFlagMH=true;
boolean conChangeFlag=false;
int dh=150;
int letterIndex=0;
int letterIndex2=0;
int hfEvConT=25000;
int triangleIntensity=255;
int squareLateral=270;
int transLength=0;
int intensityChange=90;
int tikLetter=0;
int tokLetter=0;
int sampleIndex;
int numsA=0;
char randomLetter;
String[] story;
String storyList[];
String storyList2[];
String array[]={"restTime","noWords", "wordsNoAtten", "wordsAtten"};
int iArray = array.length;
PFont font;
int tPerSample=10100;
float tPerLetter;
int loopNum=0;
int cueTime=10000;
int staticTime=2000;
int tikStatic, tokStatic;
Arrows[] astr=new Arrows[4];
boolean staticFlag=true;
int loopTotal=12;

void setup() {
  noCursor();
  background(0);
  fullScreen();
  oscP5 = new OscP5(this, 12000);
  myBroadcastLocation=new NetAddress("127.0.0.1", 32000);

  s1=new Stimulus(250, CENTER, width/2, height/2, 7.5);
  //s2=new Stimulus(250, CENTER, width-175, height/2, 6.57);
  //s3=new Stimulus(250, CENTER, width/2, height-175, 7.5);
  //s4=new Stimulus(250, CENTER, 175, height/2, 8.57);
  
  
  //ellipseMode(CENTER);
  font = createFont("Arial", 25, true);
  textFont(font, 25);
  //noStroke();
  //textAlign(CENTER);
  story=loadStrings("story.txt");
  storyList=split(story[0], ' ');
  storyList2=split(story[0], ' ');
  tPerLetter=tPerSample*loopTotal/storyList.length;
  // suffleArray(array);//Random sort
}


void draw() {
  if (iArray>array.length-1) {
    loopNum+=1;
    println("loopNum "+loopNum);
    iArray=0;
    suffleArray(array);
    if (loopNum==loopTotal+1) {
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("black, NaN");
    oscP5.flush(m, myBroadcastLocation);
      exit();
    }
  }
  if (conChangeFlag==false) {
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("black, NaN");
    // println("papada "+iArray);
    oscP5.flush(m, myBroadcastLocation);
    if (backTikFlag==true) {
      backTikFlag=false;  
      backTik=millis();
    }
    backTok=millis();
    if (backTok-backTik<cueTime) {
      background(0);
      textFont(font, 30);
      fill(255);
      switch(array[iArray]) {
      case "restTime":
        fill(255);
        text("Rest Time for 10s", width/2, height/2);
        break;
      case "noWords":
        text("condition 1\n No word in this condition, focus on the\"square\"", width/2, height/2);
        break;
      case "wordsNoAtten":
        fill(255);
        text("condition 2\n there are words in this condition\n BUT focus on \"SQUARE\" not \"words\"", width/2, height/2);
        break;
      case "wordsAtten":
        fill(255);
        text("condition 3\nthere are words in this condition\nfocus on \"WORDS\" and try to read the story", width/2, height/2);
        break;
      case "":
      }
    } else {
      conChangeFlag=true;
      backTikFlag=true;
    }
  }

  //println("memeda "+iArray);
  if (conChangeFlag==true) {
    background(0);
    switch(array[iArray]) {
    case "restTime":
      blackScreen();
      break;
    case "noWords":
      //if (staticFlag==true) {
      //  tikStatic=millis();
      //  println("wordsNoAtten reset");
      //  arlt=randomArrow(astr,astr.length);
      //  staticFlag=false;
      //}
      //tokStatic=millis();
      //if (tokStatic-tikStatic<staticTime) {
      //  arlt.display(100, 100, 100);
      //  s1.displayStatic(255);
      //  s2.displayStatic(255);
      //  s3.displayStatic(255);
      //  s4.displayStatic(255);
      //  println("wordsNoAtten reset finish");
      //} else {
      noWords();
      //}
      break;
    case "wordsNoAtten":
      //if (staticFlag==true) {
      //  tikStatic=millis();
      //  println("wordsNoAtten reset");
      //  arlt=randomArrow(astr,astr.length);
      //  staticFlag=false;
      //}
      //tokStatic=millis();
      //if (tokStatic-tikStatic<staticTime) {
      //  arlt.display(255, 0, 0);
      //  s1.displayStatic(255);
      //  s2.displayStatic(255);
      //  s3.displayStatic(255);
      //  s4.displayStatic(255);
      //  println("wordsNoAtten reset finish");
      //} else {
      wordsNoAtten();
      //}
      break;
    case "wordsAtten":
      //if (staticFlag==true) {
      //  tikStatic=millis();
      //  println("wordsNoAtten reset");
      //  arlt=randomArrow(astr,astr.length);
      //  staticFlag=false;
      //}
      //tokStatic=millis();
      //if (tokStatic-tikStatic<staticTime) {
      //  arlt.display(0, 255, 0);
      //  s1.displayStatic(255);
      //  s2.displayStatic(255);
      //  s3.displayStatic(255);
      //  s4.displayStatic(255);
      //  println("wordsAtten reset finish");
      //} else {
      wordsAtten();
      //}
      break;
    }
  }
}

void keyPressed() {
  //if ((key=='A'||key=='a')&& (sentence.charAt(letterIndex)=='A'||(sentence.charAt(letterIndex)=='a'))){
  //  numsA=+1;
  // }
  exit();
}