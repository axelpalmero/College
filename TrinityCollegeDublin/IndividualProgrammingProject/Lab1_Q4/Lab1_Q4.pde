int i;                     // declare variable
int i2;
int i3;
int i4;
void setup() {             // setup for background containing square
  size(200, 200);          // command to build background window
  noStroke();              // for figure drawn no stroke around it
  i=0;                     // where to start off variables
  i2=200;
  i3=0;
  i4=200;
}

void draw() {             // command to build
  background(255);         // colour of background
  fill(17, 48, 130); 
  rect(i, 50, 50, 50);      // figure built @ (x1, y1, width, height)
  if (i++>=349) i=-50;        // when to wrap around
  fill(17, 48, 130); 
  rect(i2, 50, 50, 50);      
  if (i2++>=349) i2=-50;
  
  fill(19, 235, 197); 
  rect(i3, 150, 50, 50);     
  if (i3--<-50) i3=350;  
  fill(19, 235, 197); 
  rect(i4, 150, 50, 50);     
  if (i4--<-50) i4=350; 
}
