//import gifAnimation.*;
//GifMaker gifExport;
float n=2,s=200,d,f=19;
float speed=1000;
float j=0;
float deg=PI/180;
float dsin(float n){return(sin(n*deg));}
float dcos(float n){return(cos(n*deg));}
void setup(){
  size(600,600);
  frameRate(30);
  //gifExport = new GifMaker(this, "Maurer Roser.gif");
 // gifExport.setRepeat(0);       
  //gifExport.setTransparent(255,255,255);
}
void draw(){
  background(0);
  translate(width/2,height/2);
  d=sin(j)*f+2*f;
  float x,y,k;
  stroke(255);
  noFill();
  beginShape();
  for(int i=0;i<=360;i++){
    k=i*d;
    x=dcos(k)*dsin(n*k)*s;
    y=dsin(k)*dsin(n*k)*s;
    vertex(x,y);
  }
  endShape();
  //gifExport.setDelay(1);
  //gifExport.addFrame();
  j=frameCount/(f*speed);
  //if(j>=0.0166799){noLoop();gifExport.finish();}
}
void mouseClicked(){noLoop();print(j);}
