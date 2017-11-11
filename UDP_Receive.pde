float kinectValue;

int[] kinectRemap = {2, 0, 1, 3};

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

  //for (int i = 0; i < 4; i++) { 
  //  kinect[i] = json.getJSONObject(""+ i);

  //   kinectHeight[i] = kinect[i].getFloat("average");
  //   kinectCrowd[i] = kinect[i].getFloat("fill");

  //   println("kinect" + i + " : " + kinectHeight[i] + " / " + kinectCrowd[i]);   
  //   /* 

  //   TODO : check if kinect numbers are now correct with generaor numbers
  //   0 = left                   generator 0 - 3
  //   1 = right                  generator 8 - 11
  //   2 = tunnel 1 (entrance)    generator 4 - 7
  //   3 = tunnel 2               generator 12 - 15
  //   */
  // }
  for (int i = 0; i < 4; i++) {

    //println(kinectRemap[i]);
    int kinectold = kinectRemap[i];
    //println(kinectold);
    int j = kinectold;

    kinect[i] = json.getJSONObject(""+ j);

    if (Float.isNaN(kinect[i].getFloat("average"))) {
      kinectHeight[i] = 255;
    } else {
      kinectHeight[i] = kinect[i].getFloat("average");
    }

    //kinectHeight[j] = kinect[i].getFloat("average");
    kinectCrowd[i] = kinect[i].getFloat("fill");

    //println("kinect" + i + " : " + kinectHeight[i] + " / " + kinectCrowd[i]); 

    for (int k = kinectHeightHistory.length - 2; k >= 0; k--) {
      kinectHeightHistory[i][k+1] = kinectHeightHistory[i][k];
    }

    float total = 0;

    kinectHeightHistory[i][0] = kinectHeight[i];

    for (int l = 0; l < kinectHeightHistory.length; l++) {   
      //println(kinectHeightHistory[0][l]);
      total = total + kinectHeightHistory[i][l];
    }
    //println("-----------");

    last_meanKinectHeight[i] = meanKinectHeight[i];
    //println(total);

    meanKinectHeight[i] = total / kinectHeightHistory.length;

    print("kinect" + i + " : "  + meanKinectHeight[i] + " / " + last_meanKinectHeight[i] + " / " + kinectCrowd[i] + " / ");

    if (i == 3) {
      print("\n");
    }

    differenceKinectHeight[i] = last_meanKinectHeight[i] - meanKinectHeight[i];


    /* 
     in realiteit
     0 = voor                   generator 4 - 7
     1 = rechts                 generator 8 - 11
     2 = links                  generator 0 - 3
     3 = achter                 generator 12 - 15
     
     kinectRemap = {2, 0, 1, 3};
     0 = links                  generator 0 - 3
     1 = voor                   generator 4 - 7
     2 = rechts                 generator 8 - 11
     3 = achter                 generator 12 - 15
     
     */
  }
}

//void oscEvent(OscMessage theOscMessage) {
//  /* print the address pattern and the typetag of the received OscMessage */
//  print("### received an osc message.");
//  print(" addrpattern: "+theOscMessage.addrPattern());
//  println(" typetag: "+theOscMessage.typetag());
//}