/****************************************************************************************/
/*Name: Xuanyu Dong Junjie Lin*/
/*Email: xuanyudo@buffalo.edu junjieli@buffalo.edu*/
/*Course: CSE113 A_5 */
/*Date Started: 04/10/2018 */
/*Project: build tic tac toe game, there are 3 version of game, first one is human vs human, second one is human vs AI easy, and third one is human vs AI hard.*/
/*Date Completed: */
/*****************************************************************************************/

boolean ingame = false;//declare
PImage background;//declare background image
int[][] board;//declare 2D array 
int playerTurn;//declare playerturn
void setup() {
  size(480, 540);//set display size
  board = new int[3][3];//inilize 2D array
  startScene();//call for startScene
  playerTurn = 1;//inilize
}

void startScene() {
  //background = loadImage("images/tic-tac-toe-rock-1.jpg");
  //background.resize(480,540);
  //background(background);
  background(#fff5cc);//set the color for background
  drawHeader(); // draw Header text of tic tac toe
  drawButton(140, 180, #000000, "Human VS Human"); // button of human vs human option
  drawButton(140, 270, #000000, "Human VS AI Easy"); // button of human vs AI easy option
  drawButton(140, 360, #000000, "Human VS AI Hard"); // button of human vs AI hard option
  drawCircle(50, 170, 50, #dfcca1);//call for drawCircle
  drawCross(400, 420, 10, PI/6, #22fcfa);//call for drawCross
}

void drawHeader() {
  //Header: Tic Tac Toe
  textSize(70);//set text size as 70
  textAlign(CENTER);//let text be in center
  fill(#d111ff);//set text's color
  text("Tic Tac Toe ", 240, 120);//call for text in display
}

void drawButton(int x, int y, color c, String s) {
  // button of human vs human option
  noFill();//make it not fill color
  strokeWeight(7);//set stroke weight as 7
  stroke(c);//set the color of stroke
  rect(x, y, 200, 50);//make rectangle

  PFont font;//declare
  font = loadFont("data/Arial-BoldMT-48.vlw");//inilizate
  textFont(font);//set textfont
  textSize(20);//set text size as 20
  fill(#000000);//set text color
  text(s, 240, y+ 30);//call for text in display
}

void drawCross(int x, int y, int size, float angle, color c) {
  stroke(c);//set the color of stroke
  pushMatrix();//push out cross to do following action
  translate(x, y);//make translation for cross
  rotate(angle);//rotate the cross
  line(-size, -size, +size, +size);//use line to make cross
  line(-size, +size, +size, -size);//use line to make cross

  popMatrix();//pop cross back to new position
}

void drawCircle(int x, int y, int size, color c) {

  noFill();//make it not fill color
  stroke(c);//set the color of stroke
  strokeWeight(5);//set stroke weight as 5
  ellipse(x, y, size, size);//make a circle
}

void drawInGameScene() {
  background(#fff5cc);//set the background color for in game 
  stroke(#000000);//set the color of stroke in game
  line(0, 0, 480, 0);//make line to draw grid
  line(0, 160, 480, 160);//make line to draw grid
  line(0, 320, 480, 320);//make line to draw grid
  line(0, 480, 480, 480);//make line to draw grid
  line(160, 0, 160, 480);//make line to draw grid
  line(320, 0, 320, 480);//make line to draw grid
  fill(255, 0, 0);//set text color for player 1 as red
  textSize(25);//set text size for player 1 as 25
  text("Player 1:", 60, 520);//call text for player 1 in display
  fill(0, 0, 255);//set text color for player 2 as blue
  text("Player 2:", 350, 520);//call text for player 2 in display
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
    strokeWeight(7);//set stroke weight as 7
    if (mouseY<=480) {
      if (board[int(mouseX/160)][int(mouseY/160)]==0) {
        board[int(mouseX/160)][int(mouseY/160)] = playerTurn;
        drawBoard(playerTurn, int(mouseX/160), int(mouseY/160));//call drawBoard to draw cross and circle in game
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
    drawCross(x*160+80, y*160+80, 45, 0, #ff0000);//draw the cross in the game
  } else {
    drawCircle(x*160+80, y*160+80, 100, #0000ff);//draw the circle in the game
  }
}
void clearBoard() {
  board = new int[3][3];
}