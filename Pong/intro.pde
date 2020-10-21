void intro() {
  background(lightgrey);
  //tactileRect(width/2,height/2-75, 500,100, 5, darkestgrey, darkergrey);
  fill(0);
  textSize(100);
  text("Pong", width/2,height/2-35);
  fill(lightgrey);
  strokeWeight(5);
  tactileRect(width/2,height/2+70, 500,100, 5, darkestgrey, darkergrey);
  fill(darkergrey);
  textSize(75);
  if (mouseX > width/2-500/2 && mouseX < width/2+500/2 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    fill(darkestgrey);
  } else {
    fill(darkergrey);
  }
  text("Play", width/2, height/2+95);
}

void introClick() {
  if (mouseX > width/2-500/2 && mouseX < width/2+500/2 && mouseY > height/2+70-100/2 && mouseY < height/2+70+100/2) {
    mode = SELECTION;
  }
}
