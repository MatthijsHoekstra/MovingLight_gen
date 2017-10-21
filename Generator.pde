class Generator {
  //------------------------------------------------------------All effects
  ArrayList<Pulse> pulses = new ArrayList<Pulse>();
  ArrayList<RoundParticlePulse> roundParticlePulses = new ArrayList<RoundParticlePulse>();

  //------------------------------------------------------------All variables
  int id;

  int direction;

  Generator(int id) {
    this.id = id;

    if (id >= 0 && id <= 7) {
      direction = LEFT_RIGHT;
    } else if (id >= 8 && id <= 15) {
      direction = RIGHT_LEFT;
    } else if (id >= 16 && id <= 18) {
      direction = UP_DOWN;
    } else if (id >= 19 && id <= 21) {
      direction = DOWN_UP;
    }
  }

  void update() {
    pushMatrix();

    translate(locationGenerator[id].x, locationGenerator[id].y);

    for (int i = 0; i < pulses.size(); i++) {
      Pulse pulse = pulses.get(i);

      pulse.update();

      if (pulse.finished) {
        pulses.remove(i);
      }
    }

    for (int i = 0; i < roundParticlePulses.size(); i++) {
      RoundParticlePulse roundParticlePulse = roundParticlePulses.get(i);

      roundParticlePulse.update();

      if (roundParticlePulse.finished) {
        roundParticlePulses.remove(i);
      }
    }

    popMatrix();
  }

  void addPulse(int duration, int distance_) { 
    pulses.add(new Pulse(direction, duration, distance_));
  }

  void addRoundParticlePulse(int duration, int distance_) { 
    roundParticlePulses.add(new RoundParticlePulse(direction, duration, distance_));
  }
}