import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
FFT fft;


float specLow = 0.3; // 3%
float specMid = 0.125; // 12.5%
float specHi = 0.20; // 20%


float scoreLow = 0;
float scoreMid = 0;
float scoreHi = 0;


float oldScoreLow = scoreLow;
float oldScoreMid = scoreMid;
float oldScoreHi = scoreHi;


float scoreDecreaseRate = 25;


int nbCubes;
Cube[] cubes;


int nbMurs = 500;
Mur[] murs;

int numberOfSongs = 4;
int numberOfSoundEffects = 1;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioPlayer[] soundEffect = new AudioPlayer[numberOfSoundEffects];
int currentSong = numberOfSongs - numberOfSongs;
int currentSoundEffects = numberOfSoundEffects - numberOfSoundEffects;
AudioMetaData currentSongMetaData; //"Song Meta One"

void setup() {
    //Instructions
    println("Start of Console");
    println("Click the Canvas to Finish Starting this program");
    println("Press P to Play and Pause, will rewind when at the end");
    println("Press S to Stop and rewind to the beginning");
    println("Press L to loop the song");
    
    //metaDataSetup();

    fullScreen(P3D);


    minim = new Minim(this);


    song[0] = minim.loadFile("Jukebox.mp3");
    song[1] = minim.loadFile("Ghost_Walk.mp3");
    song[2] = minim.loadFile("Socialite_Mugshot.mp3");
    song[3] = minim.loadFile("Keys.mp3");


    fft = new FFT(song[currentSong].bufferSize(), song[currentSong].sampleRate());


    nbCubes = (int)(fft.specSize() * specHi);
    cubes = new Cube[nbCubes];


    murs = new Mur[nbMurs];


    for (int i = 0; i < nbCubes; i++) {
        cubes[i] = new Cube();
    }


    for (int i = 0; i < nbMurs; i += 4) {
        murs[i] = new Mur(0, height / 2, 10, height);
    }


    for (int i = 1; i < nbMurs; i += 4) {
        murs[i] = new Mur(width, height / 2, 10, height);
    }


    for (int i = 2; i < nbMurs; i += 4) {
        murs[i] = new Mur(width / 2, height, width, 10);
    }


    for (int i = 3; i < nbMurs; i += 4) {
        murs[i] = new Mur(width / 2, 0, width, 10);
    }

    background(0);


    song[currentSong].play(0);
}

void keyPressed() {

    /*if (key == 'n' || key == 'N') {
        if (song[currentSong].isPlaying()) {
            song[currentSong].pause();
            song[currentSong].rewind();
            if (currentSong == numberOfSongs - 1) {
                currentSong = currentSong - (numberOfSongs - 1);
                song[currentSong].play();
            } else {
                currentSong = currentSong + 1;
                song[currentSong].play();
            }
        } else {
            currentSong = currentSong + 1;
            println(currentSong);
        }
    }
    //
    if (key == 'b' || key == 'B') {
        if (song[currentSong].isPlaying()) {
            song[currentSong].pause();
            song[currentSong].rewind();
            if (currentSong == numberOfSongs - numberOfSongs) {
                currentSong = numberOfSongs - 1;
            } else {
                currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
            }
            println(currentSong);
            song[currentSong].play();
        } else {
            song[currentSong].rewind();
            if (currentSong == numberOfSongs - numberOfSongs) {
                currentSong = numberOfSongs - 1;
            } else {
                currentSong -= 1;
            }
            println(currentSong);
        }
    }
    //
    if (key == 'p' || key == 'P') {
        if (song[currentSong].isPlaying()) {
            song[currentSong].pause();
        } else if (song[currentSong].position() == song[currentSong].length()) {
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
    }*/

}

