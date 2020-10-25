int playersX = 1280+600;
int playersBox = 980/3;

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
    
    // 0
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(playersX-playersBox-20,height/2+70, playersBox,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > playersX-playersBox*1.5-20 && mouseX < playersX-playersBox/2-20 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("0", playersX-playersBox-20, height/2+95);
    
    // 1
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(playersX,height/2+70, playersBox,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > playersX-playersBox/2 && mouseX < playersX+playersBox/2 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("1", playersX, height/2+95);
    
    // 2
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(playersX+playersBox+20,height/2+70, playersBox,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX < playersX+playersBox*1.5+20 && mouseX > playersX+playersBox/2+20 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("2", playersX+playersBox+20, height/2+95);
    
    // Slide in
    playersX -= 50;
    if (playersX < width/2) {
      playersX = width/2;
    }
  }
}

void playersClick() {
  if (mouseX > playersX-playersBox*1.5-20 && mouseX < playersX-playersBox/2-20 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    players = 0;
    gameSetup();
    mode = GAME;
  }
  if (mouseX > playersX-playersBox/2 && mouseX < playersX+playersBox/2 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    players = 1;
    gameSetup();
    mode = GAME;
  }
  if (mouseX < playersX+playersBox*1.5+20 && mouseX > playersX+playersBox/2+20 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    players = 2;
    gameSetup();
    mode = GAME;
  }
}
