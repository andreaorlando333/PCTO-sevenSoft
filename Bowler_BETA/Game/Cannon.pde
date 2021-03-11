class Cannon { //classe cannone 
  PImage cannon; //immagine cannone 
  PImage heart1; //immagine 1 cuore
  PImage heart2; //immagine 2 cuori
  PImage heart3; //immagine 3 cuori
  private ArrayList <Projectile> projectiles; //arraylist di proiettili
  private float x; //posizone x
  private float y;  //posizone y
  private float w;  //larghezza 
  private float h;  //altezza
  private int life; //vite 
  private int score; //punteggio
  private float player_x; //posizione dell'utente
  
  public Cannon(float x, float y, float w, float h){ //costruttore
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.projectiles= new ArrayList <Projectile>();
    this.cannon = loadImage("Media/cannon.png");
    this.heart1 = loadImage("Media/1cuore.png");
    this.heart2 = loadImage("Media/2cuori.png");
    this.heart3 = loadImage("Media/3cuori.png");
    this.player_x= map(nose_x,45,410,width,0); //proporzione tra la grandezza dell'inquadratura del programma python e la larghezza dellos schermo
    this.life=3;
    this.score=0;
  }
  
   void draw(){
    checkMeteor();  //controlla se i proiettili colpiscono la meteora
    load(); //carica i proiettili "dentro"il cannon
    fire(); //fa muovere i proiettili
    move(); //funzione che controlla i movimenti del cannone
    hearts(); //funzione che gestisce i cuori che rappresentano le 3 vite
    }

  public void load(){  //carica i proiettili "dentro"il cannon
    //se la prima è vera non esegue la seconda
    if (this.projectiles.size()==0 || y+h/2-this.projectiles.get(this.projectiles.size()-1).getY()>width/6){ //se il proiettile sparato in precedenza è sufficentemente lontano dal cannone
    this.projectiles.add(new Projectile(x+w/2,y+h/2,w/5)); //disegna un nuovo proiettile
    cannonSound.amp(0.4); 
    cannonSound.play(); //effetto sonoro dello sparo
    }
  }
  
  public void fire(){ //fa muovere i proiettili
    for (int i=0; i<projectiles.size() ; i++){    //cicla su tutti i proiettili
      this.projectiles.get(i).draw();    //disegna il proiettile
      if (this.projectiles.get(i).getHit()==true || this.projectiles.get(i).getY()<0){ //se il proiettile ha colpito la meteora o è uscito dallo schermo
        this.projectiles.remove(i); //rimuove il proiettile dall'arraylist
      }
    }
  }
  
  public void checkMeteor(){ //controlla se i proiettili colpiscono la meteora
    for (int i=0; i<projectiles.size(); i++){ //cicla su tutti i proiettili
       if(projectiles.get(i).checkHit()==true){ //se il proiettile ha colpito la meteora
          meteor.downLife(); //togliere una vita alla meteora
       }
    }
  }
  
  public void hearts(){ //funzione che gestisce i cuori che rappresentano le 3 vite
    switch(life){ //a seconda del numero di vite appaiono un numero diverso di cuori a schermo
      case 3:
        image(heart3,width/20,height/11,width/4,height/25); //3 cuori
        break;
      case 2:
        image(heart2,width/20,height/11,width/4,height/25); //2 cuori
        break;
      case 1:
        image(heart1,width/20,height/11,width/4,height/25); //1 cuore
        break;
    }
        
  }
  
  public void move(){ //funzione che controlla i movimenti del cannone
    this.player_x= map(nose_x,45,410,width,0); //salva la posizione attuale dell'utente
    image(cannon,x,y,w,h); //disegna il cannone
    if (x<player_x){  //muovere il cannone finchè non raggiunge la posizione del giocatore
        x=x+5;
    }
    if (x>player_x){ //muovere il cannone finchè non raggiunge la posizione del giocatore
      x=x-5;
    }
  }
  
  public void downLife(){ //toglie una vita
    this.life--;
  }
  
  public int getLife(){
    return this.life;
  }
  
  public void reset(){ //reset vite
    this.life=3;
    this.score=0;
  } 
  
  public int getScore(){
    return this.score;
  }
  
  public float getW(){
    return this.w;
  }
  
  public void upScore(){ //aumenta lo score
    this.score++;
  }
}
  
