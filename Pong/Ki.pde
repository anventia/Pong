void keyPressed() {
  if (key == 'w' || key == 'W') keyW = true;
  if (key == 's' || key == 'S') keyS = true;
  
  if (keyCode == UP) keyUp = true;
  if (keyCode == DOWN) keyDown = true;

}


void keyReleased() {
  if (key == 'w' || key == 'W') keyW = false;
  if (key == 's' || key == 'S') keyS = false;
  
  if (keyCode == UP) keyUp = false;
  if (keyCode == DOWN) keyDown = false;
}
