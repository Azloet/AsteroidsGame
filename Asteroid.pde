class Asteroid extends Floater{
  protected double angularSpeed;
  private int radius;
  
  public Asteroid(){
    corners = (int)(Math.random()*5)+5;
    radius = (int)(Math.random()*10)+5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for(int i = 0; i<corners; i++){
      xCorners[i] = (int)(((Math.random()*5)+radius)*sin(i*2*PI/corners));
      yCorners[i] = (int)(((Math.random()*5)+radius)*cos(i*2*PI/corners));
    }
    myColor = color((int)(Math.random()*360),(int)(Math.random()*10)+0,(int)(Math.random()*25)+50);
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myXspeed = Math.random()*1;
    myYspeed = Math.random()*1;
    myPointDirection = (int)(Math.random()*360);
    angularSpeed = (Math.random()-0.5)*10;
  }
  
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
    myPointDirection += angularSpeed;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
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
