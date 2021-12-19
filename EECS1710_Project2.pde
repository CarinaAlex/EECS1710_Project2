int N = 15, circle_radius = 200, circle_speed = 3;
float ang=0, dang=0.01, rad=0;
PVector circle_center;
float[] angle = new float[N];

Bullet bullet;
Circle middle_circle;
Circle[] circles = new Circle[N];

int num_shots = 0;
int num_wrong_shots = 0;
int num_destroyed = 0;
int num_game_over = 3;


void setup() {
  size(1000, 830);
  bullet = new Bullet();
  circle_center = new PVector(width / 2, height / 3.5);
  for (int i = 0; i < N; i++) {
    angle[i] = (360.0 / ((float)N)) * i;
  }
  middle_circle = new Circle((int)circle_center.x, (int)circle_center.y, 100, 0, 0.0, color(199, 0, 20));
  for (int i = 0; i < N; i++) {
    circles[i] = new Circle((int)circle_center.x, (int)circle_center.y, 65-i*2, circle_radius, angle[i], color(92, 138, 48));
  }
  
}

void draw() {
  background(17, 61, 133);
  textSize(30);
  fill(255,255,0);
  text("Destroy the green balls before hitting the red ball " + str(num_game_over) + " times!", 20, 800);

  bullet.move();

  // center circle
  // fill(199, 0, 20);
  // circle(circle_center.x, circle_center.y, 100);
  middle_circle.display();
  if(bullet.isCollided((int)middle_circle.pos.x, (int)middle_circle.pos.y, middle_circle.radius)){
    //middle_circle.destroyed();
    num_wrong_shots = num_wrong_shots + 1;
  }
  textSize(60);
  fill(255, 255, 255);
  text(str(num_wrong_shots), circle_center.x - 20, circle_center.y + 15);
  if(num_wrong_shots >= num_game_over) game_over();

  // outer circles
  // fill(92, 138, 48);
  for (int i=0; i < N; i++) {
     // rad = ((float)angle[i]) * PI / 180;

     // circle(circle_center.x + circle_radius*sin(rad), circle_center.y + circle_radius*cos(rad), 65-i*2);
    circles[i].display();
    circles[i].move();
    // angle[i] = angle[i] + circle_speed*1;
    // if(angle[i] >= 360) angle[i] = 0;
     
    if(bullet.isCollided((int)circles[i].pos.x, (int)circles[i].pos.y, circles[i].radius)){
     circles[i].destroyed();
     num_destroyed = num_destroyed + 1;
    }
  }
  
  
  bullet.display();
  
  if(num_destroyed == N) game_end();
  

}

void keyPressed(){
  bullet.shoot();
  num_shots = num_shots + 1;
}

void game_end(){
  textSize(20);
  text("Game end! You destroyed " + str(N) + " green balls in " + str(num_shots) + " shots!", 40, 120);  
}

void game_over(){
  for (int i=0; i < N; i++) {
   circles[i].destroyed();
  }
  textSize(50);
  fill(255, 0, 0);
  text("Game over! Shot the red ball " + str(num_game_over) + " times!", 40, 600);  
}
