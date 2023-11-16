class Bomb {
  
  int x; int y;
  PImage bombPic;
  Boolean exitScreen;
  PFont myFont = loadFont("Geneva-18.vlw"); 
  
  Bomb(int a, int b, PImage bombImage){
    bombPic = loadImage("bomb.gif");
    bombPic.resize(60, 0);
    x=a;
    y=b;
    bombImage = bombPic;
    exitScreen = false;
  }
  
  void move() {
    y++;
  }
  
  void draw(){
    image(bombPic, (float)x, (float)y);
  }
  
  void offscreen(){
    if(y>=400){
      exitScreen=true;
    }
  }
  
  boolean collide(Player tp){
    //if (y == 360 && (thePlayer.xpos >= 120 || thePlayer.xpos <= 250)) {
    //if (y == (tp.y+30) && (x == tp.x || x<(tp.x+30))) {
    //if ((y==360 && tp.xpos>140) || (y==360 && tp.xpos<160)) {
    if (y==360 && (tp.xpos>140 && tp.xpos<160)) {
    //if (y==tp.ypos && (x>tp.xpos && x<tp.xpos+50)) {
      //exit();
      return true;
    }
    else {
      return false;
    }
  }
  
  void printMessage(){
    size(400, 400);
    background(155);
    textFont(myFont); 
    text("Game over!", 150, 125);
  }
  
}
