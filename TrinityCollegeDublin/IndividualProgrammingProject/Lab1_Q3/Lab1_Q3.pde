int i;                     // declare variable
int i2;   
void setup() {             // setup for background containing square
  size(200, 200);          // command to build background window
  noStroke();              // for figure drawn no stroke around it
  fill(17, 48, 130);         // RGB code to colour inside of figure
  i=0;                     // where to start off variables
  i2=200;
}

void draw() {             // command to build
  background(255);         // colour of background
  rect(i, 50, 50, 50);      // figure built @ (x1, y1, width, height)
  if (i++>=349) i=-50;        // when to wrap around
  rect(i2, 50, 50, 50);      
  if (i2++>=349) i2=-50;         
}
