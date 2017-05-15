class Ball {

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b);
    rad = 10;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
  }

  void move() {
    //update position
    x += dx;
    y += dy;
    bounce();
  }

  void bounce() {
    //if ball is on left or right wall, change dx direction
    if (x == 600 || x == 0) {
      dx *= -1;
    }
    //if ball is on top or bottom wall, change dy direction
    if (y == 0 || y == 600) {
      dy *= -1;
    } 
  }
  
}//end class Ball