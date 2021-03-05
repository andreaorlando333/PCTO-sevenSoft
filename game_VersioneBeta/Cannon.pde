class Cannon {
  PImage cannon;
  private ArrayList <Projectile> projectiles;
  private float x;
  private float y;
  private float w;
  private float h;
  
  public Cannon(float x, float y, float w, float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h  ;
    this.projectiles= new ArrayList <Projectile>();
    this.cannon = loadImage("cannon.png");
  }
  
   void draw(){
    load();
    fire();
    checkMeteor();
    image(cannon,x,y,w,h);
  }

  public void load(){ 
    //se la prima è vera non esegue la seconda
    if (this.projectiles.size()==0 || y+h/2-this.projectiles.get(this.projectiles.size()-1).getY()>width/6){
    this.projectiles.add(new Projectile(x+w/2,y+h/2,w/5));
    }
  }
  
  public void fire(){
    for (int i=0; i<projectiles.size() ; i++){
      this.projectiles.get(i).draw();
      if (this.projectiles.get(i).getHit()==true || this.projectiles.get(i).getY()<0){
        this.projectiles.remove(i);
      }
    }
  }
  
  public void checkMeteor(){
    for (int i=0; i<projectiles.size(); i++){
       if(projectiles.get(i).checkHit()==true){
          meteor.downLife();
       }
    }
  }
  
  
}
  
