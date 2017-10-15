class Pulse extends Effect {

  Pulse(int direction_, int duration_, int distance_) {
    super(distance_);
    
    direction = direction_;
    duration = duration_;

    if (direction == LEFT_RIGHT) {
      Ani.to(this, this.duration, "x", this.distance);
    }

    if (direction == RIGHT_LEFT) {
      Ani.to(this, this.duration, "x", -this.distance);
    }

    //println("pulse added : " + this.direction + " " + this.distance);
  }

  void update() {
    fill(255);
    rect(x, y, 10, widthLEDStrip);
  }
}