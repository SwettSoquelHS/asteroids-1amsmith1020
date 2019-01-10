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
   ellipse((float)x_pos, (float)y_pos, 5,5);
  }
}
