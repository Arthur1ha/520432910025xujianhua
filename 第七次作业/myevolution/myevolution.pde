import com.hamoid.*;

VideoExport videoExport;

int   nInd = 500;
Ind[] inds;


void setup(){
  size(1000,1000);
  
  videoExport = new VideoExport(this, "evolution.mp4");
  videoExport.startMovie();
  
  frameRate(100);
  background(255);
  inds = new Ind[nInd];
   
  for(int i=0; i<nInd; i++) {
    inds[i] = new Ind();
  }

}

void draw(){
  
   fill(255,20);
   rect(0,0,width,height);
   translate(width/2, height/2);
   for(int i=0; i<nInd; i++) {
      
      get(mouseX,mouseY);
      loadPixels();
      float r = get(mouseX,mouseY);
      float g = get(mouseX,mouseY);
      float b = get(mouseX,mouseY);
      inds[i].c1 += r;
      inds[i].c2 += g;
      inds[i].c3 += b;
      
      
      inds[i].update();
      inds[i].show();
    }
    videoExport.saveFrame();
}

void mousePressed() {
  for(int i=0; i<nInd; i++) {
    inds[i].pos = new PVector(random(-width/2,width/2),random(-height/2,height/2));
    inds[i].angle  = random(TWO_PI);
    inds[i].cang = 0;
  }
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}     
