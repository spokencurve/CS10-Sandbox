/*void metaDataSetup() {
  

  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
   minim.loadFile("groove.mp3");
  currentSongMetaData = song[currentSong].getMetaData(); //reads song meta 1, like song 1, mimicing array notation

  println("Start of Console");
  println("Click the Console to Finish Starting this program");
  println("Press P to Play and Pause");

  textFont(createFont("Serif", 12)); //simple text starting code, refer to how text is usually started, uses default font already installed
  
  //For Prototyping, print all information to the console first
  //Verifying Meta Data
  println( "File Name: ", currentSongMetaData.fileName() );
  println( "Length (in milliseconds): ", currentSongMetaData.length() );
  println( "Length (in seconds): ", currentSongMetaData.length()/1000 );
  println( "Length (in minutes & seconds): ", (currentSongMetaData.length()/1000)/60, " minute", (currentSongMetaData.length()/1000)-((currentSongMetaData.length()/1000)/60 * 60), " seconds" );
  println( "Title: ", currentSongMetaData.title() );
  println( "Author: ", currentSongMetaData.author() ); //Song Writer or Performer
  println( "Composer: ", currentSongMetaData.composer() ); //Song Writer
  println( "Orchestra: ", currentSongMetaData.orchestra() );
  println( "Album: ", currentSongMetaData.album() );
  println( "Disk: ", currentSongMetaData.disc() );
  println( "Publisher: ", currentSongMetaData.publisher() );
  println( "Date Release: ", currentSongMetaData.date() );
  println( "Copyright: ", currentSongMetaData.copyright() );
  println( "Comment: ", currentSongMetaData.comment() );
  println( "Lyrics: ", currentSongMetaData.lyrics() );
  println( "Track: ", currentSongMetaData.track() );
  println( "Genre: ", currentSongMetaData.genre() );
  println( "Encoded: ", currentSongMetaData.encoded() ); //how a computer reads the file
}

void metaDataDraw() {
  background(0);
  int yi = 15;
  int ys = 25, y = ys; //Two Variables
  text("File Name: " + currentSongMetaData.fileName(), 5, y);
  text("Length (in milliseconds): " + currentSongMetaData.length(), 5, y+=yi);
  text("Title: " + currentSongMetaData.title(), 5, y+=yi);
  text("Author: " + currentSongMetaData.author(), 5, y+=yi); 
  text("Album: " + currentSongMetaData.album(), 5, y+=yi);
  text("Date: " + currentSongMetaData.date(), 5, y+=yi);
  text("Comment: " + currentSongMetaData.comment(), 5, y+=yi);
  text("Lyrics: " + currentSongMetaData.lyrics(), 5, y+=yi ); 
  text("Track: " + currentSongMetaData.track(), 5, y+=yi);
  text("Genre: " + currentSongMetaData.genre(), 5, y+=yi);
  text("Copyright: " + currentSongMetaData.copyright(), 5, y+=yi);
  text("Disc: " + currentSongMetaData.disc(), 5, y+=yi);
  text("Composer: " + currentSongMetaData.composer(), 5, y+=yi);
  text("Orchestra: " + currentSongMetaData.orchestra(), 5, y+=yi);
  text("Publisher: " + currentSongMetaData.publisher(), 5, y+=yi);
  text("Encoded: " + currentSongMetaData.encoded(), 5, y+=yi);
  
}*/
