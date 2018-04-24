/****************************************************************************************/
/*Name: Xuanyu Dong Junjie Lin*/
/*Email: xuanyudo@buffalo.edu junjieli@buffalo.edu*/
/*Course: CSE113 A_5 */
/*Date Started: 04/10/2018 */
/*Project: build tic tac toe game*/
/*Date Completed: */
/*****************************************************************************************/



void setup(){
  size(480,540);
  startScene();
  mousePressed();
}

void startScene(){
  drawHeader(); // draw Header text of tic tac toe
  drawButton(140,180,#000000,"Human VS Human"); // button of human vs human option
  drawButton(140,270,#000000,"Human VS AI Easy"); // button of human vs AI easy option
  drawButton(140,360,#000000,"Human VS AI Hard"); // button of human vs AI hard option
  drawCircle(50,170,50);
  drawCross(400,420,10,PI/6);
}

void drawHeader(){
  //Header: Tic Tac Toe
  textSize(70);
  textAlign(CENTER);
  text("Tic Tac Toe ", 240,120);
  
}

void drawButton(int x,int y,color c,String s){
  // button of human vs human option
  noFill();
  strokeWeight(7);
  stroke(c);
  rect(x,y,200,50);
  
  PFont font;
  font = loadFont("data/Arial-BoldMT-48.vlw");
  textFont(font);
  textSize(20);
  fill(#000000);
  text(s,240,y+ 30);
    
}

void drawCross(int x, int y, int size, float angle){
  pushMatrix();
  translate(x,y);
  rotate(angle);
  line(-size,-size,+size,+size);
  line(-size,+size,+size,-size);
  
  popMatrix();
}

void drawCircle(int x,int y, int size){
  
  noFill();
  strokeWeight(5);
  ellipse(x,y,size,size);
}

void drawInGameScene(){
  background(255,255,255);
  line(0,0,480,0);
  line(0,160,480,160);
  line(0,320,480,320);
  line(0,480,480,480);
  line(160,0,160,480);
  line(320,0,320,480);
  fill(255,0,0);
  textSize(25);
  text("Player 1:",60,520);
  fill(0,0,255);
  text("Player 2:",350,520);
  

}

void draw(){
  
  
}

void mousePressed(){
  if((mouseX>=140)&&(mouseX<=340)&&(mouseY>=180)&&(mouseY<=230)){
     drawInGameScene();
  }
  else if((mouseX>=140)&&(mouseX<=340)&&(mouseY>=270)&&(mouseY<=320)){
     drawInGameScene();
  }
  else if((mouseX>=140)&&(mouseX<=340)&&(mouseY>=360)&&(mouseY<=410)){
     drawInGameScene();
  }
}