int nextPulse;

class timeRipplePulse {
  int direction, duration, distance;

  int x, y;

  boolean finished = false;

  timeRipplePulse(int direction_, int duration_, int distance_) {
    direction = direction_;
    duration = duration_;

    distance = getLength(distance_ , 0);
    distance = getLength(distance_ , 0);
    
    Ani.to(this, duration, "x", distance, Ani.QUAD_IN, "onEnd:finished");
  }

  void update() {
    pushStyle();
    //filter(BLUR);
    fill(255);
    
    if (direction == LEFT_RIGHT) {  // wrong, we want to make this RIGHT_LEFT
      rect(-x + distance, y, 20, widthLEDStrip);
    }
    if (direction == RIGHT_LEFT) {  // wrong, we want to make this LEFT_RIGHT
      rect(x - distance, y, 20, widthLEDStrip);
    }
    popStyle();
  }

  void finished() {
    finished = true;
  }
}