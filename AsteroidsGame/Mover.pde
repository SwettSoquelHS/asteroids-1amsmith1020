/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 All objects in this world that move must implemnt the Movalbe interface.
 */
interface Movable {
  /*
    Return the x location of the Movable
   */
  float getX();

  /*
    Return the y location of the Movable
   */
  float getY();

  /*
    Return the direction of the Movable in degrees.
   */
  float getDirection();

  /*
   Return the speed of the Movable.
   The speed you use is a relative value and will
   feel different for different frame rates. For example,
   if frameRate is set to 48, then a speed of 1 would move 48 pixels 
   per second.
   */
  float getSpeed();

  /*
   Return the radius of influence. If you could draw a circle
   around your object, then what would this radius be.
   */
  float getRadius();

  /* 
   Sets the direction of the Movable
   */
  void setDirection(float newDirectionInDegrees);

  /* 
   Sets the speed of the Movable
   */
  void setSpeed(float newSpeed);

  /*
   Update the internals of the instance
   */
  void update(); 

  /*
    Display the isntance
   */
  void show();

  /*
   Return true if the instance of Movable is "colliding with" 
   the movable referred to by object.  *Note* An object should not
   be able to collide with iteself.
   */
  boolean collidingWith(Movable object);
}
//END OF Movable Interface




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 Abstract base class Mover 
 */
abstract class Mover implements Movable {

  protected float x_pos, y_pos;
  protected float speed;
  protected float direction;
  protected int myColor;
  protected float radius;  

  /*
    Default Mover, not actually moving and directionless
   */
  Mover(float x_pos, float y_pos) {
    //The line below shows how we can 
    //link this constructor to the constructor below through "this"
    this(x_pos, y_pos, 0, 0);
  }

  /*
    Mover constructor specifying x, y position along with its speed and
   direction (in degrees)
   */
  Mover(float x_pos, float y_pos, float speed, float direction) {
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.speed = speed;
    this.direction = direction;
    myColor = 225;
    radius = 0.0;
  }

  /*
    Most of your movalbe objects should follow this pattern.
   */
  void update() {
    x_pos = x_pos + speed*(float)Math.cos(radians(direction));
    y_pos = y_pos + speed*(float)Math.sin(radians(direction));

    //todo: You need to decide what to do when X is less than 0 or greater than width
    //todo: You need to decide what to do when Y is less than 0 or greater than height
  }



  /*
    Save this for your subclasses to override.
   but notice how it is tagged with abstract, meaning 
   it is incomplete. (It's like an I.O.U.)
   */
  abstract void show();


  /*
    TODO: Part 4: Implement collision detection
   */
  boolean collidingWith(Movable m) {
    float distance = dist(x_pos, y_pos, m.getX(), m.getY());
    boolean touching  = distance < (radius + m.getRadius());
    return touching;
  }

  void collidingWithBarrier() {

    if (getX() > width || getX() < 0) {
      direction = direction * -1  + 180;
    }
    if (getY() > height || getY() < 0) {
      direction = direction * -1;
    }
  }

  // Setters and Getters

  //Getters
  float getX() {
    return  this.x_pos;
  }

  float getY() {
    return this.y_pos;
  }

  float getSpeed() {
    return this.speed;
  }
  float getDirection() {
    return this.direction;
  }

  float getRadius() {
    return this.radius;
  }

  //Setters
  void setDirection(float newDirectionInDegrees) {
    this.direction = newDirectionInDegrees;
  }

  void setSpeed(float newSpeed) {
    this.speed = newSpeed;
  }
}
