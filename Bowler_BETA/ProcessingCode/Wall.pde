class Wall{
  private float x;
  private float y;
  private float w;
  private float h;
  PImage wall;
  
  Wall(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w; 
    wall = loadImage("wall.png");  
  }
  
  
  
  public void draw(){
    image(wall,x,y,w,h);
    
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
