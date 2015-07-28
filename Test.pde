import g4p_controls.*;

GButton b1, b2;

void setup() {
  size (200, 100);
  b1 = new GButton(this, 0, 0, 50, 50, "on");
  b2 = new GButton(this, 150, 0, 50, 50, "off");
}

void draw() {
  background(200, 200, 255);
}

void handleButtonEvents(GButton button, GEvent event) {
  if (button == b1 && event == GEvent.CLICKED) {
    println("on");
  }
}

