int i;                     // declare variable
int i2;   
int i3;
void setup() {             // setup for background containing square
  size(200, 200);          // command to build background window
  noStroke();              // for figure drawn no stroke around it
  //fill(255, 0, 0);         // RGB code to colour inside of figure
  i=0;                     // where to start off variables
  i2=50;
  i3=50;
}

void draw() {             // command to build
  background(255);         // colour of background
  fill(17, 235, 25);
  rect(i, 50, 50, 50);      // figure built @ (x1, y1, width, height)
  if (i++>=199) i=0;        // when to wrap around
  fill(2, 73, 83);
  rect(0, i2, 50, 50);      
  if (i2++>=199) i2=0;
  fill(4, 56, 55);
  rect(0, i3, 50, 50);      
  //if (i3--<=199) i3=199; 
  if (i3--<-50) i3=200;
}
