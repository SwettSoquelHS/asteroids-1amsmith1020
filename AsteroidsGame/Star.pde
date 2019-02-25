//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  double x_pos;
  double y_pos;
  
  Star(double x, double y){
   x_pos = x;
   y_pos = y;
  }
  
  void show(){
   fill(255,255,255);
   ellipse((float)(x_pos--), (float)(y_pos++), 1,1);
  }
  void starOutOfBounds() {
    if (x_pos < -20) {
      x_pos = 20 + (float)(Math.random()) * 650;
    } else if (x_pos > 672) {
      x_pos = 20 + (float)(Math.random()) * -15;
    }
    if(y_pos < -20){
      y_pos = 20 + (float)(Math.random()) *420;
    } else if(y_pos > 445){
      y_pos =20 + (float)(Math.random()) * -15; 
    }
  }
}
