class Pulse {

  int direction, duration, distance;
  
  int x = 0;

  Pulse(int direction, int duration, int distance) {
    this.direction = direction;
    this.duration = duration;
    this.distance = distance;

    if (this.direction == LEFT_RIGHT) {
      Ani.to(this, this.duration, "x", this.distance);
    }
    
    println("pulse added : " + this.direction + " " + this.distance);
  }

  void update() {
    fill(255);
    rect(x, 30, 10, 30);
  }
}