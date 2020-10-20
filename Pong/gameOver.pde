int gameoverbox = -50;
int gameovertext = -800;
int winnertext = -1600;
int scoretext = -2100;

void gameOver() {
  fill(lightgrey, 10);
  stroke(lightgrey, 10);
  strokeWeight(1);
  rect(width/2,height/2, width,height);
  fade -= 1;
  if (fade < 0) {  // Finished fading in
    // Background
    fill(lightgrey);
    stroke(lightgrey);
    strokeWeight(1);
    rect(width/2,height/2, width,height);
    
    fill(250);
    rectMode(CORNER);
    //rect(210,110, 500,500);
    rectMode(CENTER);
    
    // TEXT //
    
    // Game Over
    textAlign(LEFT);
    fill(0);
    textSize(70);
    text("Game Over!", gameovertext,200);
    gameovertext += 30;
    if (gameovertext > 250) gameovertext = 250;
    
    // Winner
    fill(darkestgrey);
    textSize(50);
    if (leftScore > rightScore) {  // Left wins
      text("Left side wins!", winnertext,280);
    } else {  // Right wins
      text("Right side wins!", winnertext,280);
    }
    winnertext += 30;
    if (winnertext > 255) winnertext = 255;
    
    // Score
    fill(darkestgrey);
    textSize(50);
    text("Score: "+leftScore+" / "+rightScore, scoretext,360);
    scoretext += 30;
    if (scoretext > 255) scoretext = 255;

    fill(lightgrey);
    stroke(lightgrey);
    strokeWeight(1);
    rect(105,height/2, 210,500);
    
    // Box
    if (leftScore > rightScore) {  // Left wins
      fill(left);
    } else {  // Right wins
      fill(right);
    }
    stroke(darkgrey);
    strokeWeight(5);
    rect(gameoverbox,height/2, 100,500);
    gameoverbox += 30;
    if (gameoverbox > 160) gameoverbox = 160;
  }
}

void gameOverClick() {
}
