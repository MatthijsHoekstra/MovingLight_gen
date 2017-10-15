PVector[] locationGenerator = new PVector[nGenerators];

void createGrid(){  
  for (int i = 0; i < nGenerators; i++){
    locationGenerator[i] = new PVector();
    
    if (i < 8){
      locationGenerator[i].x = widthOuterTunnel; 
      locationGenerator[i].y = widthOuterTunnel + (i * widthLEDStrip);
    }
    if (i >= 8 && i < 16){
      locationGenerator[i].x = widthOuterTunnel + (3 * lengthTunnel);
      locationGenerator[i].y = widthOuterTunnel + ((i - 8) * widthLEDStrip);
    }
    
    println(locationGenerator[i].x + " , " + locationGenerator[i].y);
  }
}

int getLength(int percentageLength){
  return int((percentageLength / 100) * lengthTunnel);
}

//int getPosition(