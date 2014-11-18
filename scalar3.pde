
// for this I've used third party library
// please put the jar files in the "library" folder to run

import isolines.*;
import channels.*;

Isolines finder;
PImage img;
int threshold = 200;

void setup() {

  img = loadImage("brain.png");
  size(img.width, img.height);

  finder = new Isolines(this, img.width, img.height);
}

void draw() {
  image(img, 0,0);
 
  finder.setThreshold(threshold);
  // Use the Channels library to extract

  int[] pix = Channels.hue(img.pixels);
  // find the isolines 
  finder.find(pix);

  // draw the contours
  stroke(0);
  for (int k = 0; k < finder.getNumContours(); k++) {
    finder.drawContour(k);
  }
  
  text("threshold: " + threshold, width-150, 20);
}

void keyPressed() {
  if (key == '-') {
    threshold-=5;
    if (threshold < 0) {
      threshold = 0;
    }
  }
  if (key == '=') {
    threshold+=5;
  }
}

