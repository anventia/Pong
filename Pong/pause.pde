void pause() {
  fill(darkgrey);
  stroke(darkgrey);
  strokeWeight(5);
  tactileRect(width/2,height-70, 80,80, 4, darkergrey,darkgrey);
  //rect(width/2,height-70, 80,80, 4);
  fill(darkestgrey);
  stroke(darkestgrey);
  strokeWeight(10);
  triangle(width/2-35/2,height-70-40/2, width/2-35/2,height-70+40/2, width/2+40/2,height-70);
}

void pauseClick() {
  if (mouseX > width/2-80/2 && mouseX < width/2+80/2 && mouseY > height-70-80/2 && mouseY < height-70+80/2) {
    mode = GAME;
  }
}
