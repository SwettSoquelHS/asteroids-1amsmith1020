

class Bullet extends Mover{
   int live;
  
  
  Bullet(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    x_pos = x;
    y_pos = y;
    live = 100;
  }
  
  
  
  public boolean isAlive(){
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
    if(isAlive()){
      println(x_pos + " : " + y_pos);
      pushMatrix();
      translate(x_pos,y_pos);
      rotate(radians(direction));
      fill(225,255,5);
      rect(x_pos,y_pos,10,2);
    }
  }
  int getLive(){
    return live;
  }
  
  void setLive(int n){
   live = n; 
  }
}
