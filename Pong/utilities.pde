void tactileRect(int x, int y, int w, int h, int r, color a, color b) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    stroke(a);
  } else {
    stroke(b);
  }
  rect(x,y, w,h, r);
}
