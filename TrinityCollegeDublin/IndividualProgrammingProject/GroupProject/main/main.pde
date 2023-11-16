String lines[];
Table table;
ArrayList<String> headers;
ArrayList<spaceObject> spaceObjectsArray;
spaceObject spaceShip;
PFont myFont = loadFont("Geneva-18.vlw");

void settings() {
  size(400, 400);
}

void setup() {
  
  /*String[] lines = loadStrings("gcat.tsv");
  println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) {
    println(lines[i]);
  }*/
  
  table = loadTable("gcat.tsv", "tsv");
  //println(table.getColumnCount());
  
  ArrayList<String> headers = new ArrayList<String>();
  for (int i = 0; i < table.getColumnCount(); i++) {
    headers.add(table.getString(0, i));
  }
  
  for (int i = 0; i < 41; i++) {
    println(headers.get(i));
  }
  
  ArrayList<spaceObject> spaceObjectsArray = new ArrayList<spaceObject>();
  for (int r = 0; r < table.getRowCount(); r++) {
      spaceObject spaceShip = new spaceObject();
      spaceShip.jcat = table.getString(r, 0);
      spaceShip.satcat = table.getString(r, 1);
      spaceShip.piece = table.getString(r, 2);
      spaceShip.type = table.getString(r, 3);
      spaceShip.Name = table.getString(r, 4);
      spaceShip.plname = table.getString(r, 5);
      spaceShip.ldate = table.getString(r, 6);
      spaceShip.parent = table.getString(r, 7);
      spaceShip.sdate = table.getString(r, 8);
      spaceShip.primary = table.getString(r, 9);
      spaceShip.ddate = table.getString(r, 10);
      spaceShip.status = table.getString(r, 11);
      spaceShip.dest = table.getString(r, 12);
      spaceShip.owner = table.getString(r, 13);
      spaceShip.state = table.getString(r, 14);
      spaceShip.manufacturer = table.getString(r, 15);
      spaceShip.bus = table.getString(r, 16);
      spaceShip.motor = table.getString(r, 17);
      spaceShip.mass = table.getString(r, 18);
      spaceShip.massflag = table.getString(r, 19);
      spaceShip.drymass = table.getString(r, 20);
      spaceShip.dryflag = table.getString(r, 21);
      spaceShip.totmass = table.getString(r, 22);
      spaceShip.totflag = table.getString(r, 23);
      spaceShip.Length = table.getString(r, 24);
      spaceShip.lflag = table.getString(r, 25);
      spaceShip.diameter = table.getString(r, 26);
      spaceShip.dflag = table.getString(r, 27);
      spaceShip.span = table.getString(r, 28);
      spaceShip.spanflag = table.getString(r, 29);
      spaceShip.shape = table.getString(r, 30);
      spaceShip.odate = table.getString(r, 31);
      spaceShip.perigee = table.getString(r, 32);
      spaceShip.pf = table.getString(r, 33);
      spaceShip.apogee = table.getString(r,34);
      spaceShip.af = table.getString(r, 35);
      spaceShip.inc = table.getString(r, 36);
      //spaceShip.IF = table.getString(r, 37);
      spaceShip.oporbit = table.getString(r, 37);
      spaceShip.oqual = table.getString(r, 38);
      spaceShip.altnames = table.getString(r, 39);
      spaceObjectsArray.add(spaceShip);
    }
    
    for (int x = 0; x < spaceObjectsArray.size(); x++) {
      println(spaceObjectsArray.get(x).Name);
      //text(spaceObjectsArray.get(x).Name);
    }
    
    //text("All your base are belong to us!", 20, 20);

}
void draw() {
  background(255);
  
  /*for (int i=0; i < lines.length; i++) {
    println(lines[i]);
  }*/
}
