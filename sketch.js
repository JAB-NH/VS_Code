/*
 * @name Tilted 3D Box
 * @description Use mobile to tilt a box
 */
var canvas
var thetaX
var thetaY
var theta2X
var theta2Y
var extraCanvas
var extraCanvasCol=255
let canvas1xpos=325
var canvas1ypos=80
var button
var button2
var button3
var slider
var slider2
var extraCanvasColR=200
var extraCanvasColG=200
var extraCanvasColB=200

function setup() {
wid=300
ht=300
canvas = createCanvas(wid,ht, WEBGL);
// Create a separate graphic plane
extraCanvas=createGraphics(wid-50,ht-50,WEBGL);
canvas.position(canvas1xpos,canvas1ypos)
extraCanvas.background(extraCanvasColR,extraCanvasColG,extraCanvasColB) 
extraCanvas.clear()
//extraCanvas.position(canvas1xpos,canvas1ypos)
extraCanvas.position(canvas1xpos,canvas1ypos)//position(0,0)
thetaX=100
thetaY=100
theta2X=25
theta2Y=5

button=createButton("CLICK ME TO CHANGE DISC COLOUR")
button.position(10,265)
button.mousePressed(change)

slider=createSlider(0,200,50)
slider2=createSlider(0,200,50)
slider.position(10,350)
slider2.position(10,440)
}

function change() {
  
  extraCanvasColR=(random(255))
  extraCanvasColG=(random(255))
  extraCanvasColB=(random(255))
  //thetaX=thetaX+25

}function draw() {
  background(150);
  fill(0,255,0)
  //text("hello1",slider.value(),slider2.value())

  push()
  normalMaterial();
  //text("hello3",20,20)
  rotateX(thetaX * 0.01);
  rotateY(thetaY * 0.01);
  rotateZ(thetaY * 0.01);
  box(150,slider.value(),30)
  box(100,slider2.value(), 100);
  pop()
  thetaX=thetaX+1
  thetaY=thetaY+1
  push()
  extraCanvas.fill(extraCanvasColR,extraCanvasColG,extraCanvasColB)
  extraCanvas.sphere(100)
  rotateX(theta2X*0.01)
  rotateY(theta2Y*0.01)
  rotateZ(theta2X*0.01)

image(extraCanvas,-50,-50)
pop()
theta2X=theta2X+2
  theta2Y=theta2Y+2;
}
