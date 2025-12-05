class Bullet extends Floater{
  private int radius;
  
  public Bullet(Spaceship theShip){
    radius = (int)(Math.random()*0)+5;
    myColor = color(71,29,100);
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myXspeed = theShip.getXspeed();
    myYspeed = theShip.getYspeed();
    myPointDirection = theShip.getPointDirection();
    accelerate(6);
  }
  public void show(){
    fill(myColor);
    ellipse((float)myCenterX,(float)myCenterY,radius,radius);
  }
  public int getX(){
    return (int)myCenterX;
  }
  public int getY(){
    return (int)myCenterY;
  }
  public int getRadius(){
    return radius;
  }
}
