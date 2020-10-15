void gameSetup() {
  // paddles
  leftX = 0;
  leftY = height/2;
  leftD = 200;
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
  ballSY = 5;
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
  if (leftY < leftD/2) leftY = leftD/2;
  if (leftY > height-leftD/2) leftY = height-leftD/2;
  if (keyUp == true) rightY -= leftS;
  if (keyDown == true) rightY += leftS;
  if (rightY < leftD/2) rightY = rightD/2;
  if (rightY > height-leftD/2) rightY = height-rightD/2;

  
  // ball
  ballX += ballSX;
  ballY += ballSY;
  if (ballX < ballD/2 || ballX > width-ballD/2) {
    ballSX = ballSX*-1;
  }
  if (ballY < ballD/2 || ballY > height-ballD/2) {
    ballSY = ballSY*-1;
  }
  
  // BUTTONS //
  
  // pause
  fill(darkgrey);
  stroke(darkgrey);
  strokeWeight(10);
  //tactileRect(width/2,height-70, 80,80, 4, darkergrey,darkgrey);
  rect(width/2,height-70, 80,80, 4);
  if (mouseX > width/2-80/2 && mouseX < width/2+80/2 && mouseY > height-70-80/2 && mouseY < height-70+80/2) {
    fill(darkergrey);
    stroke(darkergrey);
  } else {
    fill(darkergrey);
    stroke(darkergrey);
  }
  strokeWeight(1);
  rect(width/2,height-70, 45,45);
  fill(darkgrey);
  stroke(darkgrey);
  rect(width/2,height-70, 15,45);
}

void gameClick() {
  
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
