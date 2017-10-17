class Generator {
  //------------------------------------------------------------All effects
  ArrayList<Pulse> pulses = new ArrayList<Pulse>();

  //------------------------------------------------------------All variables
  int id;

  int direction;

  Generator(int id) {
    this.id = id;

    if (id >= 0 && id < 8) {
      direction = LEFT_RIGHT;
    }

    if (id > 7 && id < 16) {
      direction = RIGHT_LEFT;
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

    popMatrix();
  }

  void addPulse(int duration, int distance) { 
    pulses.add(new Pulse(direction, duration, distance));
  }
}