

class Alien {
  
  Boolean moveLeft = false; 
  Boolean moveRight = true; 
  Boolean moveDown = false;
  PImage myImage, anotherImage, currentImage;
  int x; int y;
  int xpos; int ypos;
  Bomb alienBomb;
  
 /* declare variables for alien position, direction of movement and appearance */

 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */


 
 Alien(int a, int b, PImage alienImage){
   
    myImage = loadImage("invader.gif");
    anotherImage = loadImage("exploding.gif");
    currentImage = myImage;
    
   x = a;
   y = b;
   alienImage = myImage;
  
 }
  
 void move(/*int a, int b*/){
  /* Move the alien according to the instructions in the exercise */ 
  //if ((xpos == 400 || xpos == 0) && (ypos == 0 || ypos%67==0)) 
  if (x == 370 && y == 0) {
    moveLeft = false;
    moveRight = false;
    moveDown = true;
  }
  if (x == 370 && y == 67) {
    moveLeft = true;
    moveRight = false;
    moveDown = false;
  }
  if (x==0 && y==67){
    moveLeft = false;
    moveRight = false;
    moveDown = true;
  }
  if (x==0 && y==134){
    moveLeft = false;
    moveRight = true;
    moveDown = false;
  }
  if (x==370 && y==134){
    moveLeft = false;
    moveRight = false;
    moveDown = true;
  }
  if (x==370 && y==201){
    moveLeft = true;
    moveRight = false;
    moveDown = false;
  }
  if (x==0 && y==201){
    moveLeft = false;
    moveRight = false;
    moveDown = true;
  }
  if (x==0 && y==268){
    moveLeft = false;
    moveRight = true;
    moveDown = false;
  }
  if (x==370 && y==268){
    moveLeft = false;
    moveRight = false;
    moveDown = true;
  }
  if (x==370 && y==335){
    moveLeft = true;
    moveRight = false;
    moveDown = false;
  }
  if (x==0 && y==335){
    moveLeft = false;
    moveRight = false;
    moveDown = true;
  }
  
    /* if(x==a && y==b){
      currentImage = anotherImage;
    } */
 
 }
  
  void draw(){
    /* Draw the alien using the image() method demonstrated in class */
    image(currentImage, (float)x, (float)y);
    /*for (int z = 0; z<400; z++){
      x++;
    }
    for (int z2 = 0; z2<100; z2++){
      y++;  
    }
    for (int z3 = 0; z3<400; z3++){
      x--;
    }
    for (int z4 = 0; z4<100; z4++){
      y++;
    }
    loop();*/
    if (moveRight) {
      x++;
      y+=0;
    }
    else if (moveLeft) {
      x--;
      y+=0;
    }
    else if (moveDown) {
      x+=0;
      y++;
    }
  }
  
  void explode(){
    int a = (int)random(0, 400);
    //int b = (int)random(0, 400);
    if(a<1){
      currentImage = anotherImage;
    }
  }
  
  void dropBomb() {
    int a = (int)random(0, 400);
    if (a < 1) {
      alienBomb = new Bomb(x, y, bombPic); 
  }
    
  }
  
 /*void restart() {
    currentImage = anotherImage;
 }*/
 
}
