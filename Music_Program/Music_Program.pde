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
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables
Minim minim;
BeatDetect heart = new BeatDetect();
AudioPlayer jingle;
FFT         fft;
int loopNum = 1; //Able to connect this variable to buttons, increasing the loop number
float angle = 0;

int numberOfSong = 4;
AudioPlayer[] song = new AudioPlayer[numberOfSong];
int currentSong = numberOfSong - numberOfSong;


void setup() {
  minim = new Minim(this);
  
  song[1] = minim.loadFile("Jukebox.mp3");
  song[2] = minim.loadFile("Keys.mp3");
  song[3] = minim.loadFile("Socialite_Mugshot.mp3");
  song[4] = minim.loadFile("Ghost_Walk.mp3");
  
  
  // beat visualizer
  size(512, 200, P3D);
  song[currentSong].loop();
  fft = new FFT( song[currentSong].bufferSize(), song[currentSong].sampleRate() );
  
  //Instructions
  println("Start of Console");
  println("Click the Canvas to Finish Starting this program");
  println("Press P to Play and Pause, will rewind when at the end");
  println("Press S to Stop and rewind to the beginning");
  println("Press L to loop the song");
  
  /*Verifying Meta Data
  println( "File Name: ", songMetaData[currentSong].fileName() );
  println( "Length (in milliseconds): ", songMetaData[currentSong].length() );
  println( "Length (in seconds): ", songMetaData1.length()/1000 );
  println( "Title: ", songMetaData1.title() );
  println( "Author: ", songMetaData1.author() ); //Song Writer or Performer
  println( "Composer: ", songMetaData1.composer() ); //Song Writer
  println( "Orchestra: ", songMetaData1.orchestra() );
  println( "Album: ", songMetaData1.album() );
  println( "Disk: ", songMetaData1.disc() );
  println( "Publisher: ", songMetaData1.publisher() );
  println( "Date Release: ", songMetaData1.date() );
  println( "Copyright: ", songMetaData1.copyright() );
  println( "Comment: ", songMetaData1.comment() );
  println( "Lyrics: ", songMetaData1.lyrics() );
  println( "Track: ", songMetaData1.track() );
  println( "Genre: ", songMetaData1.genre() );
  println( "Encoded: ", songMetaData1.encoded() ); //how a computer reads the file
  */
}

void draw()
{
  background(0);
  fft.forward(song[currentSong].mix);
  stroke(255);
  
  for(int i = 0; i < song[currentSong].left.size() - 1; i++){
  angle = radians(i*360/511);
  point(width/2 + 150*cos(angle)*(1 - 2*song[currentSong].left.get(i)), height/2 + 150*sin(angle)*(1 - 2*song[currentSong].left.get(i)));
  fill(255);
  ellipse(width*3/6, height*4/5, 100, 100);
}
}

void mousePressed() {
}


void keyPressed() {
  
  if(key == 'n' || key == 'N') {
    if(song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
        if ( currentSong == numberOfSong - 1) {
          currentSong = currentSong - (numberOfSong - 1);
          song[currentSong].play();
        }
          else {
          currentSong = currentSong +1;
          song[currentSong].play();
  }
     
    } else {
        currentSong = currentSong +1;
        println(currentSong);
    }
  } 
  //
  if(key == 'B' || key == 'B') {
    if( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind
        if ( currentSong == numberOfSong + 1) {
          currentSong = currenong + (numberOfSong + 1);
          song[currentSong].play();
  }
    else {
      currentSong = currentSong - 1;
      song[currentSong].play();
    }
    } else {
        currentSong = currentsong - 1;
        println(currentSong);
  //
  if ( key == 'p' || key == 'P' ) { //Caps lock can be on
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
  if (key == 's' || key == 'S') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else { //Song is not Playing
      song[currentSong].rewind();
    }
  }
  //
  if( key == 'l' || key == 'L' ) song[currentSong].loop(loopNum);//Single line IF
  //"L" Automatically loops the song, and starts playing from the beginning
  //
  if ( key == 'f' || key == 'F') song[currentSong].skip(1000); // skip forward 1 second (1000 milliseconds), single IF Line
  if ( key == 'r' || key == 'R') song[currentSong].skip(-1000); // skip backward 1 second (1000 milliseconds), single IF Line
  //
  // Debugging for 
  println( "\nSong Position: ", "\t\t\t\t", song[currentSong].position(), "milliseconds" );
  println( "Song Position:", (song[currentSong].position()/1000)/60, "minutes\t", (song[currentSong].position()/1000)-((song[currentSong].position()/1000)/60 * 60), "seconds" );
  //
  if ( key == 'p' || key == 'P' ) { //Caps lock can be on
      if ( song[currentSong].isPlaying() ) {
        song[currentSong].pause();
    }     else if ( song[currentSong].position() == song[currentSong].length() ) {
          song[currentSong].rewind();
          song[currentSong].play();
    }       else {
            song[currentSong].play();
    }
  }
  //
  if (key == 's' || key == 'S') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else { //Song is not Playing
      song[currentSong].rewind();
    }
  }
  //
  if( key == 'l' || key == 'L' ) song[currentSong].loop(loopNum);//Single line IF
  //"L" Automatically loops the song, and starts playing from the beginning
  //
  if ( key == 'f' || key == 'F') song[currentSong].skip(1000); // skip forward 1 second (1000 milliseconds), single IF Line
  if ( key == 'r' || key == 'R') song[currentSong].skip(-1000); // skip backward 1 second (1000 milliseconds), single IF Line
  //
  // Debugging for 
  println( "\nSong Position: ", "\t\t\t\t", song[currentSong].position(), "milliseconds" );
  println( "Song Position:", (song[currentSong].position()/1000)/60, "minutes\t", (song[currentSong].position()/1000)-((song[currentSong].position()/1000)/60 * 60), "seconds" );
  //
}
