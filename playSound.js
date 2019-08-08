var song;
var slider;
var button;

function preload() {
  // we have included both an .ogg file and an .mp3 file
  soundFormats('wav');   //, 'mp3');
  // if mp3 is not supported by this browser,
  // loadSound will load the ogg file
  // we have included with our sketch
 // song = loadSound("watchtower.mp3");
  song = loadSound("One_Day.wav");
  
}

function setup() {
  createCanvas(50, 50);

slider=createSlider(0,1,.3,0.01);
  //createElement('p');
  //button=createButton("Click to Play")

 // button.mousePressed("play")
  // CANNOT NCLUDE THE NEXT LINE     
  //song.play()
  //background(0, 255, 0)
}

function draw(){
  song.setVolume(slider.value())

}


function mousePressed(){

  if (!song.isPlaying()) {
    // .isPlaying() returns a boolean
    song.play();
    background(0,255, 0);
  } else {
    song.pause(); // playback will resume from the pause position
    background(255,0, 0);
  }
}

