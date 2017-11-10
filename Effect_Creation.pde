void summonEffects() {
  
  

  for (int i = 0; i < 4; i++) {
    if (gravityWaveStage[i] == 0 && kinectCrowd[i] > 0.001) {
      gravityWaveStage[i] = 1;  // start gravitywavepulse
      nextPulse = 0;
      gravityWavePulseTimer.setEnabled(!gravityWavePulseTimer.isEnabled());
    }
    if (gravityWaveStage[i] == 2 && kinectCrowd[i] < 0.001) {
      gravityWaveStage[i] = 0;  // crowd activity dimmed again, we can make a new gravity wave pulse!
    }
    
  }

  if (frameCount % 60 == 0) {  // timeRipples
    for (int i = 0; i < 4; i++) {
      int position = int(random(0, widthLEDStrip * 4));
      float depth = FULL_LENGTH_TUNNEL * kinectHeight[i];
      int size = int(random(widthLEDStrip));
      ;

      generator[i * 4].addTimeRipple(120, int(depth), size, position);
    }
  }
    
  for (int i = 0; i < 4; i++) {
    //int gravityWaveFrequency = int(86 - (80 * kinectCrowd[i]));
    int gravityWaveFrequency = 1200;
    
    int speedCalculated = 10;
    
    if (differenceKinectHeight[i] > 10){
      
    }
    
    speedCalculated = int(map(differenceKinectHeight[i], 0, 30, 5000, 1000));
    
    if (frameCount % gravityWaveFrequency == 0) {  // gravityWaves
      int speed = speedCalculated; //(12 - int(7 * kinectCrowd[i])) * 60;
      int nSteps = 6;
      int size = int(kinectCrowd[i] * 150);
      int startPosition = int(random(widthLEDStrip * 4 - size));
      
      generator[16 + (i * 2)].addGravityWave(speed, nSteps, size, startPosition); // int direction_, int duration_, int depth_, int size_, int startPosition_
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
  for (int i = 0; i < 4; i++) {
    if (gravityWaveStage[i] == 1) {
      generator[4 + nextPulse].addGravityWavePulse(110, FULL_LENGTH_TUNNEL);
      nextPulse ++;
  
      if (nextPulse == 4) {
        gravityWaveStage[i] = 2; // gravity wave pulse is done!
        nextPulse = 0;
        gravityWavePulseTimer.setEnabled(!gravityWavePulseTimer.isEnabled());
        //println("pulse disabled");
      }
    }
  }
}