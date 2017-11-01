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

    statusMessage = queryMap.getOrDefault("status", "null");

    if (statusMessage.equals("run") == true || statusMessage.equals("rerun") == true || statusMessage.equals("end") == true) {
      output = "200 OK";
    } else {
      output = "status: 400 NOT FOUND";
    }

    JSONObject json = new JSONObject();

    json.setString("time", year() + "-" + month() + "-" + day() + "-T" + hour() + ":"+ minute() + ":" + second());
    json.setString("status", output);

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

    URL url = new URL("http://"+OVERVIEW_SERVER_IP+":"+OVERVIEW_SERVER_PORT+"/events");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setConnectTimeout(5000);//5 secs
    connection.setReadTimeout(5000);//5 secs

    connection.setRequestMethod("POST");
    connection.setDoOutput(true);
    connection.setRequestProperty("Content-Type", "application/json");

    String time = year() + "-" + month() + "-" + day() + "T" + hour() + ":"+ minute() + ":" + second();

    String stateShow = "running";

    OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());  
    out.write(

      "{\"type\":\"interactive_cycle\",\"timestamp\":\""
      +time+
      "\",\"payload\":{\"state_kinect_0\":"
      +int(stateKinect[0])+
      ",\"state_kinect_1\":"
      +int(stateKinect[1])+
      ",\"state_kinect_2\":"
      +int(stateKinect[2])+
      ",\"state_kinect_3\":"
      +int(stateKinect[3])+
      ",\"state_show\":\"" + stateShow + "\"}}"
      );
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