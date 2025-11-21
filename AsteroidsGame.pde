Spaceship player;
ArrayList <Star> stars = new ArrayList<Star>();
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList <Bullet> bullets = new ArrayList<Bullet>();
ArrayList <Integer> posX = new ArrayList<Integer>();
ArrayList <Integer> posY = new ArrayList<Integer>();
boolean cw,ccw,f,b,fire;
int score,chunkSize;

public void setup() 
{
  score = int(loadStrings("save.txt")[0]);
  
  size(500,500);
  colorMode(HSB,360,100,100,100);
  player = new Spaceship();
  chunkSize = 250;
}

public void draw() 
{
  //your code here
  background(270,10,50);
  noStroke();
  int absX =  player.getX();
  int absY =  player.getY();
  int relX = floor((float)absX/chunkSize);
  int relY = floor((float)absY/chunkSize);
  for(int i = -1; i<=1 ; i++){
    for(int j = -1; j<=1 ; j++){
      addChunk(relX+i,relY+j);
    }
  }

  pushMatrix();
  translate(-absX+250,-absY+250);
  
  for(int i = 0; i<stars.size(); i++){
    Star s = stars.get(i);
    if( (s.getRelX()<=relX+1 && s.getRelX()>=relX-1) && (s.getRelY()<=relY+1 && s.getRelY()>=relY-1) ){
      s.show();
    }
  }
  
  for(int i = 0; i<asteroids.size(); i++){
    Asteroid a = asteroids.get(i);
    if( (a.getRelX()<=relX+1 && a.getRelX()>=relX-1) && (a.getRelY()<=relY+1 && a.getRelY()>=relY-1) ){
      boolean alive = true;
      for(int j = 0; j<bullets.size(); j++){
        Bullet bu = bullets.get(j);
        if( (bu.getRelX()<=relX+1 && bu.getRelX()>=relX-1) && (bu.getRelY()<=relY+1 && bu.getRelY()>=relY-1) ){
          if(dist(a.getX(),a.getY(),bu.getX(),bu.getY()) < a.getRadius()+bu.getRadius()){
            asteroids.remove(i);
            bullets.remove(j);
            i--;
            j=bullets.size();
            alive = false;
          }
        }
      }
      if(alive){
        if(dist(a.getX(),a.getY(),absX,absY) < a.getRadius()+16){
          asteroids.remove(i);
          i--;
          alive = false;
        }
        else{
          a.move();
          a.show();
        }
      }
      if(!alive){
        score+=1;
      }
    }
  }
  
  for(int i = 0; i<bullets.size(); i++){
    Bullet bu = bullets.get(i);
    if( (bu.getRelX()<=relX+1 && bu.getRelX()>=relX-1) && (bu.getRelY()<=relY+1 && bu.getRelY()>=relY-1) ){
      bu.move();
      bu.updateRelPos();
      bu.show();
    }
  }
  
  popMatrix();
  
  checkMovement();
  player.move();
  player.show();
  println(player.getXspeed());
  
  text(score,10,20);
  text(absX + " " + absY,10,40);
  text(relX + " " + relY,10,60);
  
  String[] data = {str(score)};
  saveStrings("save.txt",data);
}

public void addChunk(int x, int y){
  boolean doesntExist = true;
  for(int i = 0; i<posX.size(); i++){
    if(posX.get(i) == x && posY.get(i) == y){
      doesntExist = false;
    }
  }
  if(doesntExist){
    for(int i = 0; i<250; i++){
      stars.add(new Star(x,y));
    }
    for(int i = 0; i<20; i++){
      asteroids.add(new Asteroid(x,y));
    }
    posX.add(x);
    posY.add(y);
  }
}


public void keyPressed(){
  if (keyCode == LEFT||keyCode == 65) {
    ccw = true;
  } 
  else if(keyCode == RIGHT||keyCode == 68){
    cw = true;
  }
  if (keyCode == UP||keyCode == 87) {
    f = true;
  } 
  else if(keyCode == DOWN||keyCode == 83){
    b = true;
  }
  if (keyCode == 82) {
    player.setXCenter((int)(Math.random()*1000));
    player.setYCenter((int)(Math.random()*1000));
    player.setXSpeed(0);
    player.setYSpeed(0);
    player.setPointDirection((int)(Math.random()*360));
  }
  if(keyCode == 32 || keyCode == 70){
    fire = true;
  }
}

public void keyReleased(){
  if (keyCode == LEFT||keyCode == 65) {
    ccw = false;
  } 
  else if(keyCode == RIGHT||keyCode == 68){
    cw = false;
  }
  if (keyCode == UP||keyCode == 87) {
    f = false;
  } 
  else if(keyCode == DOWN||keyCode == 83){
    b = false;
  }
  if(keyCode == 32 || keyCode == 70){
    fire = false;
  }
}

public void checkMovement(){
  if (ccw) {
    player.turn(-5);
  } 
  else if(cw){
    player.turn(5);
  }
  if (f) {
    player.accelerate(0.02);
  } 
  else if(b){
    player.accelerate(-0.02);
  }
  if(fire){
    bullets.add(new Bullet(player));
  }
}
