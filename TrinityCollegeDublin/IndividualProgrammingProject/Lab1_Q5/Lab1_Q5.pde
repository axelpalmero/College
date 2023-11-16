int i;                     // declare variable
int i2;
float i3;
void setup() {             // setup for background containing square
  size(300, 200);          // command to build background window
  noStroke();              // for figure drawn no stroke around it
  //dx = (TWO_PI / 500) * 16;
  i=0;   // where to start off variables
  i2=0;
  i3=100;
}

void draw() {             // command to build
  background(255);         // colour of background
  fill(i2, 48, 130); 
  rect(i3, sin(float(i)/100)*100+50 , 50, 50);      // figure built @ (x1, y1, width, height)
  if (i++>=349) i=-50;        // when to wrap around
  i3+=0.5;
  if (i2++>=254) i2=0;
}
