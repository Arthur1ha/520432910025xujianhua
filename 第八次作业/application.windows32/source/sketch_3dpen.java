import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_3dpen extends PApplet {

/*import peasy.*;

PeasyCam cam;*/

/*import com.hamoid.*;

VideoExport videoExport;*/

PFont mz,ms,mc,mv,mb;
int enter =0;
int mode =1;
int distance = 10;
float rate = 0.5f;
float friction = 0.5f;
int size = 25;
float diff = size/8;
int x =0, y =0;
int ax =0, ay =0, a =0, r = 0,f = 0;
boolean start,help,back;
int mirx,miry;
float r1=245.0f,g1=150.0f,b1=170.0f;
int trap =0;
boolean sw;

public void setup(){
  
  
 // cam = new PeasyCam(this, 200);
  mz = loadFont("MicrosoftYaHei-100.vlw");
  ms = createFont("幼圆",80);
  mc = createFont("新宋体",50);
  mv = createFont("新宋体",33);
  mb = createFont("汉仪长仿宋体",50);
 /* videoExport = new VideoExport( this, "ENJOYDD"+minute()+second()+".mp4");
  videoExport.startMovie();*/
  
}

public void draw() {

  //这是开始界面
  if(enter == 0){
    background(204);
    stroke(0xff9E7A7A);
    textFont(mz);
    strokeWeight(5);
    fill(0xffFEDFE1);
    rect(0,0,width,300);
    fill(0xff64363C);
    text("welcome to the 2D-3D connected world",10,175);
    fill(0xffA8D8B9);
    strokeWeight(8);
    rect(700,590,520,200);
    fill(0xffFFFFFB);
    text("ENTER",790,725);
    fill(0xffB481BB);
    rect(1720,980,200,100);
    fill(0xffD0104C);
    textFont(ms);
    text("帮助",1740,1050);
  }
  
  
  
  //这是帮助界面
  if(enter ==2){
    String h = "这是一款2D-3D设计软件，在这里你可以将自己的创作与3D联系起来，从不同维度去体验自己的设计。在主页面中，空间被4个立方体包围，画笔会根据鼠标移动的快慢来控制随机颜色三维球的疏密度，按h调出快捷帮助键，按下s去保存图片，按下q保存视频，m左右对称创作，n上下对称，每次按下f都会更新界面。如果你想在这个基础上进行空间绘制，那么按下“z”可以停止这一平面的创作，按下c细小方形会因为空间反射改变颜色（背景颜色），按下“x”确定下一空间位置（空间位置与鼠标所在位置有关且与之大致相反，如鼠标在左下，新平面大致在右上方，）然后便可以进行不同方位的创作，享受自己！点击“ENTER”进入你的世界，创造无限的可能吧！！！";
    textFont(mv);
    background(0xffEEA9A9);
    fill(0xffB5CAA0);
    rect(650,170,620,740);
    fill(0xff563F2E);
    text(h,650,170,620,740);
    fill(0xff5E3D50);
    rect(1170,860,100,50);
    textFont(mc);
    fill(255);
    text("BACK",1170,900);
    
   
  }
  
  
  
  //主要画图界面
  if(enter == 1){
    if(((keyPressed == true) && (key =='f' || key =='F'))){
      background(0xff9E7A7A);
    }
    if(key =='z'||key =='Z'){
       mode = 0;
    }
    if(key =='x'||key =='X'){
       mode = 1;
     //loop();
    }
    //background(0);
    //rect(0,0,width,height);
    
    textFont(mb);
    fill(0xff554236,trap);
    text("f:更新界面 ",-400,-150,-(width-height)/2);
    text("m:左右对称 ",-400,-100,-(width-height)/2);
    text("n:上下对称 ",-400,-50,-(width-height)/2);
    text("s:保存图片 ",-400,0,-(width-height)/2);
    text("P:保存视频 ",-400,50,-(width-height)/2);
    text("z:停止这一界面创作 ",-400,100,-(width-height)/2);
    text("c:改变边框颜色 ",-400,150,-(width-height)/2);
    text("x:确定下一空间位置 ",-400,200,-(width-height)/2);
    if(((keyPressed == true) && (key =='h' || key =='H'))){
      trap = 255;
    }
    
    
    noStroke();
    pushMatrix();
    translate(-300,height/2,-(width-height)/2);
    box(0.1f,height*1.5f,0.1f);
    popMatrix();

    pushMatrix();
    translate(width*1.3f,height/2,-(width-height)/2);
    box(0.1f,height*1.5f,0.1f);
    popMatrix();
    
    pushMatrix();
    translate(width/2,-100,-(width-height)/2);
    box(width*1.4f,0.1f,0.1f);
    popMatrix();
    
    pushMatrix();
    translate(width/2,height*1.2f,-(width-height)/2);
    box(width*1.4f,0.1f,0.1f);
    popMatrix();
   


    if(mode == 0){
      camera(/*width/2+200*cos(10)*/0,mouseY*2,/*height/2+200*sin(10)*/1200, mouseX,mouseY,0, 0, 1, 0);

    }
    else if(mode ==1){
      
      if (sw == true){
       fill(0xff9E7A7A);
       rect(0,0,width,height);
       sw = false;
      }
      
      //background(0);
      noStroke();
      //fill(#563F2E);
      pushMatrix();
      translate(-445,height/2,-(width-height)/2);
      box(10,height*1.46f,20);
      popMatrix();

      pushMatrix();
      translate(width*1.22f+10,height/2,-(width-height)/2);
      box(10,height*1.46f,20);
      popMatrix();
    
      pushMatrix();
      translate(width/2,-240,-(width-height)/2);
      box(width*1.46f,10,20);
      popMatrix();
    
      pushMatrix();
      translate(width/2,height*1.22f,-(width-height)/2);
      box(width*1.46f,10,20);
      popMatrix();
      
      
      if(keyPressed == true && key == 'z'){
        mode = 0;
        noLoop();
      }else{
     stroke(5);
     
      int oldR = r;
      if(mousePressed) {
        float mX = mouseX;
        float mY = mouseY;
        //float mZ = 
        if(f != 1) {
          f = 1;
          x = PApplet.parseInt(mX);
          y = PApplet.parseInt(mY);
      }
      ax += (mX - x ) * rate;
      ay += (mY - y ) * rate;
      ax *= friction;
      ay *= friction;
      a += sqrt( ax*ax + ay*ay ) - a;
      a *= 0.6f;
      r = size - a;
      x += ax;
      y += ay;
    
      for( int i = 0; i < distance; ++i ) {
        int oldX = x;
        int oldY = y;
        x += ax / distance;
        y += ay / distance;
        oldR += ( r - oldR ) / distance;
        if(oldR < 1) oldR = 1;
         //strokeWeight( oldR+diff );
        int mx = x;
        int my = y;
        float r = map(mouseX,0,width,0,255);
        ambient(r,r,random(0,255));
        fill(random(0,255),random(0,255),random(0,255));
        lights();
        noStroke();
        if((keyPressed==true) &&(key =='m'|| key=='M')){
            mirx = width - mx;
            miry = my;
            strokeWeight( oldR );
            //fill(random(0,255),random(0,255),random(0,255));
            pushMatrix();
            translate(x+diff, miry+diff,(oldX+oldY+diff*2)/3);
            sphere((oldX+diff+oldY+diff)/500);
            popMatrix();
            pushMatrix();
            translate(mirx-diff, y-diff,(oldX+oldY-diff*2)/3);
            sphere((oldX-diff+oldY-diff)/500);
            popMatrix();
          }else if((keyPressed==true) &&(key =='n'|| key=='N')){
            mirx = mx;
            miry = height - my;
            strokeWeight( oldR );
            pushMatrix();
            translate(x+diff, miry+diff,(oldX+oldY+diff*2)/3);
            sphere((oldX+diff+oldY+diff)/500);
            popMatrix();
            pushMatrix();
            translate(mirx-diff, y-diff,(oldX+oldY-diff*2)/3);
            sphere((oldX-diff+oldY-diff)/500);
            popMatrix();
          }
        pushMatrix();
        translate(x,y,(oldX+oldY)/3);
        sphere((oldX+oldY)/500);
        popMatrix();
        pushMatrix();
        translate(x+diff, y+diff,(oldX+oldY+diff*2)/3);
        sphere((oldX+diff+oldY+diff)/500);
        popMatrix();
        }
        
      }else if(f == 1) {
        ax = ay = f = 0;
      }
    
      }
      if((keyPressed==true) &&(key =='c'|| key=='C')){
        r1 = random(255);
        g1 = random(255);
        b1 = random(255);
        fill(r1,g1,b1);
      }
       strokeWeight(2);
       stroke(0);
       fill(r1,g1,b1);
       
       }

     //videoExport.saveFrame();
   }
    }  


  
public void keyPressed(){
  if(key =='s'||key =='S'){
    save("DD/MS"+year()+month()+day()+hour()+minute()+second()+".jpg");
  }
  /*if (key == 'q'||key == 'Q') {
    videoExport.endMovie();
    exit();
  }*/
 
}

public void mousePressed(){
  if((mouseX>=700 && mouseX<=1220) && (mouseY>=590 && mouseY<=790)){
      start = true;
      if(start == true && enter == 0){
        enter =1;
        sw = true;
    }
  }
  if((mouseX>=1720 && mouseX<=1920) && (mouseY>=980 && mouseY<=1080)){
      help = true;
      if(help == true && enter == 0){
        enter =2;
    }
  }         
  if((mouseX>=1170 && mouseX<=1270) && (mouseY>=860 && mouseY<=910)){
      back = true;
      if(back == true && enter == 2){
        enter =0;
    }
  }
}

public void keyReleased(){
  trap =0;
}
  public void settings() {  size(1920,1066,P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "sketch_3dpen" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
