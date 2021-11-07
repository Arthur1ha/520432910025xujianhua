import com.hamoid.*;

VideoExport videoExport;

float xuan = TWO_PI/10;
float a = 0.0;
float inc = 0.1;
int num =20;


void setup(){
  size(600,600,P3D);
  colorMode(HSB);
   videoExport = new VideoExport(this, "my_recursion_three ball.mp4");
  videoExport.startMovie();
}

void draw(){   
  background(0);
  int dimension = width/2;
  translate(width/2, height/2, dimension);
  if(keyCode == UP){
    dimension +=width/60; 
  }
  else if(keyCode == DOWN){
    dimension -=width/60; 
  }
  rotateX(QUARTER_PI);
  rotateX(a);
  rotateZ(a*3);
  if( mousePressed == true){
    xuan = map(mouseX, 0, width, 0, PI);
    a = map(mouseY, 0, height, PI, TWO_PI);
  }
  lights();
  recursion(100,40);
  a += 0.03; 
  videoExport.saveFrame();
}

void recursion(float grow,float c){
  

  noStroke();
  myNoise();
  float r =map(mouseX,0,width,0,255);
  ambient(r,r,225);
  translate(0,0,grow/2);
  sphere(grow/6);
  translate(0,0,grow/2);
  grow *=0.6;
   if(key =='b' || key =='B'){
    num -=1;
  }
  else if(key =='F' || key =='f'){
    num +=1;
  }
  if(grow >num){
    for (int i = 0; i < 3;i++){
      pushMatrix();
      rotateZ(TWO_PI/3 * i);
      rotateY(xuan);
      recursion(grow,c);
      popMatrix();
    }
  } 
}

void myNoise(){
  float vx= map(mouseX,0,width,0,1);
  float vy= map(mouseY,0,height,0,1);
  float vz= map(mouseX,0,width/2,0,1);
  float mc = noise(vx,vy,vz) * 255;
  stroke(mc);
  mc += 10;
}

void keyPressed(){


  if (key == 's') {
    videoExport.endMovie();
    exit();
  }
}     
