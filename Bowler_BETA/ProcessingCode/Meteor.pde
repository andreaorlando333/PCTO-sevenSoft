class Meteor{
  PImage meteor;
  PImage meteor2;
  PImage meteor3;
  private int life;
  private float x;
  private float y;
  private float h;
  private float w;
  
  Meteor(float x,float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.life=3;
    meteor = loadImage("meteor.png");
    meteor2 = loadImage("meteor2.png");
    meteor3 = loadImage("meteor3.png");
  }
  
  public void draw(){
    switch(life){
      case 3:
        image(meteor,x,y,w,h);
        break;
      case 2:
        image(meteor2,x,y,w,h);
        break;
      case 1:
        image(meteor3,x,y,w,h);
        break;
    }   
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
      this.life=3;
      cannon.downLife();  
    }
   }
   
   public void checkLife(){
     if (life==0){
       y=-w;
       x = random(0+w,width-w);
      this.life=3;
      cannon.upScore();
    }
   }
   
   public void downLife(){
     this.life--;
   }
   
   public void reset(){
     this.life=3;
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


    
