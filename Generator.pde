class Generator {
  //------------------------------------------------------------All effects
  ArrayList<timeRipplePulse> timeRipplePulses = new ArrayList<timeRipplePulse>();
  ArrayList<timeRipple> timeRipples = new ArrayList<timeRipple>();
  ArrayList<gravityWavePulse> gravityWavePulses = new ArrayList<gravityWavePulse>();
  ArrayList<gravityWave> gravityWaves = new ArrayList<gravityWave>();
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

    for (int i = 0; i < timeRipplePulses.size(); i++) {
      timeRipplePulse timeRipplePulse = timeRipplePulses.get(i);

      timeRipplePulse.update();

      if (timeRipplePulse.finished) {
        timeRipplePulses.remove(i);
      }
    }
    
    for (int i = 0; i < timeRipples.size(); i++) {
      timeRipple timeRipple = timeRipples.get(i);

      timeRipple.update();

      if (timeRipple.finished) {
        timeRipples.remove(i);
      }
    }
    
    for (int i = 0; i < gravityWavePulses.size(); i++) {
      gravityWavePulse gravityWavesPulse = gravityWavePulses.get(i);

      gravityWavesPulse.update();

      if (gravityWavesPulse.finished) {
        gravityWavePulses.remove(i);
      }
    }
    
    for (int i = 0; i < gravityWaves.size(); i++) {
      gravityWave gravityWave = gravityWaves.get(i);

      gravityWave.update();

      if (gravityWave.finished) {
        gravityWaves.remove(i);
      }
    }

    popMatrix();
  }

  void addTimeRipplePulse(int duration, int distance_) { 
    timeRipplePulses.add(new timeRipplePulse(direction, duration, distance_));
  }
  
  void addTimeRipple(int duration, int distance_, int size, int position) { 
    timeRipples.add(new timeRipple(direction, duration, distance_, size, position));
  }
  
  void addGravityWavePulse(int duration, int distance_) { 
    gravityWavePulses.add(new gravityWavePulse(direction, duration, distance_));
  }
  
  void addGravityWave(int duration_, int depth_, int size_, int startPosition_) { 
    gravityWaves.add(new gravityWave(direction, duration_, depth_, size_, startPosition_));
  }
}