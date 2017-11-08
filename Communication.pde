void startWebServices() {
  server.setLoggerLevel(java.util.logging.Level.INFO);
  server = new SimpleHTTPServer(this, HTTP_SERVER_PORT); //starts service on given port

  responder1 = new DynamicResponseHandler(new TextResponse(1), JSON_CONTENT_TYPE);
  server.createContext("status", responder1);
}

class TextResponse extends ResponseBuilder {
  int type;

  TextResponse(int type) {
    this.type = type;
  }

  public  String getResponse(String requestBody) {
    println("JSON received");
    println(requestBody);
    
    String message = requestBody;
    
    JSONObject received = new JSONObject();
    
    received = parseJSONObject(message);
    String statusMessage = "";
    
    statusMessage = received.getString("show");
    
    println(statusMessage);
    
    
    // println(received);
    
    //String output = "";



    Map<String, String> queryMap = getQueryMap();    //get parameter map as string pairs

   // statusMessage = queryMap.getOrDefault("show", "null");

    JSONObject json = new JSONObject();

    if (statusMessage.equals("start")) {
      startShow();

      lastMillis = millis();

      json.setString("status", "started");
    } else if (statusMessage.equals("stop")) {
      endShow();

      json.setString("status", "stop");
    } else if (statusMessage.equals("check")) {
      String status = getStatus(); //Returns string with "running" / "stop" --> Check with timeLine
      println(" check fine" );
      json.setString("status", status);
    } else {
      json.setString("status", "400");
    }
    
    println(json);
    println(json.toString());
    
    println("responded to webservice request on /" + "status" + " with parameters: " + queryMap); 
    return json.toString();  //note that javascript may require: return "callback(" + json.toString() + ")"
  }
}



//------------------------------------------------------------------------------------SEND STATUS TO OVERVIEW PANEL
String stateKinect[] = new String[4];

void sendStatus() {
  try {
    stateKinect[0] = "OK";
    stateKinect[1] = "OK";
    stateKinect[2] = "CRITICAL";
    stateKinect[3] = "OK";

    JSONObject status = new JSONObject();

    String time = year() + "-" + month() + "-" + day() + "T" + hour() + ":"+ minute() + ":" + second();

    status.setString("type", "interactive_cycle");
    status.setString("time", time);

    JSONObject payload = new JSONObject();
    payload.setString("state_kinect_0", stateKinect[0]);
    payload.setString("state_kinect_1", stateKinect[1]);
    payload.setString("state_kinect_2", stateKinect[2]);
    payload.setString("state_kinect_3", stateKinect[3]);
    payload.setString("fps", ""+frameRate);
    payload.setBoolean("running", getDiagnostics());

    status.setJSONObject("payload", payload);


    URL url = new URL("http://"+OVERVIEW_SERVER_IP+":"+OVERVIEW_SERVER_PORT+"/events");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setConnectTimeout(5000);//5 secs
    connection.setReadTimeout(5000);//5 secs

    connection.setRequestMethod("POST");
    connection.setDoOutput(true);
    connection.setRequestProperty("Content-Type", "application/json");

    OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());  
    out.write(status.toString());
    out.flush();
    out.close();

    int res = connection.getResponseCode();

    //System.out.println(res);

    InputStream is = connection.getInputStream();
    BufferedReader br = new BufferedReader(new InputStreamReader(is));
    String line = null;
    while ((line = br.readLine() ) != null) {
      //System.out.println(line);
    }
    connection.disconnect();
    //connection.disconnect();
  }
  catch(Exception e) {
    //e.printStackTrace();
    println("JSON f*cked up. Wonderful. (Error: sendStatus)");
  }
}

boolean showDebugBusANoteOn = true;

void noteOn(int c, int p, int v, long t, String bus_name) {
  if (showDebugBusANoteOn) {
    println();
    //print(t + " ");
    print(bus_name);
    print("   ON:");
    println("--------");
    print("  C:" + c);
    print("  P:" + p);
    print("  V:" + v);
    println("Timestamp:" + t);
  }

  if (p == 24) {
    interimStart();
  }
}

void noteOff(int c, int p, int v, long t, String bus_name) {
  if (showDebugBusANoteOn) {
    println();
    //print(t + " ");
    print(bus_name);
    print("   OFF");
    println("--------");
    print("  C:" + c);
    print("  P:" + p);
    print("  V:" + v);
    println("Timestamp:" + t);
  }
}

void sendOSCFloat(String addr, float value) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage(addr);

  myMessage.add(value); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

void sendOSCInt(String addr, int value) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage(addr);

  myMessage.add(value); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}