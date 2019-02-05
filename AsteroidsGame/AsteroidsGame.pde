/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
//Asteroid[] asteroids;
Star[] starField;

Asteroid[] asteroids;
/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar


/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here
 */
int asteroidSize;

public void setup() {
  size(640, 400);

  //initialize your asteroid array and fill it

  asteroids = new Asteroid[10];

  for (int i = 0; i < asteroids.length; i++) {

    asteroids[i] = new Asteroid(
      (float)(width*Math.random()), 
      (float)(height*Math.random()), 
      1, 
      (float)(-1 * Math.random() * -360));
  }

  player1 = new Spaceship(width /2, height / 2);

  //initialize starfield
  starField = new Star[100];
  for (int i = 0; i < starField.length; i++) {
    starField[i] = new Star((double)(Math.random() * 640), (double)(Math.random() * 400));
  }
}


/* * * * * * * * * * * * * * * * * * * * * * *
 Drawing work here
 */
public void draw() {
  //your code here
  background(0, 0, 0);



  //Draw Starfield first 
  //TODO: Part I
  for (int i = 0; i < starField.length; i++) {
    starField[i].show();
  }

  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place
  for(int i = 0; i < asteroids.length; i++){
    asteroids[i].collidingWithBarrier();
  }
  //Draw asteroids
  //TODO: Part II
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i].show();
    asteroids[i].update();
  }

  //Update spaceship
  //TODO: Part I
  if (ROTATE_LEFT) {
    player1.Rotate(-2.0);
  }
  if (ROTATE_RIGHT) {
    player1.Rotate(2.0);
  }

  if (MOVE_FORWARD == true) {
    player1.changeSpeedBy(0.5);
  } else {
    player1.changeSpeedBy(-0.5);
  }
  player1.update();


  //player1.show();


  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  player1.show();
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 

  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
    } else if (keyCode == 72) {
      player1.hyperspace();
    }
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}


void checkOnAsteroids() {

  for (int i = 0; i < asteroids.length; i++) {
    Asteroid a1 = asteroids[i];
    for (int j = 0; j < asteroids.length; j++) {
      Asteroid a2 = asteroids[j];
      if (a1 != a2 && a1.collidingWith(a2)) {
        //do something...
      }
    }
  }
}
