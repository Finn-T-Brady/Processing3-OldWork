float a=0;
int b=0,t=2;
void setup(){
 size(600,600);
}
void draw(){
  translate(0,height/2);
  background(0);
  textSize(32);
  textAlign(CENTER);
  text(str(round(a)),width/2,-200);
  fill(200);
  beginShape();
  noFill();
  for(int n=0;n<width;n++){
    float x=sum(round(a),n,b);
    vertex(n,x*PI*50);
  }
  endShape();
  stroke(255);
  a+=0.25;
}

float sum(float a, float ang, int b){
  float x=0;
  if(b==0){
    for(int n=1;n<=a;n++){
      x+=sin((2*n-1)*radians(ang))/((2*n-1)*PI);
    }
  }
  if(b==1){
    for(int n=1;n<=a;n++){
      x+=sin(n*radians(ang))/(n*pow(-1,n)*PI);
    }
  }
  return x;
}
void mousePressed(){
  a=0;
  b=(b+1)%t;
}
