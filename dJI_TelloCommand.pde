void sendData(String input) {
  byte[] byteBuffer = input.getBytes();
  udp.send(byteBuffer, "192.168.10.1", 8889);
}

void receive( byte[] data ) {  
  String received = "";
  for (int i=0; i < data.length; i++) {
    received+=char(data[i]);
  }  
  println(received);
  String[] rawArray = split(received, ';');
  for (int i = 0; i < rawArray.length - 1; i++) {
    String[] telloData = split(rawArray[i], ':');
    hm.put(telloData[0], float(telloData[1]));
  }
}

void takeOff() {
  println("Take Off");
  sendCommand("takeoff");
}

void landing() {
  println("Landing");
  sendCommand("land");
}

void sendCommand(String input) {
  println(input);
  byte[] byteBuffer = input.getBytes();
  udp.send(byteBuffer, "192.168.10.1", 8889);
}

//void receiveFromTello( byte[] data ) {    
//  String received = "";
//  for (int i=0; i < data.length; i++) {
//    received+=char(data[i]);     
//  }  
//  //println(received);
//}

void keyPressed() {

  char formatedKey = key;
  // Take and Land
  if     (formatedKey == 'x') {
    sendData("takeoff");
  } else if (formatedKey == 'z') {
    sendData("land");
  } else if (formatedKey == 'w') {
    sendData("forward 30");
  } else if (formatedKey == 'a') {
    sendData("left 30");
  } else if (formatedKey == 's') {
    sendData("back 30");
  } else if (formatedKey == 'd') {
    sendData("right 30");
  } else if (formatedKey == 'u') {
    sendData("up 30");
  } else if (formatedKey == 'h') {
    sendData("ccw 30");
  } else if (formatedKey == 'j') {
    sendData("down 30");
  } else if (formatedKey == 'k') {
    sendData("cw 30");
  }
}

