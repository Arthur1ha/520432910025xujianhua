class Particle{
  
    PVector location;
    PVector velocity;
    PVector acce;
    float most;
    float px,py;
    float r;
  
    Particle(){
      
      px = random(0,width);
      py = random(0,height);
      location = new PVector(px,py);
      velocity = new PVector(random(-2,2),random(-2,2));
      velocity.normalize();
      acce = new PVector(random(-0.1,0.1),random(-0.1,0.1));
      most = 20;

      r = random(20,50);

    }
    
    
    void update(){
      velocity.add(acce);
      velocity.limit(most);
      location.add(velocity); 
    }
  
    void drawParticle(){
      
      float c =map(px,0,width,0,225)/2 + map(py,0,height,0,225)/2;
      fill(c,random(0,225),random(0,225));
      /*if(px<width/2){
        ellipse(px,py,r,r);
      }
      else if(px>width/2 && py <height/2){*/
        stroke(c,random(0,225),random(0,225));
        line(px,py,px+velocity.x*50,py+velocity.y*50);
     /* }
      else if(px>width/2 && py >height/2){
        rect(px,py,px/10,py/10); 
      }*/
      
      if(mousePressed == true){
        float xDist = mouseX - px;
        float yDist = mouseY - py;
        px += xDist * 0.1;
        py += yDist * 0.1;
      }

    }
    
    
    void checkEdges() {
    if (px+velocity.x*50 > width) {
      px = random(0,width);
    } else if (px+velocity.x*50 < 0) {
      px = random(0,width);
    }
 
    if (py+velocity.y*50 > height) {
      py = random(0,height) ;
    } else if (py+velocity.y*50 < 0) {
      py = random(0,height);
    }
 
  }
   /*void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
 
  }*/

}
