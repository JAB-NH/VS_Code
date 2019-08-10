int radius = 200;
int radiusSpacing = 50;//100;
float angle = 0;
int centreX;
int centreY;
int widthX = 250;//1024; � //screen.width;
int heightY = 250;//710; � //screen.height;

void setup() {
size(widthX, heightY);
centreX=0;
centreY=0;
stroke(255,0,0);
strokeWeight(2);
textSize(12);
frameRate(60);
}


void draw() {
background(0,0,0);
translate(widthX/2,heightY/2);
fill(0);
stroke(255,0,0);
/////////////////.� CONCENTRIC CIRCLES. ///////////////
strokeWeight(2);
ellipse(0,0,radius,radius);
ellipse(0,0,radius-radiusSpacing,radius-radiusSpacing);
ellipse(0,0,radius-radiusSpacing*2,radius-radiusSpacing*2);
ellipse(0,0,radius-radiusSpacing*3,radius-radiusSpacing*3);
ellipse(0,0,radius-radiusSpacing*4,radius-radiusSpacing*4); 
ellipse(0,0,radius-radiusSpacing*5,radius-radiusSpacing*5);
//ellipse(0,0,radius/10,radius/10);

fill(255);
// 1st text is left side
text("100",-radius/2-15,0); text("100",radius/2-15,0);
text("75",-radius/2+15,0); text("75",radius/2-40,0);
text("50",-radius/2+45,0);text("50",radius/2-60,0);
text("25",-radius/2+70,0);text("25",radius/2-85,0);
text("O",-5,0);
//text("75",radius-radiusSpacing*3-10,0);text("75",-(radius-radiusSpacing*3)-10,0);
fill(0);

////////////////////// � RADIAL ARMS� //////////////////////

stroke(255);
strokeWeight(1);
for (int i=0;i<370;i+=45) {
 line(centreX,centreY,centreX+(cos(radians(i))*radius)/2,centreY+(sin(radians(i))*radius)/2);
 }

///////////////////. SWEEP ARM //////////////////
strokeWeight(5);

line(centreX,centreY,centreX+(cos(angle)*radius)/2,centreY+(sin(angle)*radius)/2);
angle=angle+0.01;
if (angle > 2*PI) {
 angle=0;
}
}


