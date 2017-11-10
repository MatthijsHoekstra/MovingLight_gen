float kinectValue;

int[] kinectRemap = {2,0,1,3};

float[][] kinectHeightHistory = new float[4][10];

float[] meanKinectHeight = new float[4];
float[] last_meanKinectHeight = new float[4];

float[] differenceKinectHeight = new float[4];

void receive( byte[] data, String ip, int port ) {  // <-- extended handler
  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length);
  String message = new String( data );

  JSONObject json = parseJSONObject(message);

  JSONObject kinect[] = new JSONObject[4];

  for (int i = 0; i < 4; i++) { 
    int j = kinectRemap[i];
    
    kinect[j] = json.getJSONObject(""+ i);
    
    kinectHeight[j] = kinect[i].getFloat("average");
    kinectCrowd[j] = kinect[i].getFloat("fill");
    
    for (int k = 0; k < 9; k++){
      kinectHeightHistory[i][k+1] = kinectHeightHistory[j][k];
    }
    
    kinectHeightHistory[i][0] = kinectHeight[j];
    
    float total = 0;
    
    for (int k = 0; k < kinectHeightHistory.length; k++){    
      total += kinectHeightHistory[i][k];
    }
    
    last_meanKinectHeight[i] = meanKinectHeight[i];
    
    meanKinectHeight[i] = total / 10;
    
    print("kinect" + i + " : " + meanKinectHeight[i] + " / " + last_meanKinectHeight[i] + " / " + kinectCrowd[i] + " / ");
    
    if (i == 3){
      print("\n");
    }
    
    differenceKinectHeight[i] = last_meanKinectHeight[i] - meanKinectHeight[i];
    
    
    /* 
    
    TODO : check if kinect numbers are now correct with generaor numbers
    0 = left                   generator 0 - 3
    1 = right                  generator 8 - 11
    2 = tunnel 1 (entrance)    generator 4 - 7
    3 = tunnel 2               generator 12 - 15
    */
  }
}

//void oscEvent(OscMessage theOscMessage) {
//  /* print the address pattern and the typetag of the received OscMessage */
//  print("### received an osc message.");
//  print(" addrpattern: "+theOscMessage.addrPattern());
//  println(" typetag: "+theOscMessage.typetag());
//}