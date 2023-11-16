

  final int STARTINGXPOS = 150;
  final int STARTINGYPOS = 0;

  Alien theAlien;
  Boolean paused;

void settings() {
  size(400, 400);
}
void setup(){
    //x = 0;
    theAlien = new Alien(150, 0, myImage);
    frameRate(200);
}

void draw(){
  /* clear the screen */
  /* move the alien */
  /* draw the alien */
  background(255);
  theAlien.move();
  theAlien.draw();
  //mousePressed();
}

void mousePressed() {
  theAlien.restart();
}
 
