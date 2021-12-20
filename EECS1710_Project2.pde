int N = 15, circle_radius = 200, circle_speed = 3;
float ang=0, dang=0.01, rad=0;
PVector circle_center;
float[] angle = new float[N];
PImage bg;
int y;

Bullet bullet;
Circle middle_circle;
Circle[] circles = new Circle[N];

int num_shots = 0;
int num_wrong_shots = 0;
int num_destroyed = 0;
int num_game_over = 3;


void setup() {
  size(1080, 913);
  bg = loadImage("galaxy.jpg");
  bullet = new Bullet();
  circle_center = new PVector(width / 2, height / 3.5);
  for (int i = 0; i < N; i++) {
    angle[i] = (360.0 / ((float)N)) * i;
  }
  
  middle_circle = new Circle((int)circle_center.x, (int)circle_center.y, 100, 0, 0.0, color(245, 206, 66));
  for (int i = 0; i < N; i++) {
    circles[i] = new Circle((int)circle_center.x, (int)circle_center.y, 65-i*2, circle_radius, angle[i], color(91, 163, 199));
  }
  
}

void draw() {
  background(bg);
  textSize(22);
  fill(245, 206, 66);
  text("Hit any key to destroy the rotating planets before shooting the center planet " + str(num_game_over) + " times!", 90, 800);

  bullet.move();

  // center circle
  middle_circle.display();
  if(bullet.isCollided((int)middle_circle.pos.x, (int)middle_circle.pos.y, middle_circle.radius)){
    num_wrong_shots = num_wrong_shots + 1;
  }
  textSize(60);
  fill(245, 96, 66);
  text(str(num_wrong_shots), circle_center.x - 20, circle_center.y + 15);
  if(num_wrong_shots >= num_game_over) game_over();

  // outer circles
  for (int i=0; i < N; i++) {
     
    circles[i].display();
    circles[i].move();
 
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
  textSize(30);
  text("Game end! You destroyed " + str(N) + " rotating planets with " + str(num_shots) + " bullets!", 80, 110);  
}

void game_over(){
  for (int i=0; i < N; i++) {
   circles[i].destroyed();
  }
  textSize(40);
  fill(237, 98, 83); 
  text("Game over! You shot the center planet " + str(num_game_over) + " times!", 80, 500);  
}
