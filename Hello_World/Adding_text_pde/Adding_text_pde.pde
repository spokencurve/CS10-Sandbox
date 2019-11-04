// Adding text
size(500, 600);
String title= "Google";
PFont titleFont;
println("Start of Console");
String[] frontList = PFont.list();// Lists all fonts avalible on system
printArray(frontList); // FOR LISTING ALL POSSIBLE FONTS
titleFont = createFont ("Magneto Bold", 55); 
color purple = #C703FF;

rect(width*1/4, height*0, width*1/2, height*1/10);
fill(purple); 
textAlign (CENTER, CENTER);
textFont(titleFont, 39);
text(title, width*1/4, height*0, width*1/2, height*1/10);
fill(255); //reset default
