class Bullet extends Mover{
  private int live;
  Bullet(float x, float y){
    super(x, y);
    x_pos = x;
    y_pos = y;
    live = 100;
  }
  
  boolean isAlive(){
    if(live < 0){
      return false;
    }
    return true;
  }
  
  
  void update(){
   super.update(); 
   live--;
  }
  
  void show(){
    if(live > 0){
      rect(x_pos,y_pos,10,2);
    }
  }
}
