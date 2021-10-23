PFont myFont1;
PFont myFont2;
int myColor,x1=25,x2=75,y1=200,y2=400,x3 =25,x4 =75;
float deep;
String  poem1 = "爱怀疑和爱飞翔的是鸟";
String  poem2 ="淹没一切的是海水";   //这两句诗希可以不忘初心，勇往直前

void setup(){
  size(600,600);
  myFont1 = createFont("微软雅黑",50 );
  myFont2 = createFont("华文细黑",50 );
}

void draw(){

  //循环第一句诗
  for(int i =0;i<poem2.length();i++){
    if(i%2 ==0){
    myColor =255;
    fill(myColor);
    textFont(myFont1);
    text(poem1.charAt(i),mouseX,mouseY);
    mouseX +=100;
   }else{
    myColor =0;
    fill(myColor,100);
    textFont(myFont2);
    text(poem1.charAt(i),mouseY,mouseX);
    mouseY  +=100;
   }
}
//循环第二句诗
  for(int l =0;l<poem2.length();l++){
    if(l%2 ==0){
       myColor =0;
       fill(myColor,100);
       textFont(myFont1);
       text(poem2.charAt(l),mouseX,mouseY);
       mouseY +=100;
   }else{
     myColor =225;
     fill(myColor);
     textFont(myFont2);
     text(poem2.charAt(l),mouseY,mouseX);
     mouseX+=100;
   }
  }
}
