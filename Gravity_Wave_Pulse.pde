class gravityWavePulse {
  int direction, duration, distance, delay;

  int x, y;

  boolean finished = false;

  int opacity = 255;

  gravityWavePulse(int direction_, int duration_, int distance_, int delay_) {
    direction = direction_;
    duration = duration_;
    delay = delay_;

    distance = getLength(distance_, 0);
    distance = getLength(distance_, 0);



    if (direction == LEFT_RIGHT) {
      Ani.to(this, duration, delay, "x", distance - 20, Ani.QUAD_IN, "onEnd:finished");
    }

    if (direction == RIGHT_LEFT) {
      x -= 20;

      Ani.to(this, duration, delay, "x", -distance, Ani.QUAD_IN, "onEnd:finished");
    }
  }

  void update() {
    pushStyle();
    fill(255,205 - x);

    if (direction == LEFT_RIGHT) {
      beginShape();
      vertex(15 + x, 0);
      vertex(0 + x, widthLEDStrip);
      vertex(20 + x, widthLEDStrip);
      vertex(35 + x, 0);
      endShape(CLOSE);
    }

    if (direction == RIGHT_LEFT) {
      beginShape();
      vertex(15 + x, 0);
      vertex(0 + x, widthLEDStrip);
      vertex(20 + x, widthLEDStrip);
      vertex(35 + x, 0);
      endShape(CLOSE);
    }
    //angularRect.setFill(200, 0, 0);


    //shape(angularRect, x, y);


    popStyle();
  }


  void finished() {
    finished = true;
  }
}