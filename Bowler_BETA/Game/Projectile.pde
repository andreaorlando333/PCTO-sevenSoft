class Projectile { //classe proiettile
  private float x; //posizione x 
  private float y; //posizione y
  private float r; //raggio del proiettile
  private boolean hit; //variabile che determina se il proiettile ha colpito una meteora
  
  Projectile(float x, float y, float r){
    this.x=x;
    this.y=y;
    this.r=r;
    this.hit=false;
    
  }
  
  void draw(){
    fill(0,0,0);
    circle(x,y,r); //disegna il proiettile
    
    
    checkHit(); //controlla se il proiettile ha colpito un meteora
    y=y-8; //la posizione del proiettile cambia
  }
  
  boolean checkHit(){ //controlla se il proiettile ha colpito un meteora
    if ((y-r)<(meteor.getY()+(meteor.getW()/2)) && (x>meteor.getX() && x<(meteor.getX()+meteor.getW()))){ //se il proiettile si trova nel raggio della meteora
      hit = true; //setta la variabile 'hit' a vero
      y=-r; //e rimuove dallo schermo il proiettile
      
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
