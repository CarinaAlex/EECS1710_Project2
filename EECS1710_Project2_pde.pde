int N = 10, circle_radius = 200, circle_speed = 3;
float ang=0, dang=0.01, rad=0;
PVector circle_center;
float[] angle = new float[N];

Bullet bullet;

void setup() {
  size(950, 830);
  bullet = new Bullet();
  circle_center = new PVector(width / 2, height / 3.5);
  for (int i=0; i < N; i++) {
    angle[i] = (360.0 / ((float)N)) * i;
  }
  
}

void draw() {
 background(17, 61, 133);
 
 bullet.move();
 
 // center circle
 fill(199, 0, 20);
 circle(circle_center.x, circle_center.y, 100);
 bullet.isCollided((int)circle_center.x, (int)circle_center.y, 100);
 
 // outer circles
 fill(92, 138, 48);
 for (int i=0; i < N; i++) {
     rad = ((float)angle[i]) * PI / 180;

     circle(circle_center.x + circle_radius*sin(rad), circle_center.y + circle_radius*cos(rad), 65-i*2);
     angle[i] = angle[i] + circle_speed*1;
     if(angle[i] >= 360) angle[i] = 0;
     
     bullet.isCollided((int)(circle_center.x + circle_radius*sin(rad)), (int)(circle_center.y + circle_radius*cos(rad)), 65-i*2);
 }
 bullet.display();

}

void keyPressed(){
  bullet.shoot();
}
