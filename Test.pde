import g4p_controls.*;
import processing.serial.*;
GButton b1, b2;
boolean firstContact = false; 
Serial myPort; // The serial port

void setup() {
  size (200, 100);
  println(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  b1 = new GButton(this, 0, 0, 50, 50, "on");
  b2 = new GButton(this, 150, 0, 50, 50, "off");
}

void draw() {
  background(200, 200, 255);
}

void handleButtonEvents(GButton button, GEvent event) {
  if (button == b1 && event == GEvent.CLICKED) {
    myPort.write(1);
  }

  if (button == b2 && event == GEvent.CLICKED) {
    myPort.write(2);
  }
}
void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A,
  // clear the serial buffer and note that you've
  // had first contact from the microcontroller.
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  }
}

