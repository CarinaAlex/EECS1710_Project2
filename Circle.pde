class Circle{

  int scl = 15;

  int init_x = width / 2;
  int init_y = 700;

  int rect_width = 15;
  int rect_height = 30;

  boolean check_x, check_y;

  int bulletSpeed = 35;
  int bulletX = init_x;
  int bulletY = init_y;

  boolean exists = true;
  float angle;
  int circle_radius = 200;
  int radius;
  int circle_speed = 3;
  int x;
  int y;

  PVector pos;

  color c;

  Circle(int _x, int _y, int r, int c_r, float _angle, color _c){
    x = _x;
    y = _y;
    radius = r;
    circle_radius = c_r;
    c = _c;
    angle = _angle;
   
    
    
    pos = new PVector(x + c_r * sin(degrees_to_rad(angle)), y + c_r * cos(degrees_to_rad(angle)));
  }

  void display(){
    fill(c);
    circle(pos.x, pos.y, radius);
  }

  float degrees_to_rad(float d){
    return d * PI / 180;
  }

  void move(){
    angle = angle + circle_speed*1;
    if(angle >= 360) angle = 0;
    pos.x = x + circle_radius * sin(degrees_to_rad(angle));
    pos.y = y + circle_radius * cos(degrees_to_rad(angle));
  }

  void destroyed(){
    exists = false;
    radius = 0;
  }

}
