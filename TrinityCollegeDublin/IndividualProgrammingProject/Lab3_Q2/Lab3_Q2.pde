
final int SCREENX = 400;
final int SCREENY = 400;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 20;
final int STARTINGXPOS = 150;
final int STARTINGYPOS = 150;
Boolean paused;

Alien theAlien;
Alien myAliens[];
Player thePlayer;
Bullet theBullet;
Bomb theBomb;
Bomb myBombs[];

void settings() {
  size(400, 400);
}

void setup() {
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT, mouseX);
  theBullet = new Bullet(thePlayer.ypos, thePlayer.x);
  myAliens = new Alien[10];
  init_array(myAliens);
  theBomb = new Bomb(150, 50, bombPic);
  frameRate(200);
}

void draw() {
  background(255);
  //theAlien.move();
  //theAlien.draw();
  //mousePressed();
  draw_array(myAliens);
  //explode_array(myAliens);
  thePlayer.move(mouseX);
  thePlayer.draw();
  theBullet.draw();
  theBullet.move();
  theBullet.collide(myAliens);
  theBullet.reset();
  theBomb.draw();
  theBomb.move();
  if(theBomb.collide(thePlayer)){
    noLoop(); 
    theBomb.printMessage();
  }
  /*dropBombs(myAliens);
  for (int i = 0; i < myAliens.length; i++) {
    if (myAliens[i].alienBomb != null) {
      myAliens[i].alienBomb.draw();
      myAliens[i].alienBomb.move();
    }
    if(myAliens[i].alienBomb!=null) {
      if(myAliens[i].alienBomb.collide(thePlayer)){
        myAliens[i].alienBomb.printMessage();
      }
    }
  }*/

}
void init_array(Alien theArray[]) {
  for (int i = 0; i < theArray.length; i++)
    theArray[i] = new Alien(i*30, 0, myImage);
}
void draw_array(Alien theArray[]) {
  for (int i = 0; i < theArray.length; i++) {
    theArray[i].draw();
    theArray[i].move();
  }
}
/*void explode_array(Alien theArray[]) {
  for (int i = 0; i < theArray.length; i++) {
    theArray[i].explode();
  }
}*/
/*void dropBombs(Alien theArray[]){
  for (int i = 0; i < theArray.length; i++){
    theArray[i].dropBomb();
  }
}*/


void mousePressed() {
  theBullet.x = thePlayer.xpos+25;
  theBullet.mouse = true;
}
