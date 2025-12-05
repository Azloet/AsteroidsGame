class Spaceship extends Floater  
{   
  public Spaceship(){
    corners = 17;
    xCorners = new int[]{-10,-14,-14,-10,-6,10,-2,-6,18,-6,-2,10,-6,-10,-14,-14,-10};
    yCorners = new int[]{2,2,4,4,8,6,6,2,0,-2,-6,-6,-8,-4,-4,-2,-2};
    myColor = color(71,29,100);
    myCenterX = 125;
    myCenterY = 125;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 270;
  }
  public int getX(){
    return (int)myCenterX;
  }
  public int getY(){
    return (int)myCenterY;
  }
  public double getXspeed(){
    return myXspeed;
  }
  public double getYspeed(){
    return myYspeed;
  }
  public double getPointDirection(){
    return myPointDirection;
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
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate(250, 250);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-250, -250);
  }
}
