import com.hamoid.*;

VideoExport videoExport;

Particle [] p;

void setup(){
  size(1000,1000);
  background(204);
  videoExport = new VideoExport(this, "this is my freestytle.mp4");
  videoExport.startMovie();
  
  p = new Particle[100];
  for(int i =0;i<p.length;i++){
    
    p[i] = new Particle();
  }
  frameRate(20); 
}

void draw(){
  
  for(int i =0;i<p.length;i++){
    // p[i].move();
     p[i].update();
     p[i].drawParticle();
     p[i].checkEdges();
  }
  videoExport.saveFrame();
}


void mousePressed(){
  /*if(key == 'b' || key == 'B'){
    
  }
  else */
  if(key == 'e' || key == 'E'){
     videoExport.endMovie();
     exit();
  }
  
}
