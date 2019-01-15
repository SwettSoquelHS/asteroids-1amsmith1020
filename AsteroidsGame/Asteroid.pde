/*
  Asteroid class
 Should extend Mover class and implement show.
 
 Initially, your asteroid may just be a simple circle or square
 but the final program should use "beginShap(), vertex(), and endShape()"
 to render the asteroid.
 */
class Asteroid extends Mover {   
  //your code here
  Asteroid(float x, float y, float speed, float direction) {
    super(x, y, speed, direction);
  }


  int asteroidSize(int size) {
    size = (int) 1+ (int) Math.random() * 3;
    return size;
  }



  //Math.random * 4; (int)
  void show() {
    float size = (int) 1+ (int) Math.random() * 3;
    if (size == 1) {
      beginShape();
      pushMatrix();
      translate(x, y);
      fill(55);
      vertex(5, 3);
      vertex(2, 5);
      vertex(-2, 4);
      vertex(-3, -1);
      vertex(-5, -5);
      vertex(4, -4);
      endShape(CLOSE);
      popMatrix();
    } else if (size == 2) {
      beginShape();
      pushMatrix();
      translate(x, y);
      fill(70);
      vertex(0, 8);
      vertex(-4, 5);
      vertex(-5, 0);
      vertex(6, 0);
      vertex(5, 5);
      vertex(0, 8);
      endShape(CLOSE);
      popMatrix();
    } else if (size == 3) {
      beginShape();
      pushMatrix();
      translate(x, y);
      fill(90);
      vertex(0, 14);
      vertex(-8, 12);
      vertex(-10, 0);
      vertex(8, 0);
      vertex(9, 5);
      vertex(0, 14);
      endShape(CLOSE);
      popMatrix();
    } else {
      pushMatrix();
      translate(x, y);
      scale(0.15);
      triangle(30, 75, 58, 20, 86, 75);
      popMatrix();
    }
  }
}
