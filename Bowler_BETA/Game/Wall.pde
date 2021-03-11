class Wall{ //classe wall
  private float x; //posizione x
  private float y; //posizione y
  private float w; //larghezza 
  private float h; //altezza
  PImage wall; //immagine del muro
  
  Wall(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w; 
    wall = loadImage("Media/wall.png");  //istanzia l'immagine del muro
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
