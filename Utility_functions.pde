import java.net.URL;
import java.net.HttpURLConnection;
import java.io.OutputStreamWriter;
import java.io.InputStreamReader;

PVector[] locationGenerator = new PVector[nGenerators];

PVector[] locationVirtualTunnels = new PVector[8];

PVector[] locationProjectedTunnels = new PVector[8];

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
    } else if (i >= 19 && i <= 21) {
      locationGenerator[i].x = widthOuterTunnel + ((i - 19) * lengthTunnel);
      locationGenerator[i].y = widthOuterTunnel + (widthLEDStrip*8);
    }

    //println(locationGenerator[i].x + " , " + locationGenerator[i].y);
  }

  //Create grid for the position of all the virtual tunnels
  for (int i = 0; i < 8; i++) {
    locationVirtualTunnels[i] = new PVector();

    locationProjectedTunnels[i] = new PVector();

    if (i < 2) {
      locationVirtualTunnels[i].x = widthOuterTunnel + lengthTunnel - widthLEDStrip; 

      locationVirtualTunnels[i].y = widthOuterTunnel + (i * widthLEDStrip * 2);
    }

    if (i >= 2 && i < 4) {
      locationVirtualTunnels[i].x = widthOuterTunnel + lengthTunnel - widthLEDStrip; 

      locationVirtualTunnels[i].y = widthOuterTunnel + (i * widthLEDStrip * 2) + widthLEDStrip;
    }
    if (i >= 4 && i < 6) {
      locationVirtualTunnels[i].x = widthOuterTunnel + (lengthTunnel * 2); 
      locationVirtualTunnels[i].y = widthOuterTunnel + ((i - 4) * widthLEDStrip * 2);
    }
    if (i >= 6 && i < 8) {
      locationVirtualTunnels[i].x = widthOuterTunnel + (lengthTunnel * 2); 
      locationVirtualTunnels[i].y = widthOuterTunnel + ((i - 4) * widthLEDStrip * 2) + widthLEDStrip;
    }

    //TODO make 

    locationProjectedTunnels[i].x = i * 70;
    locationProjectedTunnels[i].y = 0;
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

void getStatus() {
  ////println("get Status Show");
  //if (ipStatusServer.equals("localhost") == false) {
  //  try {
  //    GetRequest get = new GetRequest("http://httprocessing.heroku.com");
  //    get.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
  //    get.send();

  //    println("Reponse Content: " + get.getContent());
  //  }
  //  catch(Exception e) {
  //    println("JSON f*cked up. Wonderful. (Error: getStatus)");
  //  }
  //}
}
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
    timeRipplePulseTimer.setEnabled(!timeRipplePulseTimer.isEnabled());
  }
  if (keyCode == DOWN) {
    for (int i = 0; i < 4; i++) {
      activationGravityWave[i] = true;
    }
    gravityWavePulseTimer.setEnabled(!timeRipplePulseTimer.isEnabled());
  }
}

color[][] colorsVirtualTunnels = new color[8][int(pow(widthLEDStrip, 2))];

void createVirtualTunnels() {

  // Uncomment for seeing locations of the projected and virtual tunnels
  //fill(255, 0, 0, 100);
  //for (int n = 0; n < 8; n++) {
  //  rect(locationVirtualTunnels[n].x, locationVirtualTunnels[n].y, 60, 60);
  //}

  loadPixels();
  for (int n = 0; n < 8; n++) {
    int xVirtualTunnel = int(locationVirtualTunnels[n].x);
    int yVirtualTunnel = int(locationVirtualTunnels[n].y);

    int xProjectedTunnel = int(locationProjectedTunnels[n].x);
    int yProjectedTunnel = int(locationProjectedTunnels[n].y);

    for (int x = 0; x < widthLEDStrip; x++) {
      for (int y = 0; y < widthLEDStrip; y++) {

        int locationProjectedPixel = (xProjectedTunnel + x) + (yProjectedTunnel+y) * width;
        int locationVirtualPixel = (xVirtualTunnel + x) + (yVirtualTunnel+y) * width;
        // println(locationProjectedPixel);

        //if (red(colorPixel) != 0 && green(colorPixel) != 0 && blue(colorPixel) != 0) {
        pixels[locationProjectedPixel] = pixels[locationVirtualPixel];

        //} else {
        //continue;
        //}
      }
    }
  }

  updatePixels();
}