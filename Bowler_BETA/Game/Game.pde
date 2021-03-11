import java.net.*;    //IMPORTAZIONE LIBRERIE NECESSARIE
import java.io.*;
import java.util.Arrays;
import processing.sound.*;
 
//Dichiarazione dei suoni
SoundFile cannonSound;   //sparo cannone 
SoundFile meteorSound;   //danneggiamento meteorite
SoundFile meteorDestroyedSound; //schianto meteorite
SoundFile gameOverSound; //suono del game over
SoundFile soundtrack; //colonna sonora

//Dichiarazione delle immagini
PImage bg; //sfondo
PImage menu; //menu
PImage gameOver; //schermata game over
PImage HighScoreImage; //high score
PImage ScoreImage;  //score 
PImage warning;    //logo utente fuori dall'inquadratura
PImage tutorial;  //schermata tutorial
PImage restartMessage; //messaggio 1 della schermata gameover
PImage exitMessagge;//messaggio 2 della schermata gameover

//dichiarazione classi
Wall wall; 
Cannon cannon;
Meteor meteor;

//variabili globali
int state=0;      //variabile che determina l'avvio del gioco e il ritorno alle varie finestre del menu
int highScore=0;  //variabile dell'high score

//dichiarazione socket

DatagramSocket socket;
DatagramPacket packet;

byte[] buf = new byte[24];

float nose_x;
float nose_y;

void setup(){
  
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  size(700,700);
  
  //istanziamento suoni
  this.cannonSound = new SoundFile(this, "Media/cannonSound.wav");
  this.meteorSound = new SoundFile(this,"Media/meteorSound.wav");
  this.meteorDestroyedSound = new SoundFile(this,"Media/meteorDestroyedSound.wav");
  this.gameOverSound = new SoundFile(this,"Media/gameOverSound.wav");
  this.soundtrack = new SoundFile(this,"Media/soundtrack.wav");
  
  //istanziamento immagini
  menu = loadImage("Media/menu.jpg");
  bg = loadImage("Media/bg.jpg");
  gameOver = loadImage("Media/gameOver.png");
  HighScoreImage = loadImage("Media/HighScoreImage.png");
  ScoreImage = loadImage("Media/ScoreImage.png");
  tutorial = loadImage("Media/tutorial.jpg");
  warning = loadImage("Media/warning.png");
  restartMessage = loadImage("Media/restart.png");
  exitMessagge = loadImage("Media/exit.png");
  
  //istanziamento oggetti
  wall = new Wall(0,(height*2)/3,width,height/3);
  cannon = new Cannon(float(((width/2)-((width/8)/2))),float((height*8/9)-(height/8)),float(width/8),float(height/8));
  meteor = new Meteor(float(((width/2)-((width/10)/2))), -float(height/8),float(width/8), float(width/8));
  
  //avvio colonna sonora
  soundtrack.amp(0.3);
  soundtrack.loop();
}

void draw(){
  //switch che varia attraverso i diversi stati del gioco
  switch(state){

  case 0: //stato: nel menu
  image(menu,0,0); //apparizione a schermo del menu
  break;
  
  case 1: //stato: in gioco
  try {
    DatagramPacket packet = new DatagramPacket(buf, buf.length);
    socket.receive(packet);
    InetAddress address = packet.getAddress();
    int port = packet.getPort();
    packet = new DatagramPacket(buf, buf.length, address, port);

    nose_x = Float.intBitsToFloat( (buf[0]& 0xFF) ^ (buf[1]& 0xFF)<<8 ^ (buf[2]& 0xFF)<<16 ^ (buf[3]& 0xFF)<<24 );
    nose_y = Float.intBitsToFloat( (buf[4]& 0xFF) ^ (buf[5]& 0xFF)<<8 ^ (buf[6]& 0xFF)<<16 ^ (buf[7]& 0xFF)<<24 );
    
    
  }
  catch (IOException e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  
  
  image(bg,0,0); //apparizione a schermo dello sfondo
  wall.draw();  //disegno il muro
  cannon.draw(); //disegno il cannone
  meteor.draw(); //disegno la meteora
  score(); //funzione che aggiorna e tiene traccia dell'high score e disegna a schermo i punteggi
  checkGameOver(); //funzione che controlla se avviene il gameover 
  camControl(); //funzione che controlla se il volto dell'utente è all'internno dell'inquadratura
  break;
  
  case 2: //stato: schermata gameover
  filter(BLUR,10);  //funzione che sfuoca lo sfondo
  image(gameOver,width/2-125,90,250,200); //apparizione della scritta gameover
  image(restartMessage,width/2-100,height/2-60,200,150); //apparizione del messaggio di restart
  image(exitMessagge,width/2-100,height*2/3-40,200,150); //apparizione del messaggio di exit
  break;
  
  case 3: //stato: nella schermata di tutorial
    image(tutorial,0,0); //apparizione schermata del tutorial a schermo
  break;
  }
}

void checkGameOver(){   //funzione che aggiorna e tiene traccia dell'high score e disegna a schermo i punteggi
  if (cannon.getLife()<=0){ //se le vite del cannone sono a 0
    gameOverSound.amp(0.4); //modifica volume del suono
    gameOverSound.play(); //avvio effetto sonoro del gameover
    restart(); //funzione che resetta le varie proprietà delle diverse classi
    state=2; //impostare lo stato della variabile che controlla i vari stati del programma
  }
}
  
void restart(){ //funzione che resetta le varie proprietà delle diverse classi
   cannon.reset(); //reset del cannone 
   meteor.reset(); //reset della meteora
}

void keyPressed(){ //se un tasto del menu è premuto 
  if (key == TAB){ //se 'tab' è premuto
    state=1;  //stato del gioco a 1 , che equivale a 'in gioco'
  }
  
  if (key=='x'){  //se 'x' è premuta
    state=0; //stato del gioco a 0, che equivale a 'nel menu'
  }
  
  if (key=='t'){ //se 't' è premuta
    state=3;    //stato del gioco a 3, che equivale a 'nel tutorial' 
  }
}
  
void score(){ //funzione che aggiorna e tiene traccia dell'high score e disegna a schermo i punteggi
  if (cannon.getScore()>highScore){  //se lo score è maggiore dell'high score
     highScore=cannon.getScore(); //l'highscore è uguale al punteggio attuale
   }
  textSize(40); //grandezza del testo
  image(HighScoreImage,width*7/10,height/40,width/4,height/18); //immagine dell'high score
  text(highScore, width*9.2/10, height/13.5);                  //valore dell'high score
  image(ScoreImage, 0, height/40,width/4,height/18);          //immagine dello score attuale
  text(cannon.getScore(), width/4.5, height/13.5);            //valore dello score attuale
}

void camControl(){   //funzione che controlla se il volto dell'utente è all'internno dell'inquadratura                               
  if (nose_x == 0 && nose_y == 0){ //se entrambi i valori della posizione sono a 0, e quindi il volto non è individuato
    image(warning,width*18/20,wall.getY()-width/6,width/11,height/10); //apparizione del messaggio di warning
  }
}


  
  
  
