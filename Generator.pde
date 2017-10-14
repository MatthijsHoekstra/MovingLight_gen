class Generator {
  //------------------------------------------------------------All effects
  ArrayList<Pulse> pulses = new ArrayList<Pulse>();

  //------------------------------------------------------------All variables
  int id;

  int direction;

  Generator(int id) {
    this.id = id;

    if (id >= 0 && id < 8) {
      direction = RIGHT_LEFT;
    }

    if (id > 7 && id < 16) {
      direction = LEFT_RIGHT;
    }
  }

  void update() {
  }

  void addPulse(int duration, int distance) {
    pulses.add(new Pulse(direction, duration, distance));
  }
}