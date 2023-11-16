
class ComputerPlayer {
  
  int xpos; int ypos;
  color paddlecolor = color(30);

  ComputerPlayer(int screen_x)
  {
    xpos=screen_x;
    ypos=MARGIN;
  }
  void move(){
    if(theBall.x<xpos+PADDLEWIDTH/2) xpos--;
    else xpos++;
  }
  
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
}
