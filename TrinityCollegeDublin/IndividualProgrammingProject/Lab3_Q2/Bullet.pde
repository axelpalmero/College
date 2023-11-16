class Bullet {
  
  int x; int y;
  int radius;
  color bulletColor = color(0, 255, 0);
  Boolean mouse = false;
  PImage myImage, anotherImage, currentImage;
  //ArrayList bullets;

  Bullet(int screen_y, int screen_x){
   x = screen_x;
   y = screen_y;
   radius=10;
  }

  void move(){
    if (mouse && y>=-20) {
      y--; 
    }
    else if (y==-10) {
      reset();
    }
  }
  void draw(){
      if (mouse == true) {
         fill(bulletColor);
        noStroke();
        ellipse((x), (y), radius, radius);
   }
      if (y<-20) {
        mouse = false;
      }  
}
  
  void reset() {
      if (y<-20) {
        mouse = false;
      }
  }

  void collide(Alien[] tp){
    for (int i = 0; i < tp.length; i++) {
      //if(x-radius<=0) dx=-dx;
      //else if(x+radius>=SCREENX) dx=-dx;
      //if(y+radius >= tp[i].y && y-radius<tp[i].y+PADDLEHEIGHT && x >=tp[i].x && x <= tp[i].x+PADDLEWIDTH){
      //if((y+radius == (tp[i].y+30)) && (x+radius == (tp[i].x-30))){
      if(y+radius == (tp[i].y+30) && (x == tp[i].x || x<(tp[i].x+30))) {
        tp[i].currentImage = tp[i].anotherImage;
        //exit();
      }
    }

   
  /*void collide2(ComputerPlayer tp){
    if(x+radius>=SCREENX || x<=radius) dx = -dx;
    //if(x-radius<=0) dx=-dx;
    //else if(x+radius>=SCREENX) dx=-dx;
    if(y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT && x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH){
      println("collided!");
      dy=-dy;
    }
   }*/

  }
}
