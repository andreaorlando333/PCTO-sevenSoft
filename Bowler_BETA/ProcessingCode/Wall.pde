class Wall{
  private float xw;
  private float yw;
  private float ww;
  private float hw;
  private float wt;
  private float ht;
  PImage wall;
  PImage towerdx;
  PImage towersx;
  
  Wall(float xw,float yw,float ww,float hw,float wt, float ht){
    this.xw = xw;
    this.yw = yw;
    this.hw = hw;
    this.ww = ww; 
    this.wt= wt;
    this.ht=ht;
    wall = loadImage("wall.png");  
    towerdx = loadImage("towerdx.png");
    towersx = loadImage("towersx.png");
  }
  
  
  
  public void draw(){
    image(wall,xw,yw,ww,hw);
    image(towersx,0,yw-ht,wt,ht);
    image(towerdx,width-wt,yw-ht,wt,ht);
    
  }
  
  public float getXW(){
    return xw;
  }
  
  public float getYW(){
    return yw;
  }
  
  public float getWW(){
    return ww;
  }
  
  public float getHW(){
    return hw;
  }
}