void draw() {

    //metaDataDraw();

    fft.forward(song[currentSong].mix);


    oldScoreLow = scoreLow;
    oldScoreMid = scoreMid;
    oldScoreHi = scoreHi;


    scoreLow = 0;
    scoreMid = 0;
    scoreHi = 0;


    for (int i = 0; i < fft.specSize() * specLow; i++) {
        scoreLow += fft.getBand(i);
    }

    for (int i = (int)(fft.specSize() * specLow); i < fft.specSize() * specMid; i++) {
        scoreMid += fft.getBand(i);
    }

    for (int i = (int)(fft.specSize() * specMid); i < fft.specSize() * specHi; i++) {
        scoreHi += fft.getBand(i);
    }


    if (oldScoreLow > scoreLow) {
        scoreLow = oldScoreLow - scoreDecreaseRate;
    }

    if (oldScoreMid > scoreMid) {
        scoreMid = oldScoreMid - scoreDecreaseRate;
    }

    if (oldScoreHi > scoreHi) {
        scoreHi = oldScoreHi - scoreDecreaseRate;
    }


    float scoreGlobal = 0.66 * scoreLow + 0.8 * scoreMid + 1 * scoreHi;


    background(scoreLow / 100, scoreMid / 100, scoreHi / 100);


    for (int i = 0; i < nbCubes; i++) {

        float bandValue = fft.getBand(i);


        cubes[i].display(scoreLow, scoreMid, scoreHi, bandValue, scoreGlobal);
    }


    float previousBandValue = fft.getBand(0);


    float dist = -25;


    float heightMult = 2;


    for (int i = 1; i < fft.specSize(); i++) {

        float bandValue = fft.getBand(i) * (1 + (i / 50));


        stroke(100 + scoreLow, 100 + scoreMid, 100 + scoreHi, 255 - i);
        strokeWeight(1 + (scoreGlobal / 100));


        line(0, height - (previousBandValue * heightMult), dist * (i - 1), 0, height - (bandValue * heightMult), dist * i);
        line((previousBandValue * heightMult), height, dist * (i - 1), (bandValue * heightMult), height, dist * i);
        line(0, height - (previousBandValue * heightMult), dist * (i - 1), (bandValue * heightMult), height, dist * i);


        line(0, (previousBandValue * heightMult), dist * (i - 1), 0, (bandValue * heightMult), dist * i);
        line((previousBandValue * heightMult), 0, dist * (i - 1), (bandValue * heightMult), 0, dist * i);
        line(0, (previousBandValue * heightMult), dist * (i - 1), (bandValue * heightMult), 0, dist * i);


        line(width, height - (previousBandValue * heightMult), dist * (i - 1), width, height - (bandValue * heightMult), dist * i);
        line(width - (previousBandValue * heightMult), height, dist * (i - 1), width - (bandValue * heightMult), height, dist * i);
        line(width, height - (previousBandValue * heightMult), dist * (i - 1), width - (bandValue * heightMult), height, dist * i);


        line(width, (previousBandValue * heightMult), dist * (i - 1), width, (bandValue * heightMult), dist * i);
        line(width - (previousBandValue * heightMult), 0, dist * (i - 1), width - (bandValue * heightMult), 0, dist * i);
        line(width, (previousBandValue * heightMult), dist * (i - 1), width - (bandValue * heightMult), 0, dist * i);


        previousBandValue = bandValue;
    }


    for (int i = 0; i < nbMurs; i++) {

        float intensity = fft.getBand(i % ((int)(fft.specSize() * specHi)));
        murs[i].display(scoreLow, scoreMid, scoreHi, intensity, scoreGlobal);
    }

    //GUI
    
    fill(#FC0000);
    ellipse(width * .5 / 6, height * 5.5 / 6, 50, 50);

    // Triangles
    fill(#FC0000);
    triangle(width * 2.9 / 6, height * 5.2 / 6, width * 2.9 / 6, height * 5.7 / 6, width * 3.25 / 6, height * 5.45 / 6);
    triangle(width * 2.1 / 6, height * 5.45 / 6, width * 2.4 / 6, height * 5.2 / 6, width * 2.4 / 6, height * 5.7 / 6);
    triangle(width * 3.9 / 6, height * 5.45 / 6, width * 3.6 / 6, height * 5.2 / 6, width * 3.6 / 6, height * 5.7 / 6);
}

void mouseReleased() {

    if (mouseX >= width * 2.9 / 6 && mouseX <= width * 2.9 / 6 + width * 2.9 / 6 + width * 3.25 / 6 && mouseY >= height * 5.2 / 6 && mouseY <= height * 5.2 / 6 + height * 5.7 / 6 + height * 5.45 / 6) {
        if (!song[currentSong].isPlaying())
            song[currentSong].play();
        
       
    }

    if (mouseX >= width * 2.1 / 6 && mouseX <= width * 2.1 / 6 + width * 2.4 / 6 + width * 2.4 / 6 && mouseY >= height * 5.45 / 6 && mouseY <= height * 5.45 / 6 + height * 5.2 / 6 + height * 5.7 / 6) {
        if (song[currentSong].isPlaying()) {
            song[currentSong].pause();
            song[currentSong].rewind();
            if (currentSong == numberOfSongs - numberOfSongs) {
                currentSong = numberOfSongs - 1;
            } else {
                currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
            }
            println(currentSong);
            song[currentSong].play();
        } else {
            song[currentSong].rewind();
            if (currentSong == numberOfSongs - numberOfSongs) {
                currentSong = numberOfSongs - 1;
            } else {
                currentSong -= 1;
            }
            println(currentSong);
        }
    }

    if (mouseX >= width * 3.9 / 6 && mouseX <= width * 3.6 / 6 + width * 3.6 / 6 && mouseY >= height * 5.45 / 6 && mouseY <= height * 5.2 / 6 + height * 5.7 / 6) {
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
    

}

class Cube {

    float startingZ = -10000;
    float maxZ = 1000;


    float x, y, z;
    float rotX, rotY, rotZ;
    float sumRotX, sumRotY, sumRotZ;


    Cube() {

        x = random(0, width);
        y = random(0, height);
        z = random(startingZ, maxZ);


        rotX = random(0, 1);
        rotY = random(0, 1);
        rotZ = random(0, 1);
    }

    void display(float scoreLow, float scoreMid, float scoreHi, float intensity, float scoreGlobal) {

        color displayColor = color(scoreLow * 0.67, scoreMid * 0.67, scoreHi * 0.67, intensity * 5);
        fill(displayColor, 255);


        color strokeColor = color(255, 150 - (20 * intensity));
        stroke(strokeColor);
        strokeWeight(1 + (scoreGlobal / 300));


        pushMatrix();


        translate(x, y, z);


        sumRotX += intensity * (rotX / 1000);
        sumRotY += intensity * (rotY / 1000);
        sumRotZ += intensity * (rotZ / 1000);


        rotateX(sumRotX);
        rotateY(sumRotY);
        rotateZ(sumRotZ);


        box(100 + (intensity / 2));


        popMatrix();


        z += (1 + (intensity / 5) + (pow((scoreGlobal / 150), 2)));


        if (z >= maxZ) {
            x = random(0, width);
            y = random(0, height);
            z = startingZ;
        }
    }
}



class Mur {

    float startingZ = -10000;
    float maxZ = 50;


    float x, y, z;
    float sizeX, sizeY;


    Mur(float x, float y, float sizeX, float sizeY) {

        this.x = x;
        this.y = y;

        this.z = random(startingZ, maxZ);


        this.sizeX = sizeX;
        this.sizeY = sizeY;
    }


    void display(float scoreLow, float scoreMid, float scoreHi, float intensity, float scoreGlobal) {


        color displayColor = color(scoreLow * 0.67, scoreMid * 0.67, scoreHi * 0.67, scoreGlobal);


        fill(displayColor, ((scoreGlobal - 5) / 1000) * (255 + (z / 25)));
        noStroke();



        pushMatrix();


        translate(x, y, z);


        if (intensity > 100) intensity = 100;
        scale(sizeX * (intensity / 100), sizeY * (intensity / 100), 20);


        box(1);
        popMatrix();


        displayColor = color(scoreLow * 0.5, scoreMid * 0.5, scoreHi * 0.5, scoreGlobal);
        fill(displayColor, (scoreGlobal / 5000) * (255 + (z / 25)));

        pushMatrix();


        translate(x, y, z);


        scale(sizeX, sizeY, 10);


        box(1);
        popMatrix();


        z += (pow((scoreGlobal / 150), 2));
        if (z >= maxZ) {
            z = startingZ;
        }
    }
}
