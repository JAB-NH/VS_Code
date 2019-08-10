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
var extraCanvasColR=100
var extraCanvasColG=100
var extraCanvasColB=100

function setup() {
wid=400
ht=400
canvas = createCanvas(wid,ht, WEBGL);
// Create a separate graphic plane
extraCanvas=createGraphics(wid,ht,WEBGL);
canvas.position(canvas1xpos,canvas1ypos)
extraCanvas.background(extraCanvasColR,extraCanvasColG,extraCanvasColB) 
extraCanvas.clear()
//extraCanvas.position(canvas1xpos,canvas1ypos)
extraCanvas.position(0,0)
thetaX=100
thetaY=100
theta2X=25
theta2Y=5

button=createButton("CLICK ME TO CHANGE DISC COLOUR")
button.position(10,265)
button.mousePressed(change)
/*
button2=createButton("Run Page 2")
button2.position(10,500)
button2.mousePressed(loadPage2)

button3=createButton("Run Page 3")
button3.position(200,500)
button3.mousePressed(loadPage3)

*/

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
  extraCanvas.sphere(170)
  rotateX(theta2X*0.01)
  rotateY(theta2Y*0.01)
  rotateZ(theta2X*0.01)

image(extraCanvas,-250,-300)
pop()
theta2X=theta2X+2
  theta2Y=theta2Y+2
  //text("hello2",100,100);
}

/*
function loadPage2() {

change()
}

function loadPage3() {

change()
}

*/