class RoundParticlePulse {
  int direction, duration, distance;
  boolean finished = false;

  RoundParticlePulse(int direction_, int duration_, int distance_) {

    //direction = direction_;
    //duration = duration_;

    //if (direction == LEFT_RIGHT || direction == RIGHT_LEFT) {
    //  distance = getLength(distance_, 0);
    //} else if (direction == UP_DOWN || direction == DOWN_UP) {
    //  distance = getLength(distance_, 1);
    //}

    //Ani.to(this, duration, "locationParticles[0].x", 150, Ani.QUAD_OUT);

    //for (int i = 0; i < widthLEDStrip; i++) {
    //  locationParticles[i] = new PVector();

    //  //String variable = "locationParticles[" + i + "].x";

    //  //println(variable);

    //  //locationParticles[i].y = i;

    //  //Ani.to(this, duration, sin(map(i, 0, widthLEDStrip, 0, TWO_PI)), variable, distance, Ani.QUAD_OUT);
    //}

    //println("roundparticle added : " + direction + " " + distance + " " + duration);
  }

  void update() {
    //fill(255);
    //for (int i = 0; i < widthLEDStrip; i++) {
    //  //println(locationParticles[i].x + " " + locationParticles[i].x);
    //  rect(locationParticles[i].x, locationParticles[i].y, 5, 1);
    //}
  }
}

class RoundParticlePulseParticle {

  PVector location;

  RoundParticlePulseParticle(int x, int y) {
    
    
    
  }

  void update() {
  }


  boolean finished() {
    return false;
  }
}