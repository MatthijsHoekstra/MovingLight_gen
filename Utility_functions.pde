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
    }
    if (i >= 8 && i < 16) {
      locationGenerator[i].x = widthOuterTunnel + (3 * lengthTunnel);
      locationGenerator[i].y = widthOuterTunnel + ((i - 8) * widthLEDStrip);
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

    //TODO make array location projected Tunnels.

    locationProjectedTunnels[i].x = i * 70;
    locationProjectedTunnels[i].y = 0;
  }
}

void utility() {
  pushStyle();
  fill(200, 0, 100);
  text(int(frameRate), 5, 16);
  popStyle();
}

int getLength(int percentageLength) {
  return int((percentageLength / 100) * lengthTunnel);
}

//int getPosition(