Ball[] balls;

Ball reactBall;

boolean reactionStarted;

void setup() {
  size(600, 600);
  reactionStarted = false;
  //create new balls
  balls = new Ball[25];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  //show all balls, and move them
  for (Ball i : balls) {
    i.show();
    i.move();
  }
  reaction();
}

//initiate reaction when mouse has been clicked
void mouseClicked() {
  reactionStarted = true;
  reactBall = new Ball(mouseX, mouseY);
}

//increase readius of reactBall
void reaction() {
  if (reactionStarted) {
    reactBall.show();
    if (reactBall.rad < 150) {
      reactBall.rad += .5;    
    }
  }
}