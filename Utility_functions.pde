import java.net.URL; //<>// //<>// //<>// //<>//
import java.net.HttpURLConnection;
import java.io.OutputStreamWriter;
import java.io.InputStreamReader;

PVector[] locationGenerator = new PVector[nGenerators];

PVector[] locationVirtualTunnels = new PVector[4];

PVector[] locationProjectedTunnels = new PVector[4];

PImage[] projectedTunnel = new PImage[4];



void createGrid() {  
  //Create grid for the position of each tunnel
  for (int i = 0; i < nGenerators; i++) {
    locationGenerator[i] = new PVector();

    if (i < 8) {
      locationGenerator[i].x = widthOuterTunnel; 
      locationGenerator[i].y = widthOuterTunnel + (i * widthLEDStrip);
    } else if (i >= 8 && i < 16) {
      locationGenerator[i].x = widthOuterTunnel + (3 * lengthTunnel);
      locationGenerator[i].y = widthOuterTunnel + ((i - 8) * widthLEDStrip);
    } else if (i >= 16 && i <= 18) {
      locationGenerator[i].x = widthOuterTunnel + ((i - 16) * lengthTunnel);
      locationGenerator[i].y = widthOuterTunnel;
    } else if (i >= 20 && i <= 22) {
      locationGenerator[i].x = widthOuterTunnel + ((i - 20) * lengthTunnel);
      locationGenerator[i].y = widthOuterTunnel + (widthLEDStrip*8);
    }

    //println(locationGenerator[i].x + " , " + locationGenerator[i].y);
  }

  //Create grid for the position of all the virtual tunnels
  for (int i = 0; i < locationVirtualTunnels.length; i++) {
    locationVirtualTunnels[i] = new PVector();

    locationProjectedTunnels[i] = new PVector();

    locationVirtualTunnels[i].x = widthOuterTunnel + lengthTunnel - widthLEDStrip;

    if (i < 2) {
      locationVirtualTunnels[i].y = widthOuterTunnel + (i * 2 * widthLEDStrip);
    } else if (i >=2 && i < 4) {
      locationVirtualTunnels[i].y = widthOuterTunnel + ((i * 2 * widthLEDStrip) + widthLEDStrip);
    }

    if (i==0) {
      locationProjectedTunnels[i].x = 0;
      locationProjectedTunnels[i].y = 0;
    } else if (i==1) {
      locationProjectedTunnels[i].x = 0;
      locationProjectedTunnels[i].y = 0;
    } else if (i==2) {
      locationProjectedTunnels[i].x = 0;
      locationProjectedTunnels[i].y = 0;
    } else if (i==3) {
      locationProjectedTunnels[i].x = 0;
      locationProjectedTunnels[i].y = 0;
    }

    projectedTunnel[i] = createImage((lengthTunnel + (widthLEDStrip * 2)), widthLEDStrip, ARGB);
  }
}

void utility() {
  pushStyle();
  fill(200, 0, 100);
  text(int(frameRate), 5, 16);
  popStyle();

  surface.setTitle(int(frameRate) + " fps");
}

int getLength(int percentageLength, int direction) {
  int interLength = 0;
  if (direction == 0) {
    interLength = int((percentageLength / 100.0) * lengthTunnel);
  } else if (direction == 1) {
    interLength = int((constrain(percentageLength, 0, 100) / 100.0) * widthLEDStrip * 4);
  }
  return interLength;
}

//void getStatus() {
//  ////println("get Status Show");
//  //if (ipStatusServer.equals("localhost") == false) {
//  //  try {
//  //    GetRequest get = new GetRequest("http://httprocessing.heroku.com");
//  //    get.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
//  //    get.send();

//  //    println("Reponse Content: " + get.getContent());
//  //  }
//  //  catch(Exception e) {
//  //    println("JSON f*cked up. Wonderful. (Error: getStatus)");
//  //  }
//  //}
//}
//int getPosition(

PShape angularRect;

void createShapes() {
  angularRect = createShape();
  angularRect.beginShape();
  angularRect.fill(255);
  angularRect.noStroke();
  angularRect.vertex(15, 0);
  angularRect.vertex(0, widthLEDStrip);
  angularRect.vertex(20, widthLEDStrip);
  angularRect.vertex(35, 0);
  angularRect.endShape(CLOSE);
}

void keyPressed() {
  if (key == '1') {
    kinectHeight[0] += 0.1;
    println("kinect 1 Height = " + kinectHeight[0]);
  }
  if (key == '2') {
    kinectHeight[0] -= 0.1;
    println("kinect 1 Height = " + kinectHeight[0]);
  }
  if (key == '3') {
    kinectHeight[1] += 0.1;
    println("kinect 2 Height = " + kinectHeight[1]);
  }
  if (key == '4') {
    kinectHeight[1] -= 0.1;
    println("kinect 2 Height = " + kinectHeight[1]);
  }
  if (key == '5') {
    kinectHeight[2] += 0.1;
    println("kinect 3 Height = " + kinectHeight[2]);
  }
  if (key == '6') {
    kinectHeight[2] -= 0.1;
    println("kinect 3 Height = " + kinectHeight[2]);
  }
  if (key == '7') {
    kinectHeight[3] += 0.1;
    println("kinect 4 Height = " + kinectHeight[3]);
  }
  if (key == '8') {
    kinectHeight[3] -= 0.1;
    println("kinect 4 Height = " + kinectHeight[3]);
  }
  if (key == 'q') {
    kinectCrowd[0] += 0.1;
    println("kinect 1 Crowd = " + kinectCrowd[0]);
  }
  if (key == 'w') {
    kinectCrowd[0] -= 0.1;
    println("kinect 1 Crowd = " + kinectCrowd[0]);
  }
  if (key == 'e') {
    kinectCrowd[1] += 0.1;
    println("kinect 2 Crowd = " + kinectCrowd[1]);
  }
  if (key == 'r') {
    kinectCrowd[1] -= 0.1;
    println("kinect 2 Crowd = " + kinectCrowd[1]);
  }
  if (key == 't') {
    kinectCrowd[2] += 0.1;
    println("kinect 3 Crowd = " + kinectCrowd[2]);
  }
  if (key == 'y') {
    kinectCrowd[2] -= 0.1;
    println("kinect 3 Crowd = " + kinectCrowd[2]);
  }
  if (key == 'u') {
    kinectCrowd[3] += 0.1;
    println("kinect 4 Crowd = " + kinectCrowd[3]);
  }
  if (key == 'i') {
    kinectCrowd[3] -= 0.1;
    println("kinect 4 Crowd = " + kinectCrowd[3]);
  }
  if (keyCode == UP) {
    for (int i = 0; i < 4; i++) {
      activationTimeRipple[i] = true;
    }
    nextPulse = 0;
    timeRipplePulseTimer.setEnabled(!timeRipplePulseTimer.isEnabled());
  }
  if (keyCode == DOWN) {
    for (int i = 0; i < 4; i++) {
      activationGravityWave[i] = true;
    }
    nextPulse = 0;
    gravityWavePulseTimer.setEnabled(!timeRipplePulseTimer.isEnabled());
  }
}


