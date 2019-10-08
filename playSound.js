var song1;
var song2;
var slider;
var button;
var canvas;

function preload() {
 // song = loadSound("watchtower.mp3");
  song1 = loadSound("songs/On The Streets of Amsterdam.wav");
  song2 = loadSound("songs/One_Day.wav")
  
}

function setup() {
  canvas = createCanvas(100, 100);

//slider=createSlider(0,1,.3,0.01);
//createElement('br');
//createElement('br');
// button=createButton("Click to Stop All")
}

function draw(){
  //song1.setVolume(slider.value())

}


function mousePressed(){

  if (!song1.isPlaying()) {
    // .isPlaying() returns a boolean
    song2.pause();
    song1.play();
    //canvas.position(50,170);
    background(0,255, 0);
  } else {
    song1.pause(); // playback will resume from the pause position
    song2.play();
    //canvas.position(250,170);
    background(255,0, 0);
  }
}

