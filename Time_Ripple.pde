class timeRipple {
  int direction, duration, distance;

  int x, y, radius;

  boolean finished = false;

  timeRipple(int direction_, int duration_, int distance_, int size_, int position_) {
    direction = direction_;
    duration = duration_;
    y = position_;
    radius = size_;

    distance = getLength(distance_ , 0);

    if (direction == LEFT_RIGHT) {
      Ani.to(this, duration, "x", distance, Ani.QUINT_OUT, "onEnd:finished");
    }

    if (direction == RIGHT_LEFT) {
      Ani.to(this, duration, "x", -distance, Ani.QUINT_OUT, "onEnd:finished");
    }
    
    //Ani.to(this, duration, "radius", size_ * 2, Ani.LINEAR, "onEnd:finished");

    //println("pulse added : " + this.direction + " " + this.distance);
  }

  void update() {
    pushStyle();
    ellipseMode(CORNER);
    //filter(BLUR);
    fill(255);

    ellipse(x, y, -x/4, radius);
    fill(0);
    ellipse(x, y + radius / 3, -x/1.5, radius / 3);
    
    popStyle();
  }

  void finished() {
    finished = true;
  }
}