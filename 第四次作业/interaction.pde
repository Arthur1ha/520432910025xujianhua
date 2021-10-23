float thick,mycolor,yuan;

void setup(){
  size(600,600);
  background(225);
}

void draw(){
  strokeWeight(thick);
  fill(yuan,random(yuan),random(yuan));
  stroke(mycolor,random(mycolor),random(mycolor));
  yuan =map(mouseX,0,width,0,120)+map(mouseY,0,height,0,105); 
  if(key == 'l' || key =='L'){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  else if(key =='c' || key =='C'){
    thick = 0;
    ellipse(mouseX,mouseY,mouseX/50+mouseY/50,mouseX/50+mouseY/50);
  }
  
  if(mouseButton == LEFT){
      noLoop();
    }
}
  
void mouseDragged(){
   float thin = map(mouseX,0,width,0,30);
   thick = thin;
   float icolor = map(mouseY,0,height,0,225);
   mycolor = icolor;
}

void mousePressed(){
  loop();
}
