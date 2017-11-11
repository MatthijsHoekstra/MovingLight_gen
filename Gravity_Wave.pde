byte [] gravityWaveStage = new byte[4];

class gravityWave {
  int direction, duration, distance, waveSize, startPosition, tunnelSegments;

  int x, y;

  boolean finished = false;
  
  color fill = #ffffff;

  gravityWave(int direction_, int duration_, int nSteps_, int size_, int startPosition_) {
    direction = direction_;
    duration = duration_;
    waveSize = size_;
    startPosition = startPosition_;
    distance = widthLEDStrip * 4 * nSteps_;
    tunnelSegments = lengthTunnel / nSteps_;
    
    if (direction == UP_DOWN) {
      Ani.to(this, duration, "y", distance, Ani.QUINT_OUT, "onEnd:finished");
    }

    if (direction == DOWN_UP) {
      Ani.to(this, duration, "y", -distance, Ani.QUINT_OUT, "onEnd:finished");
    }
    
    //Ani.to(this, duration, "radius", size_ * 2, Ani.LINEAR, "onEnd:finished");

    //println("pulse added : " + this.direction + " " + this.distance);
  }

  void update() {
    pushStyle();
    //filter(BLUR);
    //fill(255, 240 - abs(y));
    fill(255);
    
    if (direction == UP_DOWN) {   
      x = y / (widthLEDStrip * 4) * tunnelSegments;
      int yPos =  y % (widthLEDStrip * 4) + startPosition;
      int leftoverHeight = 0;
      //println("yPos = " + (yPos - startPosition));
      
      if (yPos > widthLEDStrip * 4 - waveSize) {   // if rectangle reaches bottom of tunnel
        if (yPos < widthLEDStrip * 4) {
          leftoverHeight = (widthLEDStrip * 4) - yPos;
          rect(x, yPos, 21, leftoverHeight);
        }
        yPos -= widthLEDStrip * 4; 
      }

      rect(x, yPos, 21, waveSize);
    }
    
    if (direction == DOWN_UP) {  
      x = y / (widthLEDStrip * 4) * -tunnelSegments;
      int yPos = y % (widthLEDStrip * 4) - startPosition;
      int leftoverHeight = 0;
      //println("yPos = " + (yPos - startPosition));
      
      if (yPos < - widthLEDStrip * 4) {   // if rectangle reaches top of tunnel 
        if (yPos > - widthLEDStrip * 4 - waveSize) {
          leftoverHeight = (widthLEDStrip * 4) + yPos;
          rect(x, - widthLEDStrip * 4, 21, waveSize + leftoverHeight); 
        }
        yPos += widthLEDStrip * 4; 
      }

      rect(x, yPos, 21, waveSize);
    }
    

    
    popStyle();
  }

  void finished() {
    finished = true;
  }
}