class Asteroid extends Floater{
  private double angularSpeed;
  private int radius, relX, relY;
  
  public Asteroid(int x,int y){
    corners = (int)(Math.random()*5)+5;
    radius = (int)(Math.random()*10)+5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for(int i = 0; i<corners; i++){
      xCorners[i] = (int)(((Math.random()*5)+radius)*sin(i*2*PI/corners));
      yCorners[i] = (int)(((Math.random()*5)+radius)*cos(i*2*PI/corners));
    }
    myColor = color((int)(Math.random()*360),(int)(Math.random()*10)+0,(int)(Math.random()*25)+50);
    myCenterX = (int)(Math.random()*250);
    myCenterY = (int)(Math.random()*250);
    myXspeed = Math.random()*0;
    myYspeed = Math.random()*0;
    myPointDirection = (int)(Math.random()*0);
    angularSpeed = (Math.random()-0.5)*0;
    relX = x;
    relY = y;
  }
  
  public void show (PImage cloud)  //Draws the floater at the current position  
  {               
    noStroke();    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    //draw the polygon
    textureWrap(REPEAT);
    beginShape();
    texture(cloud);
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI], (float)myCenterX + 250*relX + xCorners[nI], (float)myCenterY + 250*relY + yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }  
  
  public int move ()   //move the floater in the current direction of travel
  {      
    myPointDirection += angularSpeed;
    return super.move();
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
