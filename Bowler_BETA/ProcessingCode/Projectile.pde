class Projectile {
  private float x;
  private float y;
  private float r;
  private boolean hit;
  
  Projectile(float x, float y, float r){
    this.x=x;
    this.y=y;
    this.r=r;
    this.hit=false;
    
  }
  
  void draw(){
    fill(0,0,0);
    circle(x,y,r);
    
    
    checkHit();
    y=y-8;
  }
  
  boolean checkHit(){
    if ((y-r)<(meteor.getY()+(meteor.getW()/2)) && (x>meteor.getX() && x<(meteor.getX()+meteor.getW()))){
      hit = true;
      y=-r;
      
    }
    return hit;
  }
  
  public float getY(){
    return y;
  }
  
  public float getX(){
    return x;
  }
  
  public float getR(){
    return r;
  }
  
  public boolean getHit(){
    return hit;
  }
}
