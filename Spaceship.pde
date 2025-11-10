class Spaceship extends Floater  
{   
  public Spaceship(){
    corners = 17;
    xCorners = new int[]{-4,-8,-8,-4,0,16,4,0,24,0,4,16,0,-4,-8,-8,-4};
    yCorners = new int[]{2,2,4,4,8,6,6,2,0,-2,-6,-6,-8,-4,-4,-2,-2};
    myColor = color(71,29,100);
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = (int)(Math.random()*360);
  }
  public int getX(){
    return (int)myCenterX;
  }
  public int getY(){
    return (int)myCenterY;
  }
  public void setXCenter(int x){
    myCenterX = x;
  }
  public void setYCenter(int y){
    myCenterY = y;
  }
  public void setXSpeed(double s){
    myXspeed = s;
  }
  public void setYSpeed(double s){
    myYspeed = s;
  }
  public void setPointDirection(double a){
    myPointDirection = a;
  }
}
