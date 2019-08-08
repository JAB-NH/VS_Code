void setup() {

size(200,100);
}

void draw() {
fill(255,0,0)
ellipse(50,50,25,15)
}


class Ball{
int x,y;
int yV;
int gravity;

Ball (int initX, int initY) {
  x=initX;
  y=initY;
  yV=1;
  gravity=1;
}

}