//Global variables
static final int NONE = 0;
PGraphics canvas;
PShape rectangle;
int myDrawMode = NONE;
float drawingSurfaceX, drawingSurfaceY,
      drawingSurfaceWidth,
      drawingSurfaceHeight;
float drawingDiameter;
color      black = #000000,
           purple = #DC00FF,
           red = #ED0000,
           blue = #0035FF,
           orange = #FF6200,
           green = #6FD335,
           brown = #713106,
           yellow = #FFF812,
           gray = #D1CCCC;
color ink;           
      




void setup() {
  size(500, 600);
  smooth();
  canvas = createGraphics(width, height, JAVA2D);
  canvas.beginDraw();
  canvas.smooth();
  canvas.endDraw();
//
rectangle = createShape(RECT, 200, 200, 200, 200);
rectangle.setStroke(color(255));
rectangle.setStrokeWeight(4);
rectangle.setFill(color(127));
ink = black; //startup ink color 
drawingSurfaceX = width*0;
  drawingSurfaceY = height*0;
  drawingSurfaceWidth = width*3/4;
  drawingSurfaceHeight = height*4/5;
   rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
quitButtonSetup();
resetButtonSetup();
}
void draw() {
        
        //
        
        noStroke();
        for (int i = 0; i < 10; i++) {
                fill(i * 25);
                image(canvas, 0, 0);
        }
        
        fill(black);
        rect(width*3/4,height*0,width*4/4,height*.5/5);
        fill(purple);
        rect(width*3/4,height*.5/5,width*4/4,height*.5/5);
        fill(red);
        rect(width*3/4,height*1/5,width*4/4,height*.5/5);
        fill(blue);
        rect(width*3/4,height*1.5/5,width*4/4,height*.5/5);
        fill(green);
        rect(width*3/4,height*2/5,width*4/4,height*.5/5);
        fill(orange);
        rect(width*3/4,height*2.5/5,width*4/4,height*.5/5);
        fill(brown);
        rect(width*3/4,height*3/5,width*4/4,height*.5/5);
        fill(yellow);
        rect(width*3/4,height*3.5/5,width*4/4,height*.5/5);
        fill(gray);
        rect(width*0/4,height*4/5, width*4/4, height*1/5);
        fill(255);
        rect(width*3/4,height*4/5,width*4/4,height*1/5);
        quitButtonDraw();
        //
        fill(black);
        ellipse(width*.25/4, height*4.5/5, 20, 20);
        ellipse(width*.65/4, height*4.5/5, 30, 30);
        ellipse(width*1.15/4, height*4.5/5, 50, 50);
        ellipse(width*1.80/4, height*4.5/5, 70, 70);
        ellipse(width*2.60/4, height*4.5/5, 90, 90);
        //Drawing suface
        resetButtonDraw();
        
 
}
void mouseDragged() {
        if (mouseButton == LEFT) {
                drawFunction();
        } else {
                noFill();
                stroke(255);
                ellipse(mouseX, mouseY, 50, 50);
                eraseFunction();
        }
}
void drawFunction() {
        canvas.beginDraw();
        canvas.noStroke();
        canvas.fill(ink);
        canvas.ellipse(mouseX, mouseY, 20, 20);
        canvas.endDraw();
}
void eraseFunction() {
        canvas.beginDraw();
        canvas.noStroke();
        canvas.fill(255);
        canvas.ellipse(mouseX, mouseY, 50, 50);
        canvas.endDraw();

}
        
void mousePressed() {
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*0/5 && mouseY<height*0/5+height*.5/5) {
    println("drawing surface");
    ink = black; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*.5/5 && mouseY<height*.5+height*.5/5) {
    println("drawing surface");
    ink = purple; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*1/5 && mouseY<height*1/5+height*.5/5) {
    println("drawing surface");
    ink = red; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*1.5/5 && mouseY<height*1.5/5+height*.5/5) {
    println("drawing surface");
    ink = blue; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*2/5 && mouseY<height*2/5+height*.5/5) {
    println("drawing surface");
    ink = green; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*2.5/5 && mouseY<height*2.5/5+height*.5/5) {
    println("drawing surface");
    ink = orange; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*3/5 && mouseY<height*3/5+height*.5/5) {
    println("drawing surface");
    ink = brown; // example to change ink
    }
    if ( mouseX>width*3/4  && mouseX<width*3/4+width*4/4  && mouseY>height*3.5/5 && mouseY<height*3.5/5+height*.5/5) {
    println("drawing surface");
    ink = yellow; // example to change ink
    }
    quitButtonMouseClicked();
    resetButtonMouseClicked();
    
}
