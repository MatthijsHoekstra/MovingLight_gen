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
    String output = "";

    String statusMessage = "";

    Map<String, String> queryMap = getQueryMap();    //get parameter map as string pairs

    statusMessage = queryMap.getOrDefault("show", "null");

    JSONObject json = new JSONObject();

    if (statusMessage.equals("start")) {
      startShow();

      json.setString("status", "started");
    } else if (statusMessage.equals("stop")) {
      endShow();

      json.setString("status", "stop");
    } else if (statusMessage.equals("check")) {
      String status = getStatus(); //Returns string with "running" / "stop" --> Check with timeLine

      json.setString("status", status);
    } else {
      json.setString("status", "400");
    }

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

    JSONObject status;

    String time = year() + "-" + month() + "-" + day() + "T" + hour() + ":"+ minute() + ":" + second();

    status.setString("type", "interactive_cycle");
    status.setString("time", time);

    JSONObject payload;
    payload.setString("state_kinect_0", stateKinect[0]);
    payload.setString("state_kinect_1", stateKinect[1]);
    payload.setString("state_kinect_2", stateKinect[2]);
    payload.setString("state_kinect_3", stateKinect[3]);
    payload.setString("fps", ""+frameRate);
    payload.setString("running", getDiagnostics());
    
    status.setJSONObject("payload",payload);


      URL url = new URL("http://"+OVERVIEW_SERVER_IP+":"+OVERVIEW_SERVER_PORT+"/events");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setConnectTimeout(5000);//5 secs
    connection.setReadTimeout(5000);//5 secs

    connection.setRequestMethod("POST");
    connection.setDoOutput(true);
    connection.setRequestProperty("Content-Type", "application/json");
    
    OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());  
    out.write(Integer.parseInt(status.toString()));
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