
Table table;
PFont myFont;
ArrayList<SpaceObject> theSpaceObject = new ArrayList<SpaceObject>();
final int EVENT_NULL = 0; 
final int EVENT_1 =1; 
final int EVENT_2= 2;
final int EVENT_3= 3;
final int EVENT_4= 4;
static final int TEXT_WIDGET = 1; 
int value = 0;
Screen currentScreen, screen1, screen2, screen3, screen4, screenName, screenMass, screenPrimary, screenLdate, screenJcat, screenSatcat, screenStatus, screenType, screenManufacturer, screenParent;

//build an arrayList 
TextWidget textedit;
TextWidget typeOrDelet;
ArrayList myWidgets; 
String currentInput;

int index = 0;
int y;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup() 
{
    myFont = loadFont("ArialMT-18.vlw");
    textFont(myFont);
    Widget widget1, widget2;
    widget1 = new Widget(600, 500, 100, 50, "Summary", color(#32D83E), myFont, EVENT_1);
    widget2 = new Widget(710, 5, 80, 40, "Home", color(200, 4, 5), myFont, EVENT_2);
    
    textedit = new TextWidget(40, 80,145,45, "Search you want", color(#4F4AF5), myFont, TEXT_WIDGET, 14);
    myWidgets = new ArrayList();
    myWidgets.add(textedit);
    typeOrDelet = null;
    
    screen1 = new Screen(color(255));
    screen2 = new Screen(color(255));
    screen1.add(widget2);
    screen2.add(widget1);
    //screen1.add(textedit);
    currentScreen = screen2;
      screenName = new Screen(color(255));
   screenMass = new Screen(color(255));
   screenPrimary = new Screen(color(255));
   screenLdate = new Screen(color(255));
   screenJcat = new Screen(color(255));
   screenSatcat = new Screen(color(255));
   screenStatus = new Screen(color(255));
   screenType = new Screen(color(255));
   screenManufacturer = new Screen(color(255));
   screenParent = new Screen(color(255));
  
    table = loadTable("gcat.tsv", "tsv");
    println(table.getColumnCount()); 
    
    ArrayList<String> headers = new ArrayList<String>();
    for (int i = 0; i< 41; i++) {
      headers.add(table.getString(0, i));
    }
    for (int i = 0; i < 41; i++) {
      println(headers.get(i) + "");
    }
   
  for(int r = 0; r< table.getRowCount(); r++) {
    SpaceObject spaceShip = new SpaceObject();
    spaceShip.JCAT = table.getString(r, 0);
    spaceShip.Satcat = table.getString(r, 1);
    spaceShip.Piece = table.getString(r, 2);
    spaceShip.Type = table.getString(r, 3);
    spaceShip.Name = table.getString(r, 4);
    spaceShip.PLName = table.getString(r, 5);
    spaceShip.LDate = table.getString(r, 6);
    spaceShip.Parent = table.getString(r, 7);
    spaceShip.SDate = table.getString(r, 8);
    spaceShip.Primary = table.getString(r, 9);
    spaceShip.DDate = table.getString(r, 10);
    spaceShip.Status = table.getString(r, 11);
    spaceShip.Dest = table.getString(r, 12);
    spaceShip.Owner = table.getString(r, 13);
    spaceShip.State = table.getString(r, 14);
    spaceShip.Manufacturer = table.getString(r, 15);
    spaceShip.Bus = table.getString(r, 16);
    spaceShip.Motor = table.getString(r, 17);
    spaceShip.Mass = table.getString(r, 18);
    spaceShip.MassFlag = table.getString(r, 19);
    spaceShip.DryMass = table.getString(r, 20);
    spaceShip.DryFlag = table.getString(r, 21);
    spaceShip.TotMass = table.getString(r, 22);
    spaceShip.TotFlag = table.getString(r, 23);
    spaceShip.Length = table.getString(r, 24);
    spaceShip.LFlag = table.getString(r, 25);
    spaceShip.Diameter = table.getString(r, 26);
    spaceShip.DFlag = table.getString(r, 27);
    spaceShip.Span = table.getString(r, 28);
    spaceShip.SpanFlag = table.getString(r, 29);
    spaceShip.Shape = table.getString(r, 30);
    spaceShip.ODate = table.getString(r, 31);
    spaceShip.Perigee = table.getString(r, 32);
    spaceShip.PF = table.getString(r, 33);
    spaceShip.Apogee = table.getString(r, 34);
    spaceShip.AF = table.getString(r, 35);
    spaceShip.Inc = table.getString(r, 36);
    spaceShip.IF = table.getString(r, 37);
    spaceShip.OpOrbit = table.getString(r, 38);
    spaceShip.OQUAL = table.getString(r, 39);
    spaceShip.AltNames = table.getString(r, 40);
    theSpaceObject.add(spaceShip); 
  }
  for(int i = 0; i < 50; i++) {
    println("Name: " + theSpaceObject.get(i).Name);
    println("Mass: " + theSpaceObject.get(i).Mass);
    println("Primary: " + theSpaceObject.get(i).Primary);
    println("LDate: " + theSpaceObject.get(i).LDate);
    println("JCAT: " + theSpaceObject.get(i).JCAT);
    println("Satcat: " + theSpaceObject.get(i).Satcat);
    println("Status: " + theSpaceObject.get(i).Status);
    println("Type: " + theSpaceObject.get(i).Type);
    println("Manufacturer: " + theSpaceObject.get(i).Manufacturer);  
    println("Parent: " + theSpaceObject.get(i).Parent);  
  }
}
    
void draw()
{
  
 currentScreen.draw();
 if (textedit.label.equals("name")) {
    currentScreen = screenName;
  } else if (textedit.label.equals("mass")) {
    currentScreen = screenMass;
  } else if (textedit.label.equals("primary")) {
    currentScreen = screenPrimary;
  } else if (textedit.label.equals("ldate")) {
    currentScreen = screenLdate;
  } else if (textedit.label.equals("jcat")) {
    currentScreen = screenJcat;
  } else if (textedit.label.equals("satcat")) {
    currentScreen = screenSatcat;
  } else if (textedit.label.equals("manufacturer")) {
    currentScreen = screenManufacturer;
  } else if (textedit.label.equals("type")) {
    currentScreen = screenType;
  } else if (textedit.label.equals("primary")) {
    currentScreen = screenParent;
  } else if (textedit.label.equals("status")) {
    currentScreen = screenStatus;
  }
 
 if(currentScreen == screen1) {
   text("Summary Page", 220, -value+20);
  
   for(int i = 1; i<40;i++){
    text("Name: " + theSpaceObject.get(i).Name, 10, -value+50+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Mass: " + theSpaceObject.get(i).Mass, 250,-value+50+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Primary: " + theSpaceObject.get(i).Primary, 400, -value+50+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("LDate: " + theSpaceObject.get(i).LDate, 550, -value+50+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("JCAT: " + theSpaceObject.get(i).JCAT, 10, -value+650+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Satcat: " + theSpaceObject.get(i).Satcat, 150, -value+650+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Status: " + theSpaceObject.get(i).Status, 250, -value+650+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Manufacturer: " + theSpaceObject.get(i).Manufacturer, 350, -value+650+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Type: " + theSpaceObject.get(i).Type, 530, -value+650+(i*15));
   }
   for(int i = 1; i<40;i++){
    text("Parent: " + theSpaceObject.get(i).Parent, 650, -value+650+(i*15));
   }
 }
 else if (currentScreen == screen2) {
   text("Home Page", 20, 20);
   for (int i = 0; i<myWidgets.size(); i++)
  {
    ((newWidget)myWidgets.get(i)).draw();
  }
 
 }
 else if (currentScreen == screenName) {
    for (int i = 1; i<20; i++) {
      text("Name: " + theSpaceObject.get(i).Name, 10, 50+(i*15));
    }
  } else if (currentScreen == screenMass) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Mass, 250, 50+(i*15));
    }
  } else if (currentScreen == screenPrimary) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Primary, 250, 50+(i*15));
    }
  } else if (currentScreen == screenLdate) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).LDate, 250, 50+(i*15));
    }
  } else if (currentScreen == screenJcat) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).JCAT, 250, 50+(i*15));
    }
  } else if (currentScreen == screenSatcat) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Satcat, 250, 50+(i*15));
    }
  } else if (currentScreen == screenStatus) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Status, 250, 50+(i*15));
    }
  } else if (currentScreen == screenType) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Type, 250, 50+(i*15));
    }
  } else if (currentScreen == screenManufacturer) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Manufacturer, 250, 50+(i*15));
    }
  } else if (currentScreen == screenParent) {
    for (int i = 1; i<20; i++) {
      text("Mass: " + theSpaceObject.get(i).Parent, 250, 50+(i*15));
    }
  }
}

void mousePressed(){
 switch(currentScreen.getEvent(mouseX, mouseY)) {
  case EVENT_1:
   println("Summary Button Pressed"); currentScreen=screen1;
   break;
  case EVENT_2:
   println("Home Buttin Pressed!"); currentScreen=screen2;
   break;
 }
} 

void mouseMoved(){
 int event;
 ArrayList widgetList = currentScreen.getWidgets();
 for(int i = 0; i<widgetList.size(); i++){
  Widget theWidget = (Widget) widgetList.get(i);
  event = theWidget.getEvent(mouseX,mouseY);
  if(event != EVENT_NULL){
  theWidget.mouseOver();
 }
 else
  theWidget.mouseNotOver();
 }
 
  int event1;
  for (int i = 0; i < myWidgets.size(); i++) 
  {
    newWidget theWidget1 = (newWidget)myWidgets.get(i);
    event1 = theWidget1.getEvent(mouseX, mouseY);
    
    switch(event1) 
    {
      case TEXT_WIDGET:
      println("Clicked a text widget!");
      typeOrDelet = (TextWidget)theWidget1;
      return; 
      default:
      typeOrDelet=null;
    }
  }
}

void keyPressed() {
  if (typeOrDelet!=null) {
    typeOrDelet.append(key);
  }
}

void mouseWheel(MouseEvent event) 
{
  value += event.getCount();
  

}


void chart(int size){
    while(index<size){
    fill(index*30, index*50, index*20);
    rect(100,y,((Float.parseFloat(theSpaceObject.get(index).Mass))/30),20);
    fill(0);
    text(theSpaceObject.get(index).Name, 5, y+15);
    y = y+30;
    index++; 
  }
}
