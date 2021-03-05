class Meteor{
  PImage meteor;
  private int life;
  private float x;
  private float y;
  private float h;
  private float w;
  private float r;
  
  Meteor(float x,float y, float r){
    this.x = x;
    this.y = y;
    this.r=r;
    this.h = 2*r;
    this.w = 2*r;
    this.life=2;
    meteor = loadImage("meteor.png");
  }
  
  public void draw(){
  image(meteor,x,y,w,h);
  move();
  checkLife();
  }
   
   
   public void move(){
     if(y+h/2 < wall.getY()){
      y +=2;    
    }
    else
    {     
      x = random(0+w,width-w);
      y=-w;
    }
   }
   
   public void checkLife(){
     if (life==0){
      life=3;
      x = random(0+w,width-w);
      y=-w;
    }
   }
   
   public void downLife(){
     this.life--;
   }
   
   public float getX(){
     return x;
   }
   
   public float getY(){
     return y;
   }
   
   public float getR(){
     return r;
   }
  
  
}


    
