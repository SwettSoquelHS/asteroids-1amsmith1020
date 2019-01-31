/*
  Asteroid class
 Should extend Mover class and implement show.
 
 Initially, your asteroid may just be a simple circle or square
 but the final program should use "beginShap(), vertex(), and endShape()"
 to render the asteroid.
 */
class Asteroid extends Mover {   

  int size;

  Asteroid(float x, float y, float speed, float direction) {
    super(x, y, speed, direction);


    size = (int)(3 * Math.random()+1);
  }


  int asteroidSize(int size) {
    size = (int)(3 * Math.random()+1);
    return size;
  }

  
  void update() {
    super.update();
    
    //println("Asteroid special update...");
  }
  


  



  //Math.random * 4; (int)
  void show() {
    pushMatrix();
    if (size == 1) {
      println(x_pos + " : " + y_pos);
      translate(x_pos, y_pos);
      scale(1.25);
      fill(60);
      beginShape();
      vertex(5, 3);
      vertex(2, 5);
      vertex(-2, 4);
      vertex(-3, -1);
      vertex(-5, -5);
      vertex(4, -4);
      endShape(CLOSE);
    } else if (size == 2) {
      translate(x_pos, y_pos);
      scale(2);
      fill(70);
      beginShape();
      vertex(0, 8);
      vertex(-4, 5);
      vertex(-5, 0);
      vertex(6, 0);
      vertex(5, 5);
      vertex(0, 8);
      endShape(CLOSE);
    } else if (size == 3) {
      beginShape();
      translate(x_pos, y_pos);
      scale(1.85);
      fill(90);
      vertex(0, 14);
      vertex(-8, 12);
      vertex(-10, 0);
      vertex(-8, 0);
      vertex(8, 0);
      vertex(9, 5);
      vertex(0, 14);
      endShape(CLOSE);
    } else {
      translate(x_pos, y_pos);
      scale(0.15);
      triangle(30, 75, 58, 20, 86, 75);
    }
    popMatrix();
  }
}
