int i;                     // declare variable
void setup() {             // setup for background containing square
  size(200, 200);          // command to build background window
  noStroke();              // for figure drawn no stroke around it
  //fill(255, 0, 0);         // RGB code to colour inside of figure
  i=0;                     // where to start off variables
}

void draw() {             // command to build
  background(255);         // colour of background
  fill(0, 255, 0);
  rect(i, 50, 50, 50);      // figure built @ (x1, y1, width, height)
  if (i++>=149) i=0;        // when to wrap around
}
