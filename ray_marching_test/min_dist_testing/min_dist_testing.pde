void setup(){
  size(600,600);
  background(0);
}
float sign(float x){
  return (Math.signum(x)+1)/2;
}
float gzmin(float[] f){
  float[] v=new float[f.length];
  for(int n=0;n<f.length;n++){
    if(f[n]>=0 && !Float.isNaN(f[n])){
      v[n]=f[n];
    }
    else{v[n]=Float.POSITIVE_INFINITY;}
  }
  return min(v);
}
float ang=0;
Vector2 pos=new Vector2(-150,0);
void draw(){
  translate(width/2,height/2);
  circle(pos.x,pos.y,5);
  float f[]={(-width/2-pos.x)/cos(ang),(width/2-pos.x)/cos(ang),(-height/2-pos.y)/sin(ang),(height/2-pos.y)/sin(ang)};
  float d=gzmin(f);
  point(cos(ang)*(d-5)+pos.x,sin(ang)*(d-5)+pos.y);
  stroke(255);
  ang=ang+0.005;
}
