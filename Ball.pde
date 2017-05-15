class Ball {

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  boolean collision;

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 10;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
    collision = false;
  }

  Ball(float setX, float setY) {
    this();
    x = setX;
    y = setY;
  }


  void move() {
    //if reaction has started and there has been no collision yet, check for collision
    if (reactionStarted && (!(collision))) {
      checkCollision();
    }
    //if there is a collision and radius is still small, increase size
    if (collision && rad < 150) {
      rad += .5;
    }
    //if there is no collision, update position, and bounce
    if (!(collision)) {
      x += dx;
      y += dy;
      bounce();
    }
  }

  void bounce() {
    //if ball is on left or right wall, change dx direction
    if (x + rad >= width || x - rad <= 0) {
      dx *= -1;
    }
    //if ball is on top or bottom wall, change dy direction
    if (y + rad >= height || y - rad <= 0) {
      dy *= -1;
    }
  }

  //draws circle with color c, at (x,y)
  void show() {
    fill(c);
    ellipse(x, y, 2 * rad, 2 * rad);
  }

  //sets collision to true if ball has collided with reactBall
  void checkCollision() {
    if (distance(reactBall.x, reactBall.y) <= reactBall.rad) {
      collision = true;
    }
  }

  //returns distance to point (x, y)
  float distance (float tarx, float tary) {
    return (float) (Math.pow((Math.pow((tarx - x), 2) + Math.pow((tary - y), 2)), 0.5)
      - (rad / 2));
  }
}//end class Ball