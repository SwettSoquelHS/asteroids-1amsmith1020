/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */
class Spaceship extends Mover {  
  float x, y;
  float speed;
  float direction;
  int myColor;
  float radius;

  Spaceship(float x, float y) {
    super(x, y);
  }

  Spaceship(float x, float y, float speed, float direction) {
    this(x, y);
    this.speed = speed;
    this.direction = direction;
  }

  void show() {
  }
}
