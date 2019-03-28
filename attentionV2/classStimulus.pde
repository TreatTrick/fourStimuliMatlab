import java.util.Timer; 
import java.util.TimerTask;

class Stimulus {
  int size, th, xcoor, ycoor;
  boolean changeFlag=true;
  Timer myTimer;//define a new Timer class
  TimerTask myTimerTaskCheck;//define a new TimerTask class

  Stimulus(int sizeout, int rectangleMode, int xcoorout, int ycoorout, float freqout) {//rectMode=int: either CORNER, CORNERS, CENTER, or RADIUS
    size=sizeout;
    xcoor=xcoorout;
    ycoor=ycoorout;
    th=round(1000/(2*freqout));
    textAlign(CENTER);
    rectMode(rectangleMode);
    noStroke();
    myTimer=new Timer();
    myTimerTaskCheck=new TimerTask() {
      @Override
        public void run() {
        changeFlag=!changeFlag;
      }
    };
    myTimer.scheduleAtFixedRate(myTimerTaskCheck, 1000, th);
  }


  void display(int intensity) {
    //println("display");
    if (changeFlag==true) {
      fill(intensity);
      rect(xcoor, ycoor, size, size);
    } else{
      fill(255-intensity);
      rect(xcoor, ycoor, size, size);
    }
  }

  void displayStatic(int intensity) {
    //println("display");
      fill(intensity);
      rect(xcoor, ycoor, size, size);
  }


  void displayText(String word, int intensity, PFont f) {
    if (changeFlag==true) {
      fill(intensity);
      text(word, xcoor, ycoor);
    } else {
      fill(255-intensity);
      text(word, xcoor, ycoor);
    }
  }
}