class Star //note that this class does NOT extend Floater
{
  protected int myX,myY,myColor;
  
  public Star(){
    myColor = color((int)(Math.random()*360),30,100);
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  
  public void show(){
    fill(myColor);
    rect(myX,myY,2,2);
  }
}
