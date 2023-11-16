class Player {
  int xpos; int ypos;
  int x; int y;
  color paddlecolor = color(50);
  int lives;

  Player(int screen_y, int screen_x)
  {
    xpos=screen_x;
    ypos=screen_y;
    lives=3;
  }
  void move(int x){
    if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  
  void draw(){
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  /*void livesCount(){
    if(theBall.y>SCREENY) {
      if (lives>0) lives--;
      else println("You lost!!");
    }*/
  
}
