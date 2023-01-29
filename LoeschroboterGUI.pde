import controlP5.*;
import processing.serial.*;

Serial port;

ControlP5 cp5; //erstellt ein Fenster

PFont fontBtn;
PFont textFont;
PFont fontWater;

void setup ()
{
  size (1000, 800); //Windowsize, (Breite, Höhre)
  
  printArray(Serial.list()); //Gibt alle möglichen Ports aus

  
  //String portName = Serial.list()[3];
  
  //port = new Serial(this, "COM3", 9600); //legt serial port fest
  
  cp5 = new ControlP5(this); 
  
  fontBtn = createFont("calibri light", 25); //legt die Eigenschaften der Schrift der Btns fest
  
  cp5.addButton("Wasser") //erstellt einen neuen Button namens "Wasser"
    .setPosition(750, 650) //Position der Ecke links Oben (x, y)
    .setSize(200, 100) //Größe (Breite, Höhe)
    .setFont(fontBtn) //setzt die Schriftgröße auf das bei der Variable angegeben
    .setColorBackground(color(#00ADB3)) //verändert die Hintergrundfarbe des Buttons (r, g, b)
  ;
  
  //Btns für die Steuerung
  cp5.addButton("Rechts")
    .setPosition(650, 350)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(255, 102, 0))
    .setColorForeground(color(250, 0, 0))
    .setColorActive(color(255, 102, 0))
  ;
  
  cp5.addButton("Links")
    .setPosition(150, 350)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(255, 102, 0))
    .setColorForeground(color(250, 0, 0))
    .setColorActive(color(255, 102, 0))
  ;
  
  cp5.addButton("Vor")
    .setPosition(400, 200)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(255, 102, 0))
    .setColorForeground(color(250, 0, 0))
    .setColorActive(color(255, 102, 0))
  ;
  
  cp5.addButton("Zurück")
    .setPosition(400, 500)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(255, 102, 0))
    .setColorForeground(color(250, 0, 0))
    .setColorActive(color(255, 102, 0))
  ;
  
  cp5.addButton("Stopp")
    .setPosition(400, 350)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(250, 0, 0))
    .setColorForeground(color(255, 102, 0))
    .setColorActive(color(250, 0, 0))
  ;
  
  //Btns für die Wasserstandsanzeige
  
  fontWater = createFont("calibri light", 18);
  
  cp5.addButton("Wasserstand")
  .setPosition(750, 50)
  .setSize(125, 30)
  .setFont(fontWater)
  .setColorBackground(color(0, 102, 0))
  .setColorForeground(color(0, 102, 0))
  .setColorActive(color(0, 102, 0))
  ;
  
  cp5.addButton("75%")
  .setPosition(750, 80)
  .setSize(125, 30)
  .setFont(fontWater)
  .setColorBackground(color(0, 102, 0))
  .setColorForeground(color(0, 102, 0))
  .setColorActive(color(0, 102, 0))
  ;
  
  cp5.addButton("50%")
  .setPosition(750, 110)
  .setSize(125, 30)
  .setFont(fontWater)
  .setColorBackground(color(0, 102, 0))
  .setColorForeground(color(0, 102, 0))
  .setColorActive(color(0, 102, 0))
  ;
  
  cp5.addButton("25%")
  .setPosition(750, 140)
  .setSize(125, 30)
  .setFont(fontWater)
  .setColorBackground(color(0, 102, 0))
  .setColorForeground(color(0, 102, 0))
  .setColorActive(color(0, 102, 0))
  ;
}

void draw()
{
  background(29, 29, 29); // Hintergrundfarbe des Fensters
  
  textFont = createFont("calibri light", 40); //legt die Eigenschaften der Schrift des Textes fest
  text("Steuere die Löschente!", 150, 100); //Text ("Text", x-Koordinate, y-Koordinate)
  fill(255, 255, 255); //Textfarbe (r. g, b)
  textFont(textFont); //Schriftart nach Def. von Btn
}

 void serialEvent() //Wenn Daten gegeben sind
 {
    char val = port.readChar (); //legt char an mit dem, was die IDE sendet
    
    //Wenn mehr als 50% Wasser vorhanden ist, sendet die IDE "b", woraufhin das GUI 4 Buttons erstellt, die alle grün sind und somit einen grünen Tank erstellen
    if(val == 'b') 
    {
      cp5.addButton("Wasserstand")
      .setPosition(750, 50)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 102, 0))
      .setColorForeground(color(0, 102, 0))
      .setColorActive(color(0, 102, 0))
      ;
  
      cp5.addButton("75%")
      .setPosition(750, 80)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 102, 0))
      .setColorForeground(color(0, 102, 0))
      .setColorActive(color(0, 102, 0))
      ;
    
      cp5.addButton("50%")
      .setPosition(750, 110)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 102, 0))
      .setColorForeground(color(0, 102, 0))
      .setColorActive(color(0, 102, 0))
      ;
    
      cp5.addButton("25%")
      .setPosition(750, 140)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 102, 0))
      .setColorForeground(color(0, 102, 0))
      .setColorActive(color(0, 102, 0))
      ;
      }
      
      //Wenn mehr als 50% Wasser vorhanden ist, sendet die IDE "n", woraufhin das GUI 4 Buttons erstellt, wo vorher die grünen waren, wo die oberen schwarz und die untern gelb sind
    else if(val == 'n')
      {
      cp5.addButton("Wasserstand")
      .setPosition(750, 50)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 0, 0)) //Button mit scharzem Hintergrund über vorherigen gelegt
      .setColorForeground(color(0, 0, 0))
      .setColorActive(color(0, 0, 0))
      ;
  
      cp5.addButton("75%")
      .setPosition(750, 80)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 0, 0)) //Button mit scharzem Hintergrund über vorherigen gelegt
      .setColorForeground(color(0, 0, 0))
      .setColorActive(color(0, 0, 0))
      ;
    
      cp5.addButton("50%")
      .setPosition(750, 110)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(204, 170, 0)) //Button mit gelbem Hintergrund über vorherigen gelegt
      .setColorForeground(color(204, 170, 0))
      .setColorActive(color(204, 170, 0))
      ;
    
      cp5.addButton("25%")
      .setPosition(750, 140)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(204, 170, 0)) //Button mit gelbem Hintergrund über vorherigen gelegt
      .setColorForeground(color(204, 170, 0))
      .setColorActive(color(204, 170, 0))
      ;
      }
      
      //Wenn mehr als 50% Wasser vorhanden ist, sendet die IDE "m", woraufhin das GUI 4 Buttons erstellt, wo vorher die gelben und schwarzen waren, wo die oberen 3 schwarz und der untere rot ist.
    else if(val == 'm')
      {
      cp5.addButton("Wasserstand")
      .setPosition(750, 50)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 0, 0)) //Button mit scharzem Hintergrund über vorherigen gelegt
      .setColorForeground(color(0, 0, 0))
      .setColorActive(color(0, 0, 0))
      ;
  
      cp5.addButton("75%")
      .setPosition(750, 80)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 0, 0)) //Button mit scharzem Hintergrund über vorherigen gelegt
      .setColorForeground(color(0, 0, 0))
      .setColorActive(color(0, 0, 0))
      ;
    
      cp5.addButton("50%")
      .setPosition(750, 110)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(0, 0, 0)) //Button mit scharzem Hintergrund über vorherigen gelegt
      .setColorForeground(color(0, 0, 0))
      .setColorActive(color(0, 0, 0))
      ;
    
      cp5.addButton("25%")
      .setPosition(750, 140)
      .setSize(125, 30)
      .setFont(fontWater)
      .setColorBackground(color(128, 0, 0)) //Button mit rotem Hintergrund über vorherigen gelegt
      .setColorForeground(color(128, 0, 0))
      .setColorActive(color(128, 0, 0))
      ;
      }
      else
      {
      //
      }
}



void Wasser()  //erstellt funk für den Btn Wasser
{
  port.write('q');  //gibt an Ardunio 'q', was dort dann die Pumpe auslöst
}

void Rechts()
{
  port.write('d');
}

void Links()
{
  port.write('a');
}

void Vor()
{
  port.write('w');
}

void Zurück()
{
  port.write('s');
} 

void Stop()
{
  port.write('e');
}
