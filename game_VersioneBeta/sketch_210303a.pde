PImage bg;
Wall wall;
Cannon cannon;
Meteor meteor;
void setup(){
  size(700,700);
  bg = loadImage("bg.png");
  wall = new Wall(0,(height*8)/9,width,height/9);
  cannon = new Cannon(float(((width/2)-((width/8)/2))),float((height*8/9)-(height/8)),float(width/8),float(height/8));
  meteor = new Meteor(float(((width/2)-((width/10)/2))), -float(height/8),float(width/16));
  
}

void draw(){
  background(0);
  image(bg,0,0);
  wall.draw();
  cannon.draw();
  meteor.draw();
}
