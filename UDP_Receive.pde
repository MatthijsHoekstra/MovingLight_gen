void receive( byte[] data, String ip, int port ) {  // <-- extended handler
  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length);
  String message = new String( data );

  JSONObject json = parseJSONObject(message);
  
  JSONObject kinect[] = new JSONObject[4];
  
  for (int i = 0; i < 4; i++){ 
    kinect[i] = json.getJSONObject(""+ i);
    
    kinectHeight[i] = kinect[i].getFloat("average");
    kinectCrowd[i] = kinect[i].getFloat("fill");
    
    println("kinect" + i + " : " + kinectHeight[i] + " / " + kinectCrowd[i]);
  }
}