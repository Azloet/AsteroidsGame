class Chunk{
  private ArrayList<Star> s;
  private ArrayList<Asteroid> a;
  private ArrayList<Bullet> b;
  private int relX,relY,size;
 
  Chunk(int x, int y){
    relX = x;
    relY = y;
    size = 250;
    s = new ArrayList<Star>();
    a = new ArrayList<Asteroid>();
    b = new ArrayList<Bullet>();
    for(int i = 0; i<20; i++){
      s.add(new Star());
    }
    for(int i = 0; i<200; i++){
      a.add(new Asteroid(relX,relY));
    }
  }
  
  public ArrayList<Star> getStars(){
    return s;
  }
  public ArrayList<Asteroid> getAsteroids(){
    return a;
  }
  public ArrayList<Bullet> getBullets(){
    return b;
  }
  public int getSize(){
    return size;
  }
  public int getRelX(){
    return relX;
  }
  public int getRelY(){
    return relY;
  }
}
