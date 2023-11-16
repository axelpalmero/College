  
  final int SCREENX = 320;
  final int SCREENY = 240;
  final int PADDLEHEIGHT = 15;
  final int PADDLEWIDTH = 50;
  final int MARGIN = 10;
 
  Player thePlayer;
  ComputerPlayer theComputerPlayer;
  Ball theBall;
  
  void settings(){
    size(SCREENX, SCREENY);
  }
  void setup(){
    thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
    theComputerPlayer = new ComputerPlayer(SCREENY-MARGIN-PADDLEHEIGHT);
    theBall = new Ball();
    ellipseMode(RADIUS);
  }
  void draw() {
    background(0);
    thePlayer.move(mouseX);
    theComputerPlayer.move();
    theBall.move();
    theBall.collide(thePlayer);
    theBall.collide2(theComputerPlayer);
    thePlayer.draw();
    theComputerPlayer.draw();
    theBall.draw();
    //theBall.reset();
    mousePressed();
    //thePlayer.livesCount();
  }

  void mousePressed() {
    theBall.reset();
  }
