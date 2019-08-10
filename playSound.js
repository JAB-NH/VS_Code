var song1;
var song2;
var slider;
var button;
var canvas;

function preload() {
  // we have included both an .ogg file and an .mp3 file
  soundFormats('wav');   //, 'mp3');
  // if mp3 is not supported by this browser,
  // loadSound will load the ogg file
  // we have included with our sketch
 // song = loadSound("watchtower.mp3");
  song1 = loadSound("On The Streets of Amsterdam.wav");
  song2 = loadSound("watchtower.mp3")
  
}

function setup() {
  canvas = createCanvas(50, 50);

//slider=createSlider(0,1,.3,0.01);
  //createElement('p');
  //button=createButton("Click to Play")

 // button.mousePressed("play")
  // CANNOT NCLUDE THE NEXT LINE     
  //song.play()
  //background(0, 255, 0)
}

function draw(){
  //song1.setVolume(slider.value())

}


function mousePressed(){

  if (!song1.isPlaying()) {
    // .isPlaying() returns a boolean
    song2.pause();
    song1.play();
    canvas.position(50,200);
    background(0,255, 0);
  } else {
    song1.pause(); // playback will resume from the pause position
    song2.play();
    canvas.position(200,200);
    background(255,0, 0);
  }
}

