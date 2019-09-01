//3D Experiment
float x,y,z;
float rotX, rotY, rotZ;

int sq=20; // INITIAL VALUE FOR SIDE OF CUBE
int dia=70;// INITIAL VALUE FOR SPHERE
int scaleSq=3; // INITIAL VALUE FOR SCALE(x,y,z) FUNCTION
int txtX=0; // INITIAL VALUE FOR TEXT X-COORDINATE
int txtY=0; // INITIAL VALUE FOR TEXT Y-COORDINATE
int txtZ=-50; // INITIAL VALUE FOR TEXT Z-COORDINATE
int txtSz=25; // INITIAL VALUE FOR FONT SIZE
int txtDif=15; // INITIAL DIFFERENCE FOR TEXT SIZE DISLAYED IN 3D
int opacity=1;
boolean started=false;
//txtSz=txtSz;
String startText="CLICK ANYWHERE TO START"; 
/* T+ Brings text to forground T- Moves text into background";
                  V+ Brings entire 3d view forward
                  V- Pushes entire 3d view into background
                  X,Y,Z sliders rotate box & text 
                  
                  CLICK ANYWHERE TO BEGIN";
*/

void setup() {
   size(1024,730,P3D);
   
   //x = 512; 
   x = (width/2); //400; //((screen.width)/2); //ORIGINAL X VALUE
   //y = 365; 
   y = (height/2); //350; //((screen.height)/2); //ORIGINAL Y VALUE
   z = -100; // ORIGINAL Z VALUE  -2000 Box comes closer as Z gets more positive
   ang=0;
   rectMode(CORNER);
   textSize(txtSz); 
   //frameRate(60);
}

//////////////////////////////////////////////////////////////////////////////////////

void draw() {
     //lights();
   
   
   if ( mousePressed ) { //|| ( mouseMoved() ) {
      started=true;
      startText=" ";

   }

   if ((mouseX > 10) && (mouseX < 60) && (mouseY > 10) && (mouseY < 630)) {
      rotX=map(mouseY, 10,550,-PI/2, 2*PI); // PUSHING X-SLIDER
       }
   if ((mouseX > 950) && (mouseX < 1000) && (mouseY > 10) && (mouseY < 630)) {
      rotY=map(mouseY, 10,550,-PI/2,2*PI); // PUSHING Y-SLIDER
       }
   if ((mouseX > 10) && (mouseX < 960) && (mouseY > 640) && (mouseY < 690)) {
      rotZ=map(mouseX, 10,850,-PI/2,2*PI); // PUSHING Z-SLIDER
       }

 /// IF LEFT SIDE LOWER BOX TOUCHED-  V+
    
 if ((mouseX > 100) && (mouseX < 150) && (mouseY > 550) && (mouseY < 600)) {
      z=z+5;
      if (z>2000){
      z=-z;
      }

  }

 ///  IF LEFT SIDE UPPER BOX IS TOUCHED-  T+

   if ((mouseX > 100) && (mouseX < 150) && (mouseY > 100) && (mouseY < 150)) {
      txtZ=txtZ+.5; // PUSHING LEFT BOX
      if (txtZ>200){
      txtZ=-txtZ; //0;
      }
   }

 ///  IF RIGHT SIDE LOWER BOX TOUCHED-  V-

  if ((mouseX > 870) && (mouseX < 920) && (mouseY > 550) && (mouseY < 600)) {
      z=z-5;
      if (z < -2000) {
       z=-z; //0;
       }
    }

///  IF RIGHT SIDE UPPER BOX IS TOUCHED-  T-

  if ((mouseX > 870) && (mouseX < 920) && (mouseY > 100) && (mouseY < 150)) {
      txtZ=txtZ-.5; // PUSHING LEFT BOX
      if (txtZ<-200){
      txtZ=-txtZ; //0;
      }
  }

////////////////////////////////////////////////////////////////////
//  RESETS ALL ROTx TO '0' if touching inside large rectangle

    if ((mouseX > 930) && (mouseX < 990) && (mouseY > 610) && (mouseY < 660)) {
      rotZ=0;
      rotX=0;
      rotY=0;
      z=0;
      txtZ=0;

       }
  
   //////////////////////////////////////////////////////////////
   //////. CREATE SLIDERS AND PUSH BUTTONS AND OPENING TEXT
   
   background(0,0,255);
   fill(0);

   text(startText,(width/2)-200,height/2);
   fill(255,0,0);
   
   rect(10,10,50,620);    // X SLIDER
   fill(0,opacity);textSize(txtSz*2);text("X",45,310,50);
   textSize(txtSz);
   
   fill(0,255,0,250);
   //noFill();
   rect(950,10,50,620);   // Y SLIDER
   fill(0,opacity);textSize(txtSz*2);text("Y",955,310,50); 
   textSize(txtSz);

   fill(255,255,0,250);
   //noFill();
   rect(10,640,950,50);   // Z SLIDER
   fill(0);textSize(txtSz*1.5);text("Z",470,655,50);
   textSize(txtSz);

   fill(200,0,100);         // 'A' Button BOTTOM Left Side V+
   rect(100,550,50,50);
   fill(0);textSize(txtSz+11);text("V+",130,567,50);
   textSize(txtSz);
      //triangle(125,550,100,620,150,620); Doesnt work with P3D
   fill(100,0,200);
   rect(870,550,50,50);     // 'B' Button BOTTOM Right Side V-
   fill(0);textSize(txtSz+11);text("V-",865,565,50);
   textSize(txtSz);

   fill(50,100,50);
   rect(100,100,50,50);     // 'C' Button Top Left T+
   fill(0);textSize(txtSz+11);text("T+",130,140,50);
   textSize(txtSz);

   fill(100,50,100);
   rect(870,100,50,50);     // 'D' Button Top Right. T-
   fill(0);textSize(txtSz+11);text("T-",865,140,50);
   textSize(txtSz);

   noFill();

   strokeWeight(10);
   rect(68,20,875,610);   // INNER BOX HOLDING 3D OBJECT
   strokeWeight(2);
   
   fill(0,0,0); 

   /////////////////////DO THE FOLLOWING ONCE STARTED = TRUE ////////////////////////
   
   if (started) {
      
      fill(255,0,0);
      text("X-axis Rotation: "+ int(degrees(rotX)),80,30);
      text("X Translation: "+x,80,60);
   
      fill(0,255,0);
      text("Y-axis Rotation: "+ int(degrees(rotY)),380,30);
      text("Y Translation: "+y,380,60);
      text("Scale Factor: "+scaleSq,380,90);
      text("Text/Size: "+txtX+","+txtY+","+int(txtZ)+" /"+(txtSz-txtDif),380,120);
    
      fill(255,255,0);
      text("Z-axis Rotation: "+ int(degrees(rotZ)),680,30);
      text("Z Translation: "+z,680,60);
      
      textSize(txtSz);

      pushMatrix();
      translate(x,y,z);
      rotateY(rotY);
      rotateZ(rotZ);
      rotateX(rotX); 
      scale(scaleSq,scaleSq,scaleSq);

      fill(0);
      text("EDGAR",txtX,txtY,txtZ);
      //text(txtX+","+txtY+","+int(txtZ),txtX,txtY,txtZ);  

      
      fill(125,125,50);
      box(sq);
      popMatrix();

/////////////////////////////////


      textSize(txtSz);
      
   }
   
   /////////////////////// NEXT LINE ENDS DRAW SUBROUTINE //////////////////////////////////
}