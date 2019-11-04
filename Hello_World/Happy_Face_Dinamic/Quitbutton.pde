//Global Variables
String title= "X";
PFont quitButtonFont;
color purple = #C703FF;// ink
color purpleQuitButton = #F3A6FC;
color yellowQuitButton = #BCDE00;

void quitButtonRect() {
  rect(width*19/20, height*0, width*1/20, height*1/20);// Quit Button
}

void quitButtonSetup() {
  quitButtonFont = createFont ("Harrington", 55); 
  quitButtonRect();
}

void quitButtonDraw(){
  //Hover Over
    if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*0 && mouseY <= height*1/20) {
    fill(yellowQuitButton);
    quitButtonRect();
  } else {
    fill(purpleQuitButton);
    quitButtonRect();
  }
  
  
  //Text In Quit Button
  fill(purple); 
  textAlign (CENTER, CENTER);
  textFont(quitButtonFont, 21);
  text(title, width*19/20, height*0, width*1/20, height*1/20);
  fill(255); //reset default
}

void quitButtonMouseClicked(){
 // Quit Button
  if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*0 && mouseY <= height*1/20) {
    exit();
  }
}
