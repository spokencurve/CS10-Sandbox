// Happy Face Static
size(500, 500);
// head - Big Circle 
strokeWeight(5);
ellipse(width*1/2, height*1/2, width*0.7, height*0.7);

//Eye Brows
strokeWeight(10);
line(width*0.3, height*0.3, 200, 150);
line(300, 150, 350, 150);

//pupils

// Eyes - Small Cricles, ovals
strokeWeight(3);
ellipse(175, 200, 75, 75);
ellipse(325, 200, 75, 75); 
// Nose - line
line(250, 225, 220, 300);
line(300, 275, 220, 300);

// Mouth - Curved line
strokeWeight(4);
arc(220, 325, 70, 70, HALF_PI, PI);
arc(275, 325, 70, 70, 0, HALF_PI);
line(220, 360, 275, 360);

// Optinal: Ears,
