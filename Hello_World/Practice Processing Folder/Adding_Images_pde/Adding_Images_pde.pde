// Basic code

//global variables
PImage pic0;
PImage pic1;

void setup() {
  size(500, 500);
  quitButtonSetup();
  pic0 = loadImage("Cool Toad.jpg"); //Dimensions: width 276px height 183px
  pic1 = loadImage("Cool Frog.jpg"); //Dimensions: width 1900px  height 1068px
  
  rect(width*1/4, height*0/16, width*0.552, height*0.305);
  image(pic0, width*1/4, height*0/16, width*0.552, height*0.305);
 
  rect(width*1/4, height*6/16, width*0.552, height*0.305);
  image(pic1, width*1/4, height*6/16, width*0.552, height*0.305);
}

void draw() {
  quitButtonDraw();
}

void mousePressed() {
  quitButtonMouseClicked();
}
