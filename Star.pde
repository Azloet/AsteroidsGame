class Star //note that this class does NOT extend Floater
{
  private int myX,myY,myColor,relX,relY;
  
  public Star(int rx, int ry){
    myColor = color((int)(Math.random()*360),30,100);
    myX = rx*250+(int)(Math.random()*250);
    myY = ry*250+(int)(Math.random()*250);
    relX = rx;
    relY = ry;
  }
  
  public void show(){
    fill(myColor);
    rect(myX,myY,2,2);
  }
  
  public int getX(){
    return (int)myX;
  }
  public int getY(){
    return (int)myY;
  }
  public int getRelX(){
    return relX;
  }
  public int getRelY(){
    return relY;
  }
}
