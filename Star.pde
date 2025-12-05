class Star //note that this class does NOT extend Floater
{
  private int myX,myY,myColor;
  
  public Star(){
    myColor = color((int)(Math.random()*360),30,100);
    myX = (int)(Math.random()*250);
    myY = (int)(Math.random()*250);
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
}
