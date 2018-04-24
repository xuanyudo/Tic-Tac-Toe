/****************************************************************************************/
/*Name: Xuanyu Dong Junjie Lin*/
/*Email: xuanyudo@buffalo.edu junjieli@buffalo.edu*/
/*Course: CSE113 A_5 */
/*Date Started: 04/10/2018 */
/*Project: build tic tac toe game*/
/*Date Completed: */
/*****************************************************************************************/

boolean ingame = false;
PImage background;
int[][] board;
int playerTurn;
void setup() {
  size(480, 540);
  board = new int[3][3];
  startScene();
  playerTurn = 1;
}

void startScene() {
  //background = loadImage("images/tic-tac-toe-rock-1.jpg");
  //background.resize(480,540);
  //background(background);
  background(#fff5cc);
  drawHeader(); // draw Header text of tic tac toe
  drawButton(140, 180, #000000, "Human VS Human"); // button of human vs human option
  drawButton(140, 270, #000000, "Human VS AI Easy"); // button of human vs AI easy option
  drawButton(140, 360, #000000, "Human VS AI Hard"); // button of human vs AI hard option
  drawCircle(50, 170, 50, #dfcca1);
  drawCross(400, 420, 10, PI/6, #22fcfa);
}

void drawHeader() {
  //Header: Tic Tac Toe
  textSize(70);
  textAlign(CENTER);
  fill(#d111ff);
  text("Tic Tac Toe ", 240, 120);
}

void drawButton(int x, int y, color c, String s) {
  // button of human vs human option
  noFill();
  strokeWeight(7);
  stroke(c);
  rect(x, y, 200, 50);

  PFont font;
  font = loadFont("data/Arial-BoldMT-48.vlw");
  textFont(font);
  textSize(20);
  fill(#000000);
  text(s, 240, y+ 30);
}

void drawCross(int x, int y, int size, float angle, color c) {
  stroke(c);
  pushMatrix();
  translate(x, y);
  rotate(angle);
  line(-size, -size, +size, +size);
  line(-size, +size, +size, -size);

  popMatrix();
}

void drawCircle(int x, int y, int size, color c) {

  noFill();
  stroke(c);
  strokeWeight(5);
  ellipse(x, y, size, size);
}

void drawInGameScene() {
  background(#fff5cc);
  stroke(#000000);
  line(0, 0, 480, 0);
  line(0, 160, 480, 160);
  line(0, 320, 480, 320);
  line(0, 480, 480, 480);
  line(160, 0, 160, 480);
  line(320, 0, 320, 480);
  fill(255, 0, 0);
  textSize(25);
  text("Player 1:", 60, 520);
  fill(0, 0, 255);
  text("Player 2:", 350, 520);
}

void draw() {
  if (ingame==false) {
    if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=180)&&(mouseY<=230)) {
      drawButton(140, 180, #000ff0, "Human VS Human"); // button of human vs human option
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=270)&&(mouseY<=320)) {
      drawButton(140, 270, #000ff0, "Human VS AI Easy"); // button of human vs human option
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=360)&&(mouseY<=410)) {
      drawButton(140, 360, #000ff0, "Human VS AI Hard"); // button of human vs human option
    } else {
      drawButton(140, 180, #000000, "Human VS Human"); // button of human vs human option
      drawButton(140, 270, #000000, "Human VS AI Easy"); // button of human vs AI easy option
      drawButton(140, 360, #000000, "Human VS AI Hard"); // button of human vs AI hard option
    }
  }
}

void mousePressed() {
  if (ingame ==false) {
    if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=180)&&(mouseY<=230)) {
      ingame = true;  
      drawInGameScene();
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=270)&&(mouseY<=320)) {
      ingame = true;
      drawInGameScene();
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=360)&&(mouseY<=410)) {
      ingame = true;
      drawInGameScene();
    }
  } else {
    strokeWeight(7);
    if (mouseY<=480) {
      if (board[int(mouseX/160)][int(mouseY/160)]==0) {
        board[int(mouseX/160)][int(mouseY/160)] = playerTurn;
        drawBoard(playerTurn, int(mouseX/160), int(mouseY/160));
        if (playerTurn==1) {
          playerTurn = 2;
        } else {
          playerTurn = 1;
        }
      }
    }
  }
}
void drawBoard(int turn, int x, int y) {
  if (turn == 1) {
    drawCross(x*160+80, y*160+80, 45, 0, #ff0000);
  } else {
    drawCircle(x*160+80, y*160+80, 100, #0000ff);
  }
}
void clearBoard() {
  board = new int[3][3];
}