void mouseReleased() {
  if (mode == INTRO) {
    introClick();
  } else if (mode == SELECTION) {
    selectionClick();
  } else if (mode == PLAYERS) {
    playersClick();
  } else if (mode == GAME) {
    gameClick();
  } else if (mode == PAUSE) {
    pauseClick();
  } else if (mode == GAMEOVER) {
    gameOverClick();
  }
}