color[][] colorsVirtualTunnels = new color[8][int(pow(widthLEDStrip, 2))];

void createVirtualTunnels() {

  //Uncomment for seeing locations of the projected and virtual tunnels
  fill(255, 0, 0, 10);
  for (int n = 0; n < 4; n++) {
    rect(locationVirtualTunnels[n].x, locationVirtualTunnels[n].y, widthLEDStrip*2 + lengthTunnel, 60);
  }

  //for (int n = 0; n < 4; n++) {
  //  rect(locationProjectedTunnels[n].x, locationProjectedTunnels[n].y, 30, 30);
  //}
  for (int n = 0; n < 4; n++) {
    int xVirtual = int(locationVirtualTunnels[n].x);
    int yVirtual = int(locationVirtualTunnels[n].y);
    loadPixels();
    projectedTunnel[n].loadPixels();
    for (int x = 0; x < (lengthTunnel + (widthLEDStrip * 2)); x++) {
      for (int y = 0; y < widthLEDStrip; y++) {

        int pixelVirtual = (x + xVirtual) + (y + yVirtual) * width;
        int pixelProjected = x + y * projectedTunnel[n].width;

        projectedTunnel[n].pixels[pixelProjected] = pixels[pixelVirtual];
      }
    }

    projectedTunnel[n].updatePixels();
  }
  //0
  pushMatrix();

  translate(widthOuterTunnel, 0);
  image(projectedTunnel[0], 0, 0, lengthTunnel*3, widthOuterTunnel);

  popMatrix();
  //1
  pushMatrix();

  translate(widthOuterTunnel + lengthTunnel*3 + widthLEDStrip + 20, 90);
  rotate(radians(90));
  image(projectedTunnel[1], 0, 0, lengthTunnel*3, widthOuterTunnel);

  popMatrix();
  //2
  pushMatrix();

  translate(widthOuterTunnel + lengthTunnel*2 + widthLEDStrip + 93, widthLEDStrip*9+widthOuterTunnel + 15);
  rotate(radians(180));
  image(projectedTunnel[2], 0, 0, lengthTunnel*3, widthOuterTunnel);
  popMatrix();
  //3
  pushMatrix();

  translate(0, 180+lengthTunnel + widthLEDStrip*2 + widthOuterTunnel + 14);
  rotate(radians(270));
  image(projectedTunnel[3], 0, 0, lengthTunnel*3, widthOuterTunnel);

  popMatrix();
}


float position = 0;
boolean crossfade = false;

void startShow() {

  //println("start show");
  int channel = 0;
  int pitch = 60 + showModus;   // C3, C#3, D3, D#3
  int velocity = 127;
  Note note = new Note(channel, pitch, velocity);

  myBusA.sendNoteOn(note); // Send a Midi noteOn
  myBusA.sendNoteOff(note); // Send a Midi nodeOff

  sendOSCInt("/elm/stages/600x600/live/transitionDuration", 4); 
  sendOSCInt("/elm/stages/600x600/live/mix/B/media", 1);

  Ani.to(this, 260, "position", 1.0, Ani.LINEAR, "onEnd:finishedCrossfade");

  crossfade = true;

  timeline_40.setEnabled(true);
  timeline_47.setEnabled(true);

  println("startShow");
}

void finishedCrossfade() {
  sendOSCFloat("/elm/stages/600x600/live/mix/position", position); 
  crossfade = false;
}

void endShow() {

  sendOSCFloat("/elm/stages/600x600/live/intensity", 0);
  //crossfade intensity to 0 ELM

  // select Spout
  sendOSCInt("/elm/stages/600x600/live/mix/A/media", showModus);
  showModus ++;
  if (showModus > 4) {
    showModus = 1;
  }

  timeline_40.setEnabled(false);
  timeline_47.setEnabled(false);

  println("endShow");
}

String getStatus() {
  //return "running" "stop"

  return "running";
}

Boolean getDiagnostics() {

  //if not receiving any messages from any PC than send false;

  return true;
}

void interimStart() {
  //Crossfade to AE

  Ani.to(this, 260, "position", 0.0, Ani.LINEAR, "onEnd:finishedCrossfade");

  crossfade = true;
}

void prepareWormhole() {
  println("prepare Wormhole" + " , " + (millis() - lastMillis));
}

void startWormhole() {
  println("start Wormhole" + " , " + (millis() - lastMillis));
}