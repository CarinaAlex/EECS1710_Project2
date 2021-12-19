class Bullet{
  
  int scl = 15;
  
  int init_x = width / 2;
  int init_y = 700;
  
  int rect_width = 15;
  int rect_height = 30;
  
  boolean check_x, check_y;
  
  int bulletSpeed = 35;
  int bulletX = init_x;
  int bulletY = init_y;
  
  boolean isBeingShot = false;
  boolean collided = false;
  
  Bullet(){

  }
  
  void display(){
    rectMode(CENTER);
    fill(255);
    rect(bulletX, bulletY, rect_width, rect_height);
  }
  
  void move(){
    if(isBeingShot) bulletY = bulletY - bulletSpeed*1;
    if(bulletY < 0){
      reset();
    }
    //if(collided){
    //  isBeingShot = false;
    //  collided = false;
    //  reset();
    //}
  }

  void reset(){
    bulletX = init_x;
    bulletY = init_y;
    isBeingShot = false;
  }
  
  void shoot(){
    isBeingShot = true;
  }
  
  void isCollided(int x, int y, int r){
    //fill(255);
    //circle(width/2, (bulletY - (rect_height / 2)), 3);
    //fill(255);
    //circle(width/2, (y + (r / 2)), 3);]
    //check_x = (bulletX < (x + (r / 2))) && (bulletX > (x - (r / 2)));
    //check_y = (bulletY - (rect_height / 2)) <= (y + (r / 2));
    
    int circledistance_x = abs(x - bulletX);
    int circledistance_y = abs(y - bulletY);
    
    if (circledistance_x > ((rect_width / 2) + r)) collided = false;
    if (circledistance_y > ((rect_height / 2) + r)) collided = false;
    
    if (circledistance_x <= (rect_width / 2)) collided = true;
    if (circledistance_y <= (rect_height / 2)) collided = true;
    
    int cornerdistance_sq = ((circledistance_x - rect_width / 2) ^ 2) + ((circledistance_y + rect_height / 2) ^ 2);
    
    if (cornerdistance_sq <= (r ^ 2)) collided = true;
    else collided = false;
    
    
    if(collided){
      reset();
    }
    else collided = false;
  }
  
}
