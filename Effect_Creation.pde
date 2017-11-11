int tresholdDifferenceKinectHeight = 15;

color[] primaryColor = {#0061ff,  #ff0000,  #00ff6e, #00e9ff}; //{#ffffff,  #ffffff,  #ffffff}

color[] secondaryColor = {#0061ff,  #ff0000,  #00ff6e, #00e9ff}; //{#ffffff,  #ffffff,  #ffffff}


void summonEffects() { 

  for (int i =0; i < 4; i++) {
    if (differenceKinectHeight[i] > tresholdDifferenceKinectHeight) {
      // start gravitywavepulse
      println("tunnel " + i + " is stage " + gravityWaveStage[i]);

      generator[i + i*3].addGravityWavePulse(50, FULL_LENGTH_TUNNEL, 0);
      generator[i+1+ i*3].addGravityWavePulse(50, FULL_LENGTH_TUNNEL, 10);
      generator[i+2+ i*3].addGravityWavePulse(50, FULL_LENGTH_TUNNEL, 20);
      generator[i+3+ i*3].addGravityWavePulse(50, FULL_LENGTH_TUNNEL, 30);
      //Send effect
    }
  }


  //meanKinectHeight[i] is the average heigth spread over 10 messages UDP

  //kinectCrowd[i] filling of the screen each person adds 0.02, max out at 1





  //for (int i = 0; i < 4; i++) {
  //  if (gravityWaveStage[i] == 0 && kinectCrowd[i] > 0.001) {
  //    gravityWaveStage[i] = 1;  // start gravitywavepulse
  //    nextPulse = 0;
  //    gravityWavePulseTimer.setEnabled(!gravityWavePulseTimer.isEnabled());
  //  }
  //  if (gravityWaveStage[i] == 2 && kinectCrowd[i] < 0.001) {
  //    gravityWaveStage[i] = 0;  // crowd activity dimmed again, we can make a new gravity wave pulse!
  //  }
  //}

  //if (frameCount % 60 == 0) {  // timeRipples
  //  for (int i = 0; i < 4; i++) {
  //    int position = int(random(0, widthLEDStrip * 4));
  //    float depth = FULL_LENGTH_TUNNEL * kinectHeight[i];
  //    int size = int(random(widthLEDStrip));
  //    ;

  //    generator[i * 4].addTimeRipple(120, int(depth), size, position);
  //  }
  //}

  //for (int i = 0; i < 4; i++) {
  //  //int gravityWaveFrequency = int(86 - (80 * kinectCrowd[i]));
  //  int gravityWaveFrequency = 600;

  //  int speedCalculated = 300;

  //  if (differenceKinectHeight[i] > 10) {
  //  }

  //  speedCalculated = int(map(differenceKinectHeight[i], 0, 30, 5000, 20));

  //  if (frameCount % gravityWaveFrequency == 0) {  // gravityWaves
  //    int speed = speedCalculated; //(12 - int(7 * kinectCrowd[i])) * 60;
  //    int nSteps = 6;
  //    int size = int(1 * 150);
  //    int startPosition = int(random(widthLEDStrip * 4 - size));

  //    generator[16 + (i * 2)].addGravityWave(speed, nSteps, size, startPosition); // int direction_, int duration_, int depth_, int size_, int startPosition_
  //  }
  //}
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

//void changeColorInstallation(int colorNumber) {

//  for (int i = 0; i < generator.length; i++) {
//    for (int j = 0; j < generator[i].gravityWavePulses.size(); i++) {
//      gravityWavePulse gravityWavesPulse = generator[i].gravityWavePulses.get(i);

//      gravityWavesPulse.fill = primaryColor[];
//    }

//    for (int j = 0; j < generator[i].gravityWaves.size(); i++) {
//      gravityWave gravityWaves = generator[i].gravityWaves.get(i);

//      gravityWaves.fill = secondaryColor[colorNumber];
//    }
//  }
//}