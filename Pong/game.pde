void gameSetup() {
  // paddles
  leftX = 0;
  leftY = height/2;
  leftD = 150;
  leftS = 5;
  rightX = width;
  rightY = height/2;
  rightD = leftD;
  rightS = leftS;
  // ball
  ballX = width/2;
  ballY = height/2;
  ballD = 50;
  ballSX = 5;
  ballSY = 2;
}

void game() {
  gameBackground();
  
  // DRAWING //
  
  // paddles
  fill(left);
  stroke(left);
  strokeWeight(1);
  circle(leftX,leftY, leftD);
  fill(right);
  stroke(right);
  strokeWeight(1);
  circle(rightX,rightY, rightD);
  
  // ball
  fill(ball);
  stroke(ball);
  strokeWeight(1);
  circle(ballX,ballY, ballD);
  
  // MOVEMENT //
  
  // paddles
  if (keyW == true) leftY -= leftS;
  if (keyS == true) leftY += leftS;
  if (leftY < leftD) leftY = leftD;
  if (leftY > height-leftD) leftY = height-leftD;
  if (keyUp == true) rightY -= leftS;
  if (keyDown == true) rightY += leftS;
  if (rightY < rightD) rightY = rightD;
  if (rightY > height-rightD) rightY = height-rightD;

  
  // ball
  ballX += ballSX;
  ballY += ballSY;
  if (ballX < ballD/2) { // hits left side of screen
    rightPoint();
  }
  if (ballX > width-ballD/2) { // hits right side of screen
    leftPoint();
  }
  if (ballY < ballD/2 || ballY > height-ballD/2) {
    ballSY = ballSY*-1;
  }
  
  // ball collisions
 
  if (dist(ballX,ballY, leftX,leftY) < ballD/2+leftD/2) {
    ballSX = (ballX-leftX)/15;
    ballSY = (ballY-leftY)/15;
  }
  if (dist(ballX,ballY, rightX,rightY) < ballD/2+rightD/2) {
    ballSX = (ballX-rightX)/15;
    ballSY = (ballY-rightY)/15;
  }
  
  // OTHER //
  
  // pause
  fill(darkgrey);
  stroke(darkgrey);
  strokeWeight(5);
  tactileRect(width/2,height-70, 80,80, 4, darkergrey,darkgrey);
  //rect(width/2,height-70, 80,80, 4);
  fill(darkestgrey);
  stroke(darkestgrey);
  strokeWeight(1);
  rect(width/2,height-70, 45,45);
  fill(darkgrey);
  stroke(darkgrey);
  rect(width/2,height-70, 15,45);
  
  // score
  textSize(70);
  textAlign(RIGHT);
  text(leftScore, width/2-75,height-45);
  textAlign(LEFT);
  text(rightScore, width/2+75,height-45);
  
  // gameOver
  if (leftScore == winningScore || rightScore == winningScore) {
    mode = GAMEOVER;
  }
  
}

void gameClick() {
  if (mouseX > width/2-80/2 && mouseX < width/2+80/2 && mouseY > height-70-80/2 && mouseY < height-70+80/2) {
    mode = PAUSE;
  }
}

void leftPoint() {
  leftScore += 1;
  leftY = height/2;
  rightY = height/2;
  ballX = width/2;
  ballY = height/2;
  ballSX = 5;
  ballSY = random(-2,2);
}

void rightPoint() {
  rightScore += 1;
  leftY = height/2;
  rightY = height/2;
  ballX = width/2;
  ballY = height/2;
  ballSX = -5;
  ballSY = random(-2,2);
}

void gameBackground() {
  background(lightgrey);
  stroke(darkgrey);
  strokeWeight(10);
  line(width/2,0, width/2,height);
  fill(lightgrey);
  stroke(lightgrey);
  strokeWeight(1);
  rect(width/2,height-70, 110,110, 5);
}
