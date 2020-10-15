// Pong

int mode;                // Modes
final int INTRO    = 0;  //
final int GAME     = 1;  //
final int PAUSE    = 2;  //
final int GAMEOVER = 3;  //

int players = 2;  // Number of players

float leftX, leftY, leftD, leftS;           // X, Y, Diameter, Speed
float rightX, rightY, rightD, rightS;       //
float ballX, ballY, ballD, ballSX, ballSY;  //

color left  = #2EE1FF;
color right = #E46BF7;
color ball = #824DFF;

color lightgrey  = 245;
color darkgrey   = 220;
color darkergrey = 200;

boolean keyW, keyS     = false;  // Left paddle keys
boolean keyUp, keyDown = false;  // Right


void setup() {
  size(1280,720);
  mode = GAME;
  gameSetup();
  rectMode(CENTER);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  
}
