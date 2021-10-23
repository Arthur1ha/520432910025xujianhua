void setup(){
  size(1000,1000);
  background(#4D4C4D);
}

//突发奇想，整一个抽象的

void draw(){
  strokeWeight(1);
  fill(225);
  triangle(400,50,200,200,450,200);   //这是头主体
  fill(#F7FA7C);
  ellipse(370,125,50,50);
  fill(124,196,250,random(225));
  ellipse(373,123,10,10);
  fill(#F7FA7C);
  triangle(400,50,450,0,430,65);
  fill(#F7730C);
  bezier(430,65,450,-10,475,-20,475,86);
  fill(#0AF782);
  triangle(475,88,475,10,500,100);  //头上的一些毛发
  quad(400,50,450,200,550,250,500,100);
  fill(0);
  quad(450,200,530,240,475,350,425,330);//脖子
  fill(#A0BF47);
  triangle(425,330,800,700,300,550);   
  fill(#FA2157);
  triangle(530,240,570,260,400,500);
  fill(#D915E8);
  triangle(481,387,750,500,800,700);     //大部分身体
  triangle(330,500,250,400,150,525);
  fill(#F7730C);
  triangle(150,525,300,550,350,675);
  fill(#545EC1);
  bezier(300,550,500,720,700,720,800,700);//前腿及肚子
  triangle(750,500,850,450,900,750);
  fill(#6E6F74);
  quad(550,685,650,705,620,850,580,820);
  fill(#F7730C);
  triangle(580,820,620,850,550,950);
  fill(#0AF782);
  quad(645,720,750,708,725,830,690,800);
  fill(0,125);
  triangle(690,800,725,830,650,900);
  fill(#C5ED9C);
  //bezier(500,100,600,200,650,300,450,250);
  fill(#86645B);
  bezier(481,387,600,400,680,350,750,500);
  fill(random(255),random(255),random(255));
  /*if(1 == 1) {
    strokeWeight(random(10));
    stroke(random(225),random(225));
    ellipse(random(1000),random(1000),random(200),random(200));
    rect(random(1000),random(1000),random(200),random(200));
  }*/
  
} 
