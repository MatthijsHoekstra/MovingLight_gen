void summonEffects(){
  if (frameCount % 60 == 0) {
    int position = int(random(0, widthLEDStrip * 4));
    int size = int(random(widthLEDStrip));
    float depth = FULL_LENGTH_TUNNEL * kinectHeight[0];
    generator[12].addTimeRipple(120, int(depth), size, position);
  }
  
  int gravityWaveFrequency = int(86 - (80 * kinectCrowd[0]));
  
  if (frameCount % gravityWaveFrequency == 0) {
    int speed = (12 - int(7 * kinectCrowd[0])) * 60;
    int depth = int(random(0, lengthTunnel));
    int size = 20;
    int startPosition = int(random(widthLEDStrip * 4));
    generator[21].addGravityWave(speed, depth, size, startPosition); // int direction_, int duration_, int depth_, int size_, int startPosition_
  }
  
  if (activationMonitor) {
    //println(activationTimeRipple[1]);
    for (int i = 0; i < 4; i++) {
      if (activationTimeRipple[i]) {

      }
    }
  }
}

void timeRipplePulseActivated() {
  generator[12 + nextPulse].addTimeRipplePulse(30, FULL_LENGTH_TUNNEL);
  nextPulse ++;
  
  if (nextPulse == 4) {
    nextPulse = 0;
    timeRipplePulseTimer.setEnabled(!timeRipplePulseTimer.isEnabled());
    println("pulse disabled");
  }
}

void gravityWavePulseActivated() {
  generator[12 + nextPulse].addGravityWavePulse(110, FULL_LENGTH_TUNNEL);
  nextPulse ++;
  
  if (nextPulse == 4) {
    nextPulse = 0;
    gravityWavePulseTimer.setEnabled(!gravityWavePulseTimer.isEnabled());
    println("pulse disabled");
  }
}