/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover{   
  //your code here
  Asteroid(float x, float y, float speed, float direction){
    super(x,y, speed, direction);
    int size = (int)speed;
  }
  //Math.random * 4; (int)
  void show(){
    if(size == 1){
      
    }
    
  }
  
  int asteroidSize(){
    int size = (int) speed;
    size = (int) 1+ (int) Math.random() * 4;
    return size;
  }
  
}
