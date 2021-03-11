import java.net.*;
import java.io.*;
import java.util.Arrays;
import processing.sound.*;
 

SoundFile cannonSound;
SoundFile meteorSound;
SoundFile gameOverSound;
PImage bg;
PImage menu;
PImage gameOver;
PImage HighScoreImage;
PImage ScoreImage;
PImage warning;
PImage tutorial;
PImage restartMessage;
//PImage sbg;
Wall wall;
Cannon cannon;
Meteor meteor;
int state=0;
int highScore=0;
DatagramSocket socket;
DatagramPacket packet;

byte[] buf = new byte[24];

float nose_x;
float nose_y;
float r_wrist_x;
float r_wrist_y;
float l_wrist_x;
float l_wrist_y;
void setup(){
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  size(700,700);
  this.cannonSound = new SoundFile(this, "cannonSound.wav");
  this.meteorSound = new SoundFile(this,"meteorSound.wav");
  this.gameOverSound = new SoundFile(this,"gameOverSound.wav");
  menu = loadImage("menu.jpg");
  bg = loadImage("bg.jpg");
  gameOver = loadImage("gameOver.png");
  HighScoreImage = loadImage("HighScoreImage.png");
  ScoreImage = loadImage("ScoreImage.png");
  tutorial = loadImage("tutorial.jpg");
  warning = loadImage("warning.png");
  restartMessage = loadImage("restart.png");
  wall = new Wall(0,(height*2)/3,width,height/3);
  cannon = new Cannon(float(((width/2)-((width/8)/2))),float((height*8/9)-(height/8)),float(width/8),float(height/8));
  meteor = new Meteor(float(((width/2)-((width/10)/2))), -float(height/8),float(width/8), float(width/8));
  
}

void draw(){
  switch(state){
  case 0:
  image(menu,0,0);
  break;
  
  
  case 1:
  background(0);
  try {
    DatagramPacket packet = new DatagramPacket(buf, buf.length);
    socket.receive(packet);
    InetAddress address = packet.getAddress();
    int port = packet.getPort();
    packet = new DatagramPacket(buf, buf.length, address, port);

    nose_x = Float.intBitsToFloat( (buf[0]& 0xFF) ^ (buf[1]& 0xFF)<<8 ^ (buf[2]& 0xFF)<<16 ^ (buf[3]& 0xFF)<<24 );
    nose_y = Float.intBitsToFloat( (buf[4]& 0xFF) ^ (buf[5]& 0xFF)<<8 ^ (buf[6]& 0xFF)<<16 ^ (buf[7]& 0xFF)<<24 );
    r_wrist_x = Float.intBitsToFloat( (buf[8]& 0xFF) ^ (buf[9]& 0xFF)<<8 ^ (buf[10]& 0xFF)<<16 ^ (buf[11]& 0xFF)<<24 );
    r_wrist_y = Float.intBitsToFloat( (buf[12]& 0xFF) ^ (buf[13]& 0xFF)<<8 ^ (buf[14]& 0xFF)<<16 ^ (buf[15]& 0xFF)<<24 );
    l_wrist_x = Float.intBitsToFloat( (buf[16]& 0xFF) ^ (buf[17]& 0xFF)<<8 ^ (buf[18]& 0xFF)<<16 ^ (buf[19]& 0xFF)<<24 );
    l_wrist_y = Float.intBitsToFloat( (buf[20]& 0xFF) ^ (buf[21]& 0xFF)<<8 ^ (buf[22]& 0xFF)<<16 ^ (buf[23]& 0xFF)<<24 );
    
    
    println("DATA:");
    println(nose_x);
    println(nose_y);
    println(r_wrist_x);
    println(r_wrist_y);
    println(l_wrist_x);
    println(l_wrist_y);
    println("DATA END\n");
  }
  catch (IOException e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  image(bg,0,0);
  wall.draw();
  cannon.draw();
  meteor.draw();
  score();
  checkGameOver();
  if (nose_x == 0 && nose_y == 0){
    image(warning,width*18/20,wall.getY()-width/6,width/11,height/10);
  }
  System.out.println(cannon.getScore());
  break;
  
  case 2:
  System.out.println("ehehehe");
  //image(sbg,0,0);
  filter(BLUR,10);
  image(gameOver,width/2-100,75,200,150);
  image(restartMessage,width/2-100,height/2-75,200,150);
  break;
  
  case 3:
    image(tutorial,0,0);
  break;
  }
}

void checkGameOver(){
  if (cannon.getLife()<=0){
    gameOverSound.play();
    restart();
    state=2;
  }
}
  
void restart(){
   System.out.println("Game Over");
   cannon.reset();
   meteor.reset();
}

void keyPressed(){
  System.out.println("pressed");
  if (key == TAB){
    state=1;
  }
  
  if (key=='x'){
    state=0;
  }
  
  if (key=='t'){
    state=3;
  }
}
  
void score(){
  if (cannon.getScore()>highScore){
     highScore=cannon.getScore();
   }
  textSize(40); 
  image(HighScoreImage,width*7/10,height/40,width/4,height/18);
  text(highScore, width*9.2/10, height/13.5);
  image(ScoreImage, 0, height/40,width/4,height/18);  
  text(cannon.getScore(), width/4.5, height/13.5);  
}


  
  
  
