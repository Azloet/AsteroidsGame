Spaceship player;
Star[] stars = new Star[100];
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();
boolean cw,ccw,f,b;

public void setup() 
{
  size(500,500);
  colorMode(HSB,360,100,100,100);
  player = new Spaceship();
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star();
  }
  for(int i = 0; i<100; i++){
    asteroids.add(new Asteroid());
  }
}

public void draw() 
{
  //your code here
  background(270,10,50);
  noStroke();
  for(int i = 0; i<stars.length; i++){
    stars[i].show();
  }
  
  checkMovement();
  player.move();
  player.show();
  
  for(int i = 0; i<asteroids.size(); i++){
    if(dist(asteroids.get(i).getX(),asteroids.get(i).getY(),player.getX(),player.getY()) < asteroids.get(i).getRadius()+16){
      asteroids.remove(i);
      i--;
    }
    else{
      asteroids.get(i).move();
      asteroids.get(i).show();
    }
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
    player.setXCenter((int)(Math.random()*500));
    player.setYCenter((int)(Math.random()*500));
    player.setXSpeed(0);
    player.setYSpeed(0);
    player.setPointDirection((int)(Math.random()*360));
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
}
