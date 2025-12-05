Spaceship player;
PImage clouds;
ArrayList <Chunk> chunks = new ArrayList<Chunk>();
Chunk[] buffer = new Chunk[9];
boolean cw,ccw,f,b,fire;
int chunkSize;

public void setup() 
{
  size(500,500,P2D);
  colorMode(HSB,360,100,100,100);
  player = new Spaceship();
  chunks.add(new Chunk(0,0));
  chunkSize = chunks.get(0).getSize();
}

public void draw() 
{
  //your code here
  background(270,10,50);
  clouds = loadImage("wrapped clouds.jpg");
  noStroke();
  int absX =  player.getX();
  int absY =  player.getY();
  int relX = floor((float)absX/chunkSize);
  int relY = floor((float)absY/chunkSize);
  
  for(int i = -1; i<=1 ; i++){
    for(int j = -1; j<=1 ; j++){
      boolean dne = true;
      int index = 3*(i+1)+(j+1);
      for(int k = 0; k<chunks.size(); k++){
        //use existing
        if(chunks.get(k).getRelX() == relX+i && chunks.get(k).getRelY() == relY+j){
          buffer[index] = chunks.get(k);
          dne = false;
        }
      }
      //create new
      if(dne){
        Chunk c = new Chunk(relX+i,relY+j);
        chunks.add(c);
        buffer[index] = c;
      }
    }
  }
  
  //main loop
  pushMatrix();
  translate(-absX,-absY);
  for(int i = 0; i<buffer.length; i++){
    int indexI = buffer[i].getRelX()+1;
    int indexJ = buffer[i].getRelY()+1;
    translate(indexI*chunkSize,indexJ*chunkSize);
    ArrayList <Star> stars = buffer[i].getStars();
    ArrayList <Asteroid> asteroids = buffer[i].getAsteroids();
    ArrayList <Bullet> bullets = buffer[i].getBullets();
    //stars
    for(int j = 0; j<stars.size(); j++){
      Star s = stars.get(j);
      s.show();
    }
    //asteroids
    for(int j = 0; j<asteroids.size(); j++){
      Asteroid a = asteroids.get(j);
      a.show(clouds);
      int move = b.move();
      if(move!=0){
        
      }
    }
    //bullets
    for(int j = 0; j<bullets.size(); j++){
      Bullet b = bullets.get(j);
      b.show();
      int move = b.move();
      if(move!=0){
        bullets.remove(j);
        j--;
      }
    }
    translate(-indexI*chunkSize,-indexJ*chunkSize);
  }
  popMatrix();
  
  checkMovement();
  player.move();
  player.show();
  
  text(absX + " " + absY,10,40);
  text(relX + " " + relY,10,60);
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
    buffer[4].getBullets().add(new Bullet(player));
  }
}

