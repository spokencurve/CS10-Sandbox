String resettitle= "Reset";
PFont resetButtonFont;

void resetButtonRect() {
  rect(width*3/4,height*4/5,width*4/4,height*1/5);// Quit Button
}

void resetButtonSetup() {
  resetButtonFont = createFont ("Magneto Bold", 55); 
  resetButtonRect();
}

void resetButtonDraw(){
  //Hover Over
    if (mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*4/5 && mouseY<height*4/5+height*1/5) {
    fill(red);
    resetButtonRect();
  } else {
    fill(255);
    resetButtonRect();
  }
  
  
  //Text In Quit Button
  fill(black); 
  textAlign (CENTER, CENTER);
  textFont(resetButtonFont, 21);
  text(title, width*3/4, height*4/5, width*1/4, height*1/5);
  fill(255); //reset default
}

void resetButtonMouseClicked(){
 // Quit Button
  if (mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*4/5 && mouseY<height*4/5+height*1/5) {
    rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
    println("dang");
  }
}
