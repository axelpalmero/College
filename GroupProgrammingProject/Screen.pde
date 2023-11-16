class Screen {
ArrayList theScreenWidgets;
color screenColor;

 Screen(color screenColor){
  theScreenWidgets=new ArrayList();
  this.screenColor=screenColor;
 }

 void add(Widget x){
  theScreenWidgets.add(x);
 }

 void draw(){
  background(screenColor);
  for(int i = 0; i<theScreenWidgets.size(); i++){
    Widget theWidget = (Widget)theScreenWidgets.get(i);
    theWidget.draw();
  }
 }

 int getEvent(int mouseX, int mouseY){
  for(int i = 0; i<theScreenWidgets.size(); i++){
   Widget theWidget = (Widget) theScreenWidgets.get(i);
   int event = theWidget.getEvent(mouseX,mouseY);
   if(event != EVENT_NULL){
     return event;
   }
  }
  return EVENT_NULL;
 }

 ArrayList getWidgets() {
   return theScreenWidgets;
 }
}
