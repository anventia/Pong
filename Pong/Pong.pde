import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer introTheme;
AudioPlayer leftB;
AudioPlayer rightB;
AudioPlayer wallB;
AudioPlayer scoreS;


// Pong

int mode;                 // Modes
final int INTRO     = 0;  //
final int SELECTION = 1;  //
final int PLAYERS   = 2;  //
final int GAME      = 3;  //
final int PAUSE     = 4;  //
final int GAMEOVER  = 5;  //

int players = 2;  // Number of players
int balls = 1;    // Number of balls

int leftScore = 0;
int rightScore = 0;
int winningScore = 5;

int timer = 100;

float leftX,  leftY,  leftD,  leftS;             // X, Y, Diameter, Speed
float rightX, rightY, rightD, rightS;            //
float ballX,  ballY,  ballD,  ballSX, ballSY;    //
float ball2X, ball2Y, ball2D, ball2SX, ball2SY;  //

color left  = #2EE1FF;
color right = #E46BF7; 
color ball  = #824DFF;
color ball2 = #2EFF6B;
color lightgrey      = 245;
color darkgrey       = 220;
color darkergrey     = 200;
color darkestgrey    = 180;
color darkestestgrey = 150;

boolean keyW, keyS     = false;  // Left paddle keys
boolean keyUp, keyDown = false;  // Right

PFont Montserrat;
PFont MontserratMedium;

int fade = 60;

void setup() {
  //frameRate(120); // Makes everything faster
  size(1280,720);
  minim = new Minim(this);
  introTheme = minim.loadFile("intro.mp3");
  leftB = minim.loadFile("leftpaddle.wav");
  rightB = minim.loadFile("rightpaddle.wav");
  wallB = minim.loadFile("wall.wav");
  scoreS = minim.loadFile("score.wav");
  introTheme.loop();


  mode = INTRO;
  Montserrat = createFont("Montserrat-Regular.ttf", 100);
  MontserratMedium = createFont("Montserrat-Medium.ttf", 100);
  gameSetup();
  textFont(Montserrat);
  textAlign(CENTER);
  rectMode(CENTER);
  strokeCap(ROUND);
  strokeJoin(ROUND);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == SELECTION) {
    selection();
  } else if (mode == PLAYERS) {
    players();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  
}
