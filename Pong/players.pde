int playersX = 1280+600;

void players() {
  if (fade == 60) playersX = 1280+600;  // Reset animation
  fill(lightgrey, 10);
  stroke(lightgrey, 10);
  strokeWeight(1);
  rect(width/2,height/2, width,height);
  fade -= 7;
  if (fade < 0) {  // Finished fading in    
    // Menu
    background(lightgrey);
    fill(0);
    textSize(100);
    text("Number of Players", playersX,height/2-35);
    
    // 1
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(playersX-260,height/2+70, 500,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > playersX-500/2-260 && mouseX < playersX+500/2-260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("1", playersX-260, height/2+95);
    
    // 2
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(playersX+260,height/2+70, 500,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > playersX-500/2+260 && mouseX < playersX+500/2+260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("2", playersX+260, height/2+95);
    
    // Slide in
    playersX -= 50;
    if (playersX < width/2) {
      playersX = width/2;
    }
  }
}

void playersClick() {
  if (mouseX > playersX-500/2-260 && mouseX < playersX+500/2-260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    players = 1;
    gameSetup();
    mode = GAME;
  }
  if (mouseX > playersX-500/2+260 && mouseX < playersX+500/2+260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    players = 2;
    gameSetup();
    mode = GAME;
  }
}
