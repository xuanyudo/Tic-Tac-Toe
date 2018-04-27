/****************************************************************************************/
/*Name: Xuanyu Dong Junjie Lin*/
/*Email: xuanyudo@buffalo.edu junjieli@buffalo.edu*/
/*Course: CSE113 A_5 */
/*Date Started: 04/10/2018 */
/*Project: build tic tac toe game*/
/*Date Completed: */
/*****************************************************************************************/

boolean ingame = false;
boolean popUp = false;
PImage background;
int[][] board;
int playerTurn;
int counter=0;
int AI = 0;
String[] playerTiles;
String[] winPattern = {"048", "246", "012", "345", "678", "036", "147", "258"};
/*
-------
 |0 1 2|
 |3 4 5|
 |6 7 8|
 -------
 */
void setup() {
  size(480, 540);
  board = new int[3][3];
  playerTiles = new String[2];
  playerTiles[0]="";
  playerTiles[1]="";

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
  fill(#FA8B30);
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
  drawCross(150, 510, 10, 0, #ff0000);
  fill(0, 0, 255);
  text("Player 2:", 300, 520);

  drawCircle(390, 510, 25, #0000ff);
}

void draw() {
  if (popUp ==true) {
    textAlign(CENTER);
    if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=210)&&(mouseY<=260)) {
      drawButton(140, 210, #000ff0, "Play Again");
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=275)&&(mouseY<=325)) {
      drawButton(140, 275, #000ff0, "Menu");
    } else {
      drawButton(140, 210, #000000, "Play Again");
      drawButton(140, 275, #000000, "Menu");
    }
  } else if (ingame==false) {
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
  if (popUp==true) {
    if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=210)&&(mouseY<=260)) {
      ingame = true;  
      clearBoard();
      popUp =false;
      drawInGameScene();
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=275)&&(mouseY<=325)) {
      ingame = false;  
      clearBoard();
      popUp =false;
      startScene();
    }
  } else if (ingame ==false) {
    if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=180)&&(mouseY<=230)) {
      ingame = true;  
      drawInGameScene();
      AI = 0;
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=270)&&(mouseY<=320)) {
      ingame = true;
      drawInGameScene();
      AI = 1;
    } else if ((mouseX>=140)&&(mouseX<=340)&&(mouseY>=360)&&(mouseY<=410)) {
      ingame = true;
      drawInGameScene();
      AI = 2;
    }
  } else {
    strokeWeight(7);

    if (mouseY<=480) {
      if (board[int(mouseX/160)][int(mouseY/160)]==0) {
        board[int(mouseX/160)][int(mouseY/160)] = playerTurn;
        drawBoard(playerTurn, int(mouseX/160), int(mouseY/160));
        if (playerTiles[playerTurn-1]!=null) {
          playerTiles[playerTurn-1]+=(int(mouseX/160)+int(mouseY/160)*3);
        } else {
          playerTiles[playerTurn-1]= str(int(mouseX/160)+int(mouseY/160)*3);
        }
        counter++;
        boolean win = this.checkWin(playerTurn-1);

        if (win) {
          //ingame = false;
          popUp = true;
          drawPopUp("Player "+ str(playerTurn) + " win!");
          //clearBoard();
          //startScene();
        } else if (counter==9) {
          popUp = true;
          drawPopUp("Nobody Win...");
        }
        if (playerTurn==1) {
          playerTurn = 2;
        } else {
          playerTurn = 1;
        }
        if (AI == 1) {
          AIPlace();
        } else if (AI == 2) {
          AIHard();
        }
      }
    }
  }
}
void AIPlace() {
  if (ingame!=false && popUp !=true) {  
    int x = int(random(3));
    int y = int(random(3));
    if (board[x][y]!=0) {
      AIPlace();
    } else {
      board[x][y] = playerTurn;
      drawBoard(playerTurn, x, y);
      if (playerTiles[playerTurn-1]!=null) {
        playerTiles[playerTurn-1]+=(x+y*3);
      } else {
        playerTiles[playerTurn-1]= str(x+y*3);
      }
      counter++;
      boolean win = this.checkWin(playerTurn-1);

      if (win) {
        //ingame = false;
        popUp = true;
        drawPopUp("Player "+ str(playerTurn) + " win!");
        //clearBoard();
        //startScene();
      } else if (counter==9) {
        popUp = true;
        drawPopUp("Nobody Win...");
      }
      if (playerTurn==1) {
        playerTurn = 2;
      } else {
        playerTurn = 1;
      }
    }
  }
}
void AIHard() {
  if (ingame!=false && popUp !=true) {
    int x = 0;
    int y = 0;
    if (board[1][1]==0) {
      x = 1;
      y = 1;
    } else {
      String defense = findClosestStep(0);
      String offense = findClosestStep(1);
      print("\n"+defense);
      print("\n"+offense);
      if (offense.length()==1) {
        y = int((int(offense))/3);
        x = (int(offense))%3;
        print("offense :"+offense);
        print("\n"+ x+ "  "+ y );
      } else {
        boolean posTaken = true;
        for (int z = 0; z<defense.length();z++){
          if(!playerTiles[0].contains(""+defense.charAt(z)) && !playerTiles[1].contains(""+defense.charAt(z)) ){
            posTaken = false;
          }
        }
        if (posTaken) {
          for(int i =0;i<3;i++){
            for(int j = 0;j<3;j++){
              if (board[i][j]==0){
                x = i;
                j = y;
              }
            }
          }
          
        } else {
          for (int i = 0; i<defense.length(); i++) {
            if (!playerTiles[0].contains(""+defense.charAt(i))&&!playerTiles[1].contains(""+defense.charAt(i))) {
              y = int((int(""+defense.charAt(i)))/3);
              x = (int(""+defense.charAt(i)))%3;
              //print("defense: "+ defense);
              print("\n"+ x+ "  "+ y );
            }
          }
        }
      }
    }
    print("\n"+ x+ "  "+ y );
    board[x][y] = playerTurn;
    drawBoard(playerTurn, x, y);
    if (playerTiles[playerTurn-1]!=null) {
      playerTiles[playerTurn-1]+=(x+y*3);
    } else {
      playerTiles[playerTurn-1]= str(x+y*3);
    }
    counter++;
    boolean win = this.checkWin(playerTurn-1);

    if (win) {
      //ingame = false;
      popUp = true;
      drawPopUp("Player "+ str(playerTurn) + " win!");
      //clearBoard();
      //startScene();
    } else if (counter==9) {
      popUp = true;
      drawPopUp("Nobody Win...");
    }
    if (playerTurn==1) {
      playerTurn = 2;
    } else {
      playerTurn = 1;
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
void drawPopUp(String message) {
  noStroke();
  fill(#ffffff, 80);
  rect(0, 0, 480, 540);
  stroke(#000000);
  strokeWeight(2);
  fill(#ffffff, 165);
  rect(120, 140, 240, 200);
  if (playerTurn == 1) {
    fill(#ff0000);
  } else {
    fill(#0000ff);
  }
  text(message, 240, 190);
}

String findClosestStep(int player) {
  String s = "";
  int longest = -1;
  for (String s1 : winPattern) {
    int temp=0;
    String ret ="";
    for (int i=0; i<s1.length(); i++) {
      if (playerTiles[player].contains(""+s1.charAt(i))) { 
        temp++;
      } else {
        ret = ""+s1.charAt(i);
      }
    }
    if (temp==2) {
      if (!playerTiles[0].contains(ret) && !playerTiles[1].contains(ret)) {  
        return ret;
      } else if (board[int(int(ret)/3)][int(int(ret)%3)]!=0) {
        temp =-1;
        
      } else {
        temp = -1;
        
      }
    } else if (temp>longest) {
      longest = temp;
      s = s1;
    }
  }
  return s;
}
boolean checkWin(int player) {
  boolean win = true;
  for (String s : winPattern) {
    win = true;
    for (int i=0; i<s.length(); i++) {
      if (!playerTiles[player].contains(""+s.charAt(i))) {
        win = false;
        break;
      }
    }
    if (win == true) {
      return win;
    }
  }
  return false;
}

void clearBoard() {
  playerTurn = 1;
  counter=0;
  board = new int[3][3];
  playerTiles[0]="";
  playerTiles[1]="";
}