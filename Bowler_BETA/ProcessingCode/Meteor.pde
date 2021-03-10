class Meteor{
  PImage meteor;
  PImage meteor2;
  PImage meteor3;
  PImage meteor4;
  PImage meteor5;
  private int life;
  private float x;
  private float y;
  private float h;
  private float w;
  private float speed;
  
  Meteor(float x,float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed=4;
    this.life=int(random(2,6));
    meteor = loadImage("meteor.png");
    meteor2 = loadImage("meteor2.png");
    meteor3 = loadImage("meteor3.png");
    meteor4 = loadImage("meteor4.png");
    meteor5 = loadImage("meteor5.png");
  }
  
  public void draw(){
    switch(life){
      case 5:
        image(meteor,x,y,w,h);
        break;
      case 4:
        image(meteor2,x,y,w,h);
        break;
      case 3:
        image(meteor3,x,y,w,h);
        break;
      case 2:
        image(meteor4,x,y,w,h);
        break;
      case 1:
        image(meteor5,x,y,w,h);
        break;
    }   
    move();
    checkLife();
  }
   
   
   public void move(){
     if(y+h/2 < wall.getYW()){
      y=y+(speed+cannon.getScore()/5);
     }
    else
    {   
      x = random(0+w,width-w);
      y=-w;
      this.life=int(random(2,6));
      cannon.downLife();  
    }
   }
   
   public void checkLife(){
     if (life==0){
       y=-w;
       x = random(0+w,width-w);
      this.life=int(random(2,6));
      cannon.upScore();
    }
   }
   
   public void downLife(){
     meteorSound.amp(0.5);
     meteorSound.play();
     this.life--;
   }
   
   public void reset(){
     this.life=int(random(2,6));
   }
   
   public int getLife(){
     return this.life;
   }
   
   public float getX(){
     return x;
   }
   
   public float getY(){
     return y;
   }
   
   public float getW(){
     return w;
   }
   
   public float getH(){
     return h;
   }
   
   
  
  
}


    
