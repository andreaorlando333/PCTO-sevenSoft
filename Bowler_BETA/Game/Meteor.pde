class Meteor{ //classe della meteora
  PImage meteor;    //immagini dei varii stati della meteora
  PImage meteor2;
  PImage meteor3;
  PImage meteor4;
  PImage meteor5;
  private int life; //vita 
  private float x; //posizione x
  private float y; //posizione y
  private float h; //altezza
  private float w; //larghezza
  private float speed; //velocità
  
  Meteor(float x,float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed=3;
    this.life=int(random(2,6)); //vita random tra 2 e 5
    meteor = loadImage("Media/meteor.png"); //istanziamento immagini degli stati della meteora
    meteor2 = loadImage("Media/meteor2.png");
    meteor3 = loadImage("Media/meteor3.png");
    meteor4 = loadImage("Media/meteor4.png");
    meteor5 = loadImage("Media/meteor5.png");
  }
  
  public void draw(){
    switch(life){ //a seconda della vita della meteora, essa viene rappresentata in diversi stati
      case 5:
        image(meteor,x,y,w,h);
        break;
      case 4:
        image(meteor2,x,y,w,h);
        break;
      case 3:
        image(meteor3,x,y,w,h);
        break;
      case 2:
        image(meteor4,x,y,w,h);
        break;
      case 1:
        image(meteor5,x,y,w,h);
        break;
    }   
    move(); //funzione che muove la meteora
    checkLife(); //funzione che controlla la vita della meteora e la fa respawnare in caso esssa fosse a 0
  }
   
   
   public void move(){ //funzione che muove la meteora
     if(y+h/2 < (wall.getY()+(wall.getH()*3/5))){ //se la meteora e ancora distante dal mura
      y=y+(speed+cannon.getScore()/5); //la meteora si muove
     }
    else //se tocca le mura
    { 
      meteorDestroyedSound.amp(0.4);
      meteorDestroyedSound.play(); //effetto sonoro della meteora che si schianta sul muro
      x = random(0+w,width-w); //la meteora respawna in una posizione random
      y=-w; 
      this.life=int(random(2,6)); //viene scelta una vita random
      cannon.downLife();  //le vite dell'utente diminuiscono di uno
    }
   }
   
   public void checkLife(){ //funzione che controlla la vita della meteora e la fa respawnare in caso esssa fosse a 0
     if (life==0){ //se la vita è uguale a 0
       y=-w; //la meteora respawna in una posizione random
       x = random(0+w,width-w);
      this.life=int(random(2,6)); //viene scelta una vita random
      cannon.upScore(); //lo score dell'utente aumenta
    }
   }
   
   public void downLife(){ //funzione che diminuisce di uno la vita della meteora
     meteorSound.amp(0.4);
     meteorSound.play(); //effetto sonoro del danneggiamento della meteora
     this.life--; //diminuisce di uno la vita della meteora
   }
   
   public void reset(){ //reset vite 
     this.life=int(random(2,6));
   }
   
   public int getLife(){
     return this.life;
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


    
