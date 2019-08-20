ArrayList <Ant> ants = new ArrayList<Ant>(); int numAnts = 1000; 
 
void setup() {
  size(600, 600);
  frameRate(60);
  for (int i = 0; i < numAnts; i++)
    ants.add(new Ant());
}
 
void draw() {
  background(0);
  for (int i = 0; i < numAnts; i++)
    ants.get(i).drawAnt();
}


class Ant {
  //Members - variables of the object the class creates. (attributes)
  float x, y;
  PVector speed;
  int bodySize; 
 
  //Constructor - initializes the variables, or the settings of the object that the class creates. (sets up those attributes)
  Ant() {
    x = random(50, 450);
    y = random(50, 450);
    bodySize = int(random(5,7));
    
   // speed = new PVector(random(-0.8, 0.8), random(-0.8, 0.8));
    speed = new PVector(random(-5, 5), random(-5, 5));


  }
 
  //Methods - functions of the object that the class   creates. (abilities of the object)
  void drawAnt() {
    moveAnt();
    if(bodySize<6){
      fill (random(255),0,0);
    } 
    if(bodySize>=6) {
      fill (random(255),random(255),0);
    }
    ellipse(x, y, bodySize, bodySize);
  }
 
  void moveAnt() {
    float testMove = random(0, 1);
    if(testMove < 0.1)
      speed.rotate(random(-0.3, 0.3));
    if(testMove > 0.97)
      speed.rotate(random(-1, 1));
 
    x = x + speed.x;
    y = y + speed.y;
 
    if(isAntOffScreen() == true) {
      x = x - speed.x;
      y = y - speed.y;
      speed.rotate(random(-2, 2));
    }
  }
 
  boolean isAntOffScreen() {
    int radius = bodySize / 2;
    if(x < radius || x > width - radius ||
       y < radius || y > height - radius)
    return true;
    return false;
  }
}
