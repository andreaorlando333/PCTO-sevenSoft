class Cannon {
  PImage cannon;
  PImage heart1;
  PImage heart2;
  PImage heart3;
  private ArrayList <Projectile> projectiles;
  private float x;
  private float y;
  private float w;
  private float h;
  private int life;
  private int score;
  private float pose_x;
  
  public Cannon(float x, float y, float w, float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.projectiles= new ArrayList <Projectile>();
    this.cannon = loadImage("cannon.png");
    this.heart1 = loadImage("1cuore.png");
    this.heart2 = loadImage("2cuori.png");
    this.heart3 = loadImage("3cuori.png");
    this.pose_x= map(nose_x,20,400,700,0);
    this.life=3;
    this.score=0;
  }
  
   void draw(){
    checkMeteor();
    load();
    fire();
    move();
    hearts();
    }

  public void load(){ 
    //se la prima è vera non esegue la seconda
    if (this.projectiles.size()==0 || y+h/2-this.projectiles.get(this.projectiles.size()-1).getY()>width/6){
    this.projectiles.add(new Projectile(x+w/2,y+h/2,w/5));
    cannonSound.play();
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
  
  public void hearts(){
    switch(life){
      case 3:
        image(heart3,width/20,height/11,width/4,height/25);
        break;
      case 2:
        image(heart2,width/20,height/11,width/4,height/25);
        break;
      case 1:
        image(heart1,width/20,height/11,width/4,height/25);
        break;
    }
        
  }
  
  public void move(){
    this.pose_x= map(nose_x,20,400,700,0);
    image(cannon,x,y,w,h);
    if (x<pose_x){
        x=x+5;
    }
    if (x>pose_x){
      x=x-5;
    }
  }
  
  public void downLife(){
    this.life--;
  }
  
  public int getLife(){
    return this.life;
  }
  
  public void reset(){
    this.life=3;
    this.score=0;
  } 
  
  public int getScore(){
    return this.score;
  }
  
  public float getW(){
    return this.w;
  }
  
  public void upScore(){
    this.score++;
  }
}
  
