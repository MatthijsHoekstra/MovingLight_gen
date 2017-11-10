float kinectValue;

void receive( byte[] data, String ip, int port ) {  // <-- extended handler
  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length);
  String message = new String( data );

  JSONObject json = parseJSONObject(message);

  JSONObject kinect[] = new JSONObject[4];

  for (int i = 0; i < 4; i++) { 
    kinect[i] = json.getJSONObject(""+ i);
    
    kinectHeight[i] = kinect[i].getFloat("average");
    kinectCrowd[i] = kinect[i].getFloat("fill");

   // println("kinect" + i + " : " + kinectHeight[i] + " / " + kinectCrowd[i]);   
    /* 
    
    TODO : check if kinect numbers are now correct with generaor numbers
    0 = left                   generator 0 - 3
    1 = right                  generator 8 - 11
    2 = tunnel 1 (entrance)    generator 4 - 7
    3 = tunnel 2               generator 12 - 15
    */
  }
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}