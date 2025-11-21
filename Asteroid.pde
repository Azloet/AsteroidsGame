class Asteroid extends Floater{
  private double angularSpeed;
  private int radius,relX,relY;
  
  public Asteroid(int rx,int ry){
    corners = (int)(Math.random()*5)+5;
    radius = (int)(Math.random()*10)+5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for(int i = 0; i<corners; i++){
      xCorners[i] = (int)(((Math.random()*5)+radius)*sin(i*2*PI/corners));
      yCorners[i] = (int)(((Math.random()*5)+radius)*cos(i*2*PI/corners));
    }
    myColor = color((int)(Math.random()*360),(int)(Math.random()*10)+0,(int)(Math.random()*25)+50);
    myCenterX = rx*250+(int)(Math.random()*250);
    myCenterY = ry*250+(int)(Math.random()*250);
    myXspeed = Math.random()*0.1;
    myYspeed = Math.random()*0.1;
    myPointDirection = (int)(Math.random()*360);
    angularSpeed = (Math.random()-0.5)*1;
    relX = rx;
    relY = ry;
  }
  
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
    myPointDirection += angularSpeed;
    relX = floor((float)myCenterX/chunkSize);
    relY = floor((float)myCenterY/chunkSize);
  }
  
  public int getX(){
    return (int)myCenterX;
  }
  public int getY(){
    return (int)myCenterY;
  }
  public int getRelX(){
    return relX;
  }
  public int getRelY(){
    return relY;
  }
  public int getRadius(){
    return radius;
  }
}
