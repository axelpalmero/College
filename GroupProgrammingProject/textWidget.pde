class TextWidget extends newWidget{
  int maxlen; // this the max length that user can input;
  String userInput = "";
  
    TextWidget(int x, int y, int width, int height, String label, color widgetColor, PFont font, int event, int maxlen) 
    {
    this.x=x;
    this.y=y;
    this.width=width;
    this.height=height;
    this.label=label;
    this.widgetColor=widgetColor;
    this.widgetFont=font;
    this.event=event;
    this.maxlen=maxlen; 
    //this.userInput = userInput;
     
    labelColor=color(0);
  }

 // add elements and the type is char
  void append(char s) 
  {
    // when user press backspace 
    if (s==BACKSPACE) 
    {
      if (!label.equals("")) // when label != "" , judge whether label is empty, if it is empty, the length of label minus 1, i.e delet words
      {
        label = label.substring(0, label.length()-1);  // keep content fro, index0 to label.length()-1 
        
      }
    } 

    // when user press other keyboards, add the new chars to original chars. when the length is more that max length, the program will terminate.
    else if (label.length()<maxlen)
    {
      label = label + str(s); 
    }
  }
}
