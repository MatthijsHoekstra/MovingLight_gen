//class Timeline
//{
//  boolean error = false;
//  Effect[] effectList;
//  TimeStamp currentTime, lastUpdateTime;
//  Effect currentEffect;
  
//  Timeline(String timelineFileLocation) {
//    try{ 
//      String[] timeLine = loadStrings(timelineFileLocation);
//      effectList = new Effect[timeLine.length];
//      for(int i=0; i<timeLine.length-1; i++) {
//        effectList[i] = new Effect();
//        effectList[i].set(timeLine[i]);
//      }
//      currentEffect = new Effect();
//    }
//    catch( Exception e ) { 
//      println("\nERROR!\n" + e + "\n\ntimeline file not found!"); 
//      error = true;
//    }
//  }
  
//  void update(String currentTimeStampLocation) {
//    try{ 
//      String[] loadData = loadStrings(currentTimeStampLocation);
//      currentTime = new TimeStamp(loadData[0]); 
//      currentEffectCheck();
//      error = false;
//    }
//    catch(Exception e) { 
//      println("\nERROR!\n" + e + "\n\nServer offline?"); 
//      error = true;
//    }
//  }
  
//  void currentEffectCheck() {
//    int foundEffect = 0;
//    long daySeconds = currentTime.second() + currentTime.minute()*60 + currentTime.hour()*3600;
//    for( int i=0; i<effectList.length-1; i++ ) {
//      long effectSeconds = effectList[i].timeStamp.second() + effectList[i].timeStamp.minute()*60 + effectList[i].timeStamp.hour()*3600;
//      if( currentTime.year() == effectList[i].timeStamp.year() && currentTime.month() == effectList[i].timeStamp.month() && currentTime.day() == effectList[i].timeStamp.day() ){
//        if(daySeconds > effectSeconds ) {
//            foundEffect = i;
//         }
//      }
//    }
//    if( foundEffect > 0 ) {
//      currentEffect = effectList[foundEffect];
//      println("Timeline trigger changed to effect: " + effectList[foundEffect].Nr + " " + effectList[foundEffect].ID + " in timeline list line: " + foundEffect);
//      println(effectList[foundEffect].timeStamp.dataString + " " + currentTime.dataString);
//    }
//    else {
//      currentEffect = effectList[0];
//      println("timestamp not found in timeline, activating first effect from list!");
//    }
//  }
//}

//class Effect
//{
//  TimeStamp timeStamp;
//  String ID = "0";
//  int Nr = 0;
  
//  Effect() {
//  }
  
//  void set(String effectLine) {
//    try{
//      //println(effectLine);
//      String[] splitEffectLine = split(effectLine, '\t');
//      timeStamp = new TimeStamp(splitEffectLine[0]);
//      ID = splitEffectLine[1];
//      Nr = 0;
//      for(int i=0; i<effectListIdentification.length; i++) {
//        if( ID.equals(effectListIdentification[i]) ) Nr = i;
//      }
//    }
//    catch( Exception e ) {
//      println("ERROR!/n" + e + "/n/ntimeline file not right format?"); 
//    }
//  }
//}

//class TimeStamp
//{
//  int[] date = new int[3];
//  int[] time = new int[3];
//  String dataString = "";
  
//  TimeStamp(String _dataString) {
//    dataString = _dataString;
//    for(int i=0; i<date.length; i++) date[i] = time[i] = 0;
//    updateTimeStamp(dataString);
//  }
  
//  void updateTimeStamp(String _dataString) {
//    dataString = _dataString;
//    try{
//      String[] dataSplitString = split(dataString, '_');
//      String[] dateStampString = split(dataSplitString[0], '-');
//      String[] timeStampString = split(dataSplitString[1], ':');
      
//      for(int i=0; i<date.length; i++) { 
//        date[i] = Integer.parseInt(dateStampString[i]);
//        time[i] = Integer.parseInt(timeStampString[i]);
//      }
//    }
//    catch(Exception e) {
//      println(e);
//    }
//  }
  
//  int year() {
//    return date[0];
//  }
//  int month() {
//    return date[1];
//  }
//  int day() {
//    return date[2];
//  }
//  int hour() {
//    return time[0];
//  }
//  int minute() {
//    return time[1];
//  }
//  int second() {
//    return time[2];
//  }
//}