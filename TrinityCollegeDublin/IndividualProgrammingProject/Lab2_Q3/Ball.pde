class Ball {
  
  float x; float y;
  float dx; float dy;
  int radius;
  color ballColor = color(200, 100, 50);

  Ball(){
   x = random(SCREENX/4, SCREENX/2);
   y = random(SCREENY/4, SCREENY/2);
   dx = random(1, 2); 
   dy = random(1, 2);
   radius=5;
  }

  void move(){
    x = x+dx; 
    y = y+dy;
    if(x+radius>=SCREENX || x<=radius) dx = -dx;

  }
  void draw(){
      fill(ballColor);
      ellipse(int(x), int(y), radius, radius);
  }
  
  void reset() {
    if (y>280 || y < -30) {
       x = random(SCREENX/4, SCREENX/2);
       y = random(SCREENY/4, SCREENY/2);
       dx = random(1, 2); 
       dy = random(1, 2);
    }
  }
  

  void collide(Player tp){
    if(x+radius>=SCREENX || x<=radius) dx = -dx;
    //if(x-radius<=0) dx=-dx;
    //else if(x+radius>=SCREENX) dx=-dx;
    if(y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT && x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH){
      println("collided!");
      dy=-dy;
    }
   }
   
  void collide2(ComputerPlayer tp){
    if(x+radius>=SCREENX || x<=radius) dx = -dx;
    //if(x-radius<=0) dx=-dx;
    //else if(x+radius>=SCREENX) dx=-dx;
    if(y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT && x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH){
      println("collided!");
      dy=-dy;
    }
   }

}
