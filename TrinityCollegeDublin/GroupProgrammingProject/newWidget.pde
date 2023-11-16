class newWidget{
  int x;
  int y;
  int width;
  int height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;


  void draw() 
  {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }

  int getEvent(int mX, int mY) 
  {
    if (mX>x && mX < x+width && mY>y && mY<y+height)
    {
      return event;
    } else return EVENT_NULL;
  }
}
