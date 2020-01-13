// Global Variables
String title= "Reset";
PFont resetButtonFont;
color purpleResetButton = #F3A6FC;
color yellowResetButton = #BCDE00;

void resetButtonRect() {
  rect(width*2/6, height*5.5/6, width*2/6, height*5.5/6);
}

void quitButtonSetup() {
  resetButtonFont = createFont ("Magneto Bold", 55); 
  resetButtonRect();
}

void resetButtonDraw(){
  //Hover Over
    if (mouseX >= width*2/6  && mouseX <= width*2/6+width*2/6 && mouseY >= height*5.5/6 && mouseY <= height*5/6+height*5.5/6) {
    fill(yellowResetButton);
    resetButtonRect();
  } else {
    fill(purpleResetButton);
    resetButtonRect();
  }
  
  
  //Text In Quit Button
  fill(black); 
  textAlign (CENTER, TOP);
  textFont(resetButtonFont, 35);
  text(title, width*2/6, height*5.5/6, width*2/6, height*5.5/6);
  fill(255); //reset default
}

void resetButtonMouseClicked(){
 // Quit Button
  if (mouseX >= width*2/6  && mouseX <= width*2/6+width*2/6 && mouseY >= height*5.5/6 && mouseY <= height*5/6+height*5.5/6) {
    turnOnPurple = false; 
    turnOnPink = false; 
    turnOnGreen = false; 
    turnOnBlue = false;
  }
}
