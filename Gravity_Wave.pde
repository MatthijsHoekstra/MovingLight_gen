class gravityWave {
  int direction, duration, distance, waveSize, startPosition;

  int x, y, radius;

  boolean finished = false;

  gravityWave(int direction_, int duration_, int depth_, int size_, int startPosition_) {
    direction = direction_;
    duration = duration_;
    waveSize = size_;
    x = depth_;
    startPosition = startPosition_;
    distance = widthLEDStrip * 4;

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
    fill(255, 240 - abs(y));
    
    int yPos = y - startPosition;
    
    if (yPos < -widthLEDStrip * 4) {
      yPos += widthLEDStrip * 4;
    }
    rect(x, yPos, waveSize, 10);
    
    popStyle();
  }

  void finished() {
    finished = true;
  }
}