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

int getLength(int percentageLength) {
  int interLength = int((percentageLength / 100.0) * lengthTunnel);
  return interLength;
}

//int getPosition(