void blackScreen() { //<>// //<>//
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
  }
  tokMM=millis();
  if (tokMM-tikMM<10000) {
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("restTime, NaN");
    oscP5.flush(m, myBroadcastLocation);
    background(0);
  } else {
    conChangeFlag=false;
    resetFlagMM=true;
    iArray+=1;
  }
}

void noWords() {
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
  }
  tokMM=millis();
  tokLetter=millis();
  if (tokMM-tikMM<tPerSample) {
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("noWords, "+"loopNum"+loopNum);
    oscP5.flush(m, myBroadcastLocation);
    s1.display(255);
    //s2.display(255);
    //s3.display(255);
    //s4.display(255);
    //arlt.display(100, 100, 100);
  } else {
    conChangeFlag=false;
    resetFlagMM=true;
    iArray+=1;
    staticFlag=true;
  }
}



void wordsNoAtten() {
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
    tikLetter=millis();
  }
  tokMM=millis();
  tokLetter=millis();
  if (tokMM-tikMM<tPerSample) {
    if (tokLetter-tikLetter>tPerLetter) {
      letterIndex+=1;
      tikLetter=millis();
    }
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("wordsNoAtten, "+"loopNum"+loopNum);
    oscP5.flush(m, myBroadcastLocation);
    s1.display(255);
    textFont(font, 25);
    s1.displayText(storyList[letterIndex], 0, font); 

  } else {
    tikMM=millis();
    tikLetter=millis();
    conChangeFlag=false;
    resetFlagMM=true;
    iArray+=1;
    staticFlag=true;
  }
}



void wordsAtten() {
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
    tikLetter=millis();
  }
  tokMM=millis();
  tokLetter=millis();
  if (tokMM-tikMM<tPerSample) {
    if (tokLetter-tikLetter>tPerLetter) {
      letterIndex2+=1;
      tikLetter=millis();
    }
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("wordsAtten, "+"loopNum"+loopNum);
    oscP5.flush(m, myBroadcastLocation);
    s1.display(255);
    textFont(font, 25);
    s1.displayText(storyList2[letterIndex2], 0, font); 
  } else {
    tikMM=millis();
    tikLetter=millis();
    conChangeFlag=false;
    resetFlagMM=true;
    iArray+=1;
    staticFlag=true;
  }
}