color[][] colorsVirtualTunnels = new color[8][int(pow(widthLEDStrip, 2))];

void createVirtualTunnels() {
  loadPixels();

  for (int n = 0; n < 8; n++) {
    int xVirtualTunnel = int(locationVirtualTunnels[n].x);
    int yVirtualTunnel = int(locationVirtualTunnels[n].y);

    int xProjectedTunnel = int(locationProjectedTunnels[n].x);
    int yProjectedTunnel = int(locationProjectedTunnels[n].y);

    for (int x = 0; x < widthLEDStrip; x++) {
      for (int y = 0; y < widthLEDStrip; y++) {

        int locationProjectedPixel = (xProjectedTunnel + x) + (yProjectedTunnel+y);
       // println(locationProjectedPixel);

        color colorPixel = get (xVirtualTunnel + x, yVirtualTunnel + y);

        if (red(colorPixel) != 0 && green(colorPixel) != 0 && blue(colorPixel) != 0) {
          pixels[locationProjectedPixel] = colorPixel;
        } else {
          continue;
        }
      }
    }
  }

  updatePixels();
}