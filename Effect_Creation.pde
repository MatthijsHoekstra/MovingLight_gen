void summonEffects(){
 
  for (int i = 0; i < 4; i++) {
    if (activationEffect[i]) {
      if (activationTimeRipple[i]) {
        
      }
      else if (activationGravityWave[i]) {
        
      }
    }
  }
    
  if (frameCount % 60 == 0) {  // timeRipples
    for (int i = 0; i < 4; i++) {
      int position = int(random(0, widthLEDStrip * 4));
      float depth = FULL_LENGTH_TUNNEL * kinectHeight[i];
      int size = int(random(widthLEDStrip));;
      
      generator[i * 4].addTimeRipple(120, int(depth), size, position);
    }
  }
  for (int i = 0; i < 4; i++) {
    int gravityWaveFrequency = int(86 - (80 * kinectCrowd[i]));
    
    if (frameCount % gravityWaveFrequency == 0) {  // gravityWaves
      int speed = (12 - int(7 * kinectCrowd[i])) * 60;
      int depth = int(random(0, lengthTunnel));
      int size = 20;
      int startPosition = int(random(widthLEDStrip * 4));
      
      generator[16 + (i * 2)].addGravityWave(speed, depth, size, startPosition); // int direction_, int duration_, int depth_, int size_, int startPosition_
    }
  }
}

void timeRipplePulseActivated() {
  generator[12 + nextPulse].addTimeRipplePulse(30, FULL_LENGTH_TUNNEL);
  nextPulse ++;
  
  if (nextPulse == 4) {
    nextPulse = 0;
    timeRipplePulseTimer.setEnabled(!timeRipplePulseTimer.isEnabled());
    //println("pulse disabled");
  }
}

void gravityWavePulseActivated() {
  generator[12 + nextPulse].addGravityWavePulse(110, FULL_LENGTH_TUNNEL);
  nextPulse ++;
  
  if (nextPulse == 4) {
    nextPulse = 0;
    gravityWavePulseTimer.setEnabled(!gravityWavePulseTimer.isEnabled());
    //println("pulse disabled");
  }
}