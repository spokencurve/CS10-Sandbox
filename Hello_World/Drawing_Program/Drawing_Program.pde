// Global Variables


void setup(){
  size (500, 500);
  colorChangeSetup();
  quitButtonSetup();
}

void draw(){
  quitButtonDraw();
  colorChangeDraw();
  //background();
  //drawing code
  stroke(255, 0, 0);
  strokeWeight(4);
  smooth();
  // Draw if mouse is pressed
  if (mousePressed) {
  line(pmouseX, pmouseY, mouseX, mouseY);
 }
}
 



void mousePressed(){
  quitButtonMouseClicked();
  //bolean to activate drawing code
}

//void keyPressed(){}
