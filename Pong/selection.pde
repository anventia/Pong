int selectionX = 1280+600;

void selection() {
  if (fade == 60) selectionX = 1280+600;  // Reset animation
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
    text("Number of Balls", selectionX,height/2-35);
    
    // 1
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(selectionX-260,height/2+70, 500,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > selectionX-500/2-260 && mouseX < selectionX+500/2-260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("1", selectionX-260, height/2+95);
    
    // 2
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(selectionX+260,height/2+70, 500,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > selectionX-500/2+260 && mouseX < selectionX+500/2+260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("2", selectionX+260, height/2+95);
    
    // Slide in
    selectionX -= 50;
    if (selectionX < width/2) {
      selectionX = width/2;
    }
  }
}

void selectionClick() {
  if (mouseX > selectionX-500/2-260 && mouseX < selectionX+500/2-260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    balls = 1;
    mode = PLAYERS;
  }
  if (mouseX > selectionX-500/2+260 && mouseX < selectionX+500/2+260 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fade = 60;
    balls = 2;
    mode = PLAYERS;
  }
}
