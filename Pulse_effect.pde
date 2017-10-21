class Pulse {
  int direction, duration, distance;

  int x, y;

  boolean finished = false;

  Pulse(int direction_, int duration_, int distance_) {
    direction = direction_;
    duration = duration_;

    if (direction == LEFT_RIGHT || direction == RIGHT_LEFT) {
      distance = getLength(distance_ , 0);
    } else if (direction == UP_DOWN || direction == DOWN_UP) {
      distance = getLength(distance_, 1);
    }

    if (direction == LEFT_RIGHT) {
      Ani.to(this, duration, "x", distance, Ani.QUAD_IN, "onEnd:finished");
    }

    if (direction == RIGHT_LEFT) {
      Ani.to(this, duration, "x", -distance, Ani.QUAD_IN, "onEnd:finished");
    }

    if (direction == UP_DOWN) {
      Ani.to(this, duration, "y", distance, Ani.QUAD_IN, "onEnd:finished");
    }

    if (direction == DOWN_UP) {
      Ani.to(this, duration, "y", -distance, Ani.QUAD_IN, "onEnd:finished");
    }

    //println("pulse added : " + this.direction + " " + this.distance);
  }

  void update() {
    pushStyle();
    //filter(BLUR);
    fill(255);

    if (direction == LEFT_RIGHT || direction == RIGHT_LEFT) {
      rect(x, y, 10, widthLEDStrip);
    }
    if (direction == UP_DOWN || direction == DOWN_UP) {
      rect(x, y, lengthTunnel, 10);
    }
    popStyle();
  }

  void finished() {
    finished = true;
  }
}