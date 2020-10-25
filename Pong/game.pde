void gameSetup() {
  timer = 100;
  leftScore = 0;
  rightScore = 0;
  // paddles
  leftX = 0;
  leftY = height/2;
  leftD = 150;
  leftS = 13;
  rightX = width;
  rightY = height/2;
  rightD = leftD;
  rightS = leftS;
  // ball1
  ballX = width/2+60;
  ballY = height/2;
  ballD = 50;
  ballSX = 7;
  ballSY = random(-2,2);;
  // ball2
  ball2X = width/2-60;
  ball2Y = height/2;
  ball2D = 50;
  ball2SX = -7;
  ball2SY = random(-2,2);;
}

void game() {
  gameBackground();
  timer -= 2;
  if (timer < 0) timer = 0;
  
  // DRAWING //
  fill(0);
  textSize(20);
  //text("FPS: "+frameRate, width/2+100,30);
  
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
  // ball2
  if (balls == 2) {
    fill(ball2);
    stroke(ball2);
    strokeWeight(1);
    circle(ball2X,ball2Y, ball2D);
  }
  
  // MOVEMENT //
  
  // paddles
  if (players == 1 || players == 2) {
    if (keyW == true) leftY -= leftS;
    if (keyS == true) leftY += leftS;
  } 
  if (players == 2) {
    if (keyUp == true) rightY -= leftS;
    if (keyDown == true) rightY += leftS;
  } else {
    if (ballX > width/2 || ball2X > width/2) {
      if (ballX > ball2X) {
        if (dist(0,ballY, 0,rightY) > rightD/2) {
          if (ballY < rightY) {
            rightY -= rightS;
          } else {
            rightY += rightS;
          }
        }
      } else {
        if (dist(0,ball2Y, 0,rightY) > rightD/2) {
          if (ball2Y < rightY) {
            rightY -= rightS;
          } else {
            rightY += rightS;
          }
        }
      }
    }
  }
  if (players == 0) {
    if (ballX < width/2 || ball2X < width/2) {
      if (ballX < ball2X) {
        if (dist(0,ballY, 0,leftY) > leftD/2) {
          if (ballY < leftY) {
            leftY -= leftS;
          } else {
            leftY += leftS;
          }
        }
      } else {
        if (dist(0,ball2Y, 0,leftY) > leftD/2) {
          if (ball2Y < leftY) {
            leftY -= leftS;
          } else {
            leftY += leftS;
          }
        }
      }
    }
  }
  if (leftY < leftD) leftY = leftD;
  if (leftY > height-leftD) leftY = height-leftD;
  if (rightY < rightD) rightY = rightD;
  if (rightY > height-rightD) rightY = height-rightD;

  
  // ball
  if (timer == 0) {
    ballX += ballSX;
    ballY += ballSY;
  }
  if (ballX < 0-ballD/2) {  // hits left side of screen
    rightPoint();
  }
  if (ballX > width+ballD/2) {  // hits right side of screen
    leftPoint();
  }
  if (ballY < ballD/2 || ballY > height-ballD/2) {  // hits top of screen
    wallB.play();
    ballSY = ballSY*-1;
    wallB.rewind();
  }
  // ball2
  if (balls == 2) {
    if (timer == 0) {
      ball2X += ball2SX;
      ball2Y += ball2SY;
    }
    if (ball2X < 0-ball2D/2) {  // hits left side of screen
      rightPoint();
    }
    if (ball2X > width+ball2D/2) {  // hits right side of screen
      leftPoint();
    }
    if (ball2Y < ball2D/2 || ball2Y > height-ball2D/2) { // hits top of screen
      wallB.play();
      ball2SY = ball2SY*-1;
      wallB.rewind();
    }
  }
  
  // ball + paddle collisions
  if (dist(ballX,ballY, leftX,leftY) < ballD/2+leftD/2) {
    leftB.play();
    ballSX = (ballX-leftX)/5;
    ballSY = (ballY-leftY)/5;
    leftB.rewind();
  }
  if (dist(ballX,ballY, rightX,rightY) < ballD/2+rightD/2) {
    rightB.play();
    ballSX = (ballX-rightX)/5;
    ballSY = (ballY-rightY)/5;
    rightB.rewind();
  }
  
  if (balls == 2) {
    if (dist(ball2X,ball2Y, leftX,leftY) < ball2D/2+leftD/2) {
      leftB.play();
      ball2SX = (ball2X-leftX)/5;
      ball2SY = (ball2Y-leftY)/5;
      leftB.rewind();
    }
    if (dist(ball2X,ball2Y, rightX,rightY) < ball2D/2+rightD/2) {
      rightB.play();
      ball2SX = (ball2X-rightX)/5;
      ball2SY = (ball2Y-rightY)/5;
      rightB.rewind();
    }
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
    fade = 60;
    mode = GAMEOVER;
  }
  
}

void gameClick() {
  if (mouseX > width/2-80/2 && mouseX < width/2+80/2 && mouseY > height-70-80/2 && mouseY < height-70+80/2) {
    mode = PAUSE;
  }
}

void leftPoint() {
  scoreS.rewind();
  scoreS.play();
  timer = 100;
  leftScore += 1;
  leftY = height/2;
  rightY = height/2;
  ballX = width/2+60;
  ballY = height/2;
  ballSX = 7;
  ballSY = random(-2,2);
  
  ball2X = width/2-60;
  ball2Y = height/2;
  ball2SX = -7;
  ball2SY = random(-2,2);
}

void rightPoint() {
  scoreS.rewind();
  scoreS.play();
  timer = 100;
  rightScore += 1;
  leftY = height/2;
  rightY = height/2;
  ballX = width/2;
  ballY = height/2;
  ballSX = -7;
  ballSY = random(-2,2);
  
  ball2X = width/2+60;
  ball2Y = height/2;
  ball2SX = 7;
  ball2SY = random(-2,2);
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
