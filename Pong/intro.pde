int introY = -100;

void intro() {
  if (fade == 60) introY = -100;  // Reset animation
  fill(lightgrey, 10);
  stroke(lightgrey, 10);
  strokeWeight(1);
  rect(width/2,height/2, width,height);
  fade -= 4;
  if (fade < 0) {  // Finished fading in    
    background(lightgrey);
    //tactileRect(width/2,height/2-75, 500,100, 5, darkestgrey, darkergrey);
    fill(0);
    textSize(100);
    text("Pong", width/2,introY-35);
    fill(lightgrey);
    strokeWeight(5);
    tactileRect(width/2,introY+70, 500,100, 5, darkestgrey, darkergrey);
    fill(darkergrey);
    textSize(75);
    if (mouseX > width/2-500/2 && mouseX < width/2+500/2 && mouseY > introY+70-100/2 && mouseY < introY+70+100/2) {
      fill(darkestgrey);
    } else {
      fill(darkergrey);
    }
    text("Play", width/2, introY+95);
    
    introY += 30;
    if (introY > height/2) introY = height/2;
  }
}

void introClick() {
  if (mouseX > width/2-500/2 && mouseX < width/2+500/2 && mouseY > introY+70-100/2 && mouseY < introY+70+100/2) {
    fade = 60;
    mode = SELECTION;
  }
}
