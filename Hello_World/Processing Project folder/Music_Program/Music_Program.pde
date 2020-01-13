// Music Program
/* Music Files
 Socialite_Mugshot.mp3
 Keys.mp3
 Jukebox.mp3
 Ghost_Walk.mp3
 */
/* Sound Effects
 Wood_Door_Open_and_Close_Series.mp3
 The_Simplest_Sting.mp3
 Car_Door_Closing.mp3
 Leg_Bone_Break.mp3
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables
Minim minim;
int numberOfSongs = 4;
int numberOfSoundEffects = 1;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioPlayer[] soundEffect = new AudioPlayer[numberOfSoundEffects];
int currentSong = numberOfSongs - numberOfSongs;
int currentSoundEffects = numberOfSoundEffects - numberOfSoundEffects;


void setup() {
  
  size( 700 , 600 );
  minim = new Minim(this);
  

  song[0] = minim.loadFile("Jukebox.mp3");
  song[1] = minim.loadFile("Keys.mp3");
  song[2] = minim.loadFile("Socialite_Mugshot.mp3");
  song[3] = minim.loadFile("Ghost_Walk.mp3");
  
  soundEffect[0] = minim.loadFile("Wood_Door_Open_and_Close_Series.mp3");



  //Instructions
  println("Start of Console");
  println("Click the Canvas to Finish Starting this program");
  println("Press P to Play and Pause, will rewind when at the end");
  println("Press S to Stop and rewind to the beginning");
  println("Press L to loop the song");
}

void draw(){
  // GUI of Drawing Program
  
  // Rectangles
  fill(#000000);
  rect( width*0/6 , height*5/6 , width*6/6, width*5/6);
  
  
  //Ellipses
  fill(255);
  ellipse( width*3/6, height*5.5/6, 100, 100);
  fill(#FC0000);
  ellipse( width*.5/6, height*5.5/6, 50, 50);
  
  
  
  // Triangles
  fill(#FC0000);
  triangle( width*2.8/6 , height*5.25/6 , width*2.8/6 , height*5.75/6 , width*3.25/6 , height*5.5/6);
  triangle( width*1.8/6 , height*5.5/6 , width*2.4/6 , height*5.25/6 , width*2.4/6 , height*5.75/6);
  triangle( width*4.2/6 , height*5.5/6 , width*3.6/6 , height*5.25/6, width*3.6/6 , height*5.75/6);
 
}

void mouseReleased() {
  if ( mouseX>width*2.8/6  && mouseX<width*2.8/6+width*2.8/6+width*3.25/6  && mouseY>height*5.25/6 && mouseY<height*5.25/6+height*5.75/6+height*5.5/6 ) {
       song[currentSong].play(); }
      else if (song[currentSong].isPlaying() ) {
        song[currentSong].pause();
      }
     }

 



void keyPressed() {

  if (key == 'n' || key == 'N') {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - 1) {
        currentSong = currentSong - (numberOfSongs - 1);
        song[currentSong].play();
      } else {
        currentSong = currentSong +1;
        song[currentSong].play();
      }
    } else {
      currentSong = currentSong +1;
      println(currentSong);
    }
  } 
  //
  if (key == 'b' || key == 'B') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs - 1;
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
      }
      println(currentSong);
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs - 1;
      } else {
        currentSong -= 1;
      }
      println(currentSong);
    }
  } 
    //
     if (key == 'p' || key == 'P') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
     }
    //
      if (key == 'q' || key == 'Q') {
        soundEffect[0].play();
        soundEffect[0].rewind();
        delay(2800);
        exit();
}

}
