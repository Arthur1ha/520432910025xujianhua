class Ind {
   
  PVector pos;
  float angle;
  float han;
  float cang;
  color c;
  float c1 =random(255); 
  float c2 =random(255); 
  float c3 =random(255); 
//  PVector pos;
   
  Ind() {
    pos = new PVector(random(-width/2,width/2),random(-height/2,height/2));
    angle  = random(TWO_PI);
    han = 0.1;
    cang = 0;
    c = color(c1,c2,c3);
  }
   
  void update() {
    float cor = han*atan(15*cang)/PI;
    float randNum = (random(-1,1))*han-cor; 
    han+=randNum;                       
    angle+=cang;                         
  
    pos.x+=han*cos(angle);           
    pos.y+=han*sin(angle);
  }
   
  void show() {
    fill(c);
    noStroke();
    rect(pos.x,pos.y,random(20),random(20));
    ellipse(pos.x,pos.y,random(20),random(20)) ;   //ellipse(frameCount/10-100,10*angle,rr,rr);
  }
}
