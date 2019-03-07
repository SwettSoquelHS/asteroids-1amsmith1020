/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */


class Spaceship extends Mover {  
  ArrayList<Bullet> myBullets;
  Bullet myBullet;

  Spaceship(float x, float y) {
    super(x, y);
    direction = 270;
    myBullets = new ArrayList<Bullet>();
  }

  Spaceship(float x_pos, float y_pos, float speed, float direction) {
    super(x_pos, y_pos, speed, direction);
    myBullets = new ArrayList<Bullet>();
  }

  void Rotate(float amount) {
    direction += amount;
  }

  void changeSpeedBy(float amount) {
    if (speed + amount > 3) {
      speed = 3;
    } else if (speed + amount <= 0) {
      speed = 0.5;
    } else {
      speed += amount;
    }
  }

  void update() {
    super.update();
    for (int i = 0; i<myBullets.size(); i++) {
      Bullet b = myBullets.get(i);
      if (b!=null) {
        b.update();
        if (b.getLive() < 0) {
          myBullets.remove(b);
        }
      }
    }
  }


  void show() {
    noStroke();
    pushMatrix();
    translate(x_pos, y_pos);

    scale(0.75);
    rotate(radians(direction + 270));
    beginShape();
    fill(150);
    vertex(0, 40);
    vertex(-4, 36);
    vertex(-4, 8);
    vertex(-4, 10);
    vertex(-8, 10);
    vertex(-8, 8);
    vertex(-20, 8);
    vertex(-20, 24); 
    vertex(-24, 24);
    vertex(-24, 4);
    vertex(-20, 4);
    vertex(-20, 6);
    vertex(20, 6);
    vertex(20, 4);
    vertex(24, 4);
    vertex(24, 24);
    vertex(20, 24);
    vertex(20, 8);
    vertex(8, 8);
    vertex(8, 10);
    vertex(4, 10);
    vertex(4, 36);
    endShape();
    if (speed > 0.5) {
      fill(255, 255, 0);
      triangle(-4, 5, 4, 5, 0, -6);
    } else if (speed >= 0.5) {
      fill(255, 255, 0);
      triangle(-4, 5, 4, 5, 0, 0);
    }
    popMatrix();
    for (int i = 0; i<myBullets.size(); i++) {
      Bullet b = myBullets.get(i);
      if (b!=null) {
        b.show();
      }
    }
  }

  void hyperspace() {
    this.speed = 0;
    this.x_pos = random(100, 600);
    this.y_pos = random(100, 360);
  }

  void fire() {
    for (int i = 0; i<myBullets.size(); i++) {
      if (myBullets.get(i) != null && !myBullets.get(i).isAlive()) {
        myBullet = new Bullet(x_pos, y_pos, speed, direction);
        myBullets.add(myBullet);//Make sure you have declared a Bullet myBullet for the spaceship
      }
    }
  }
}
