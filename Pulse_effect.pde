class Pulse {
  int direction, duration, distance;

  int x, y;

  boolean finished = false;

  Pulse(int direction_, int duration_, int distance_) {
    direction = direction_;
    duration = duration_;
    distance = distance_;

    if (direction == LEFT_RIGHT) {
      Ani.to(this, this.duration, "x", this.distance, Ani.QUAD_IN, "onEnd:finished");
    }

    if (direction == RIGHT_LEFT) {
      Ani.to(this, this.duration, "x", -this.distance, Ani.QUAD_IN, "onEnd:finished");
    }

    //println("pulse added : " + this.direction + " " + this.distance);
  }

  void update() {
    fill(255);
    rect(x, y, 10, widthLEDStrip);
  }

  void finished() {
    finished = true;
  }
}