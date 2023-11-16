class Widget {
int x, y, width, height;
String label; int event;
color widgetColor, labelColor, boarderColor;
PFont widgetFont;

 Widget(int x,int y, int width, int height, String label,
  color widgetColor, PFont widgetFont, int event){
   this.x=x; this.y=y; this.width = width; this.height= height;
   this.label=label; this.event=event;
   this.widgetColor=widgetColor; this.widgetFont=widgetFont;
   labelColor= color(0); boarderColor = color(255);
 }
 
 void draw(){
  fill(widgetColor);
  stroke(boarderColor);
  rect(x,y,width,height);
  fill(labelColor);
  text(label, x+15, y+height-20);
 }

 int getEvent(int mX, int mY){
  if(mX>x && mX < x+width && mY >y && mY <y+height){
    return event;
  }
  return EVENT_NULL;
 }

 void mouseOver() {
  boarderColor = color(0);
 }
 
 void mouseNotOver() {
  boarderColor = color(255);
 } 
}
