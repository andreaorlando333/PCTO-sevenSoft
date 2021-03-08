class Cannon {
  PImage cannon;
  private ArrayList <Projectile> projectiles;
  private float x;
  private float y;
  private float w;
  private float h;
  private int life;
  private int score;
  
  public Cannon(float x, float y, float w, float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.projectiles= new ArrayList <Projectile>();
    this.cannon = loadImage("cannon.png");
    this.life=3;
    this.score=0;
  }
  
   void draw(){
    checkMeteor();
    load();
    fire();
    image(cannon,nose_x,y,w,h);
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
  
  public void downLife(){
    this.life--;
  }
  
  public int getLife(){
    return this.life;
  }
  
  public float getW(){
    return this.w;
  }
  
  public void reset(){
    this.life=3;
    this.score=0;
  } 
  
  public int getScore(){
    return this.score;
  }
  
  public void upScore(){
    this.score++;
  }
}
  
