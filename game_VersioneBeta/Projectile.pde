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
    circle(x,y,r);
    checkHit();
    y=y-4;
  }
  
  boolean checkHit(){
    if ((y-r)<(meteor.getY()+meteor.getR()) && (x>meteor.getX() && x<meteor.getX()+(2*meteor.getR()))){
      hit = true;
      y=-r;
      
    }
    return hit;
  }
  
  public float getY(){
    return y;
  }
  
  public boolean getHit(){
    return hit;
  }
}
