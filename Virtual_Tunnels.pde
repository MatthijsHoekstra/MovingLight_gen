color[][] colorsVirtualTunnels = new color[8][int(pow(widthLEDStrip, 2))];

void createVirtualTunnels() {

  // Uncomment for seeing locations of the projected and virtual tunnels
  fill(255, 0, 0, 100);
  for (int n = 0; n < 8; n++) {
    rect(locationVirtualTunnels[n].x, locationVirtualTunnels[n].y, 60, 60);
  }

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