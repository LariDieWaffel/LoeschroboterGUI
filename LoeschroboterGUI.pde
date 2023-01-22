import controlP5.*;
import processing.serial.*;

Serial port;

ControlP5 cp5; //erstellt ein Window
PFont fontBtn;
PFont textFont;

void setup ()
{
  size (1000, 800); //Windowsize, (Breite, Höhre)
  
  printArray(Serial.list()); //Gibt alle möglichen Ports aus
  
  //port = new Serial(this, "COM3", 9600); //legt serial port fest
  
  cp5 = new ControlP5(this); 
  
  fontBtn = createFont("calibri light", 25); //legt die Eigenschaften der Schrift der Btns fest
  
  cp5.addButton("Wasser") //erstellt einen neuen Button namens "Wasser"
    .setPosition(400, 350) //Position der Ecke links Oben (x, y)
    .setSize(200, 100) //Größe (Breite, Höhe)
    .setFont(fontBtn) //setzt die Schriftgröße auf das bei der Variable angegeben
    .setColorBackground(color(#00ADB3)) //verändert die Hintergrundfarbe des Buttons (r, g, b)
  ;
  
  cp5.addButton("Rechts")
    .setPosition(650, 350)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(250, 0, 0))
    .setColorForeground(color(255, 102, 0))
    .setColorActive(color(250, 0, 0))
  ;
  
  cp5.addButton("Links")
    .setPosition(150, 350)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(250, 0, 0))
    .setColorForeground(color(255, 102, 0))
    .setColorActive(color(250, 0, 0))
  ;
  
  cp5.addButton("Vor")
    .setPosition(400, 200)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(255, 102, 0))
    .setColorForeground(color(250, 0, 0))
    .setColorActive(color(255, 102, 0))
  ;
  
  cp5.addButton("Stop")
    .setPosition(400, 500)
    .setSize(200,100)
    .setFont(fontBtn)
    .setColorBackground(color(255, 102, 0))
    .setColorForeground(color(250, 0, 0))
    .setColorActive(color(255, 102, 0))
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

void Stop()
{
  port.write('s');
} 
