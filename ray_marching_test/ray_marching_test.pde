//import gifAnimation.*;
//GifMaker gifExport;
float deg=PI/180;//degree to radian conversion variable
float fov=60*deg;//field of view
float time;//time
float ang=0;//angle the player is facing
float debug=0;//primary debug variable
float debug2=0;//FoV debug variable
Vector2 pos = new Vector2(-450,0);//player starting position vector

void setup(){
  size(1600,900);
  frameRate(120);
  //gifExport = new GifMaker(this, "Ray March.gif");
  //gifExport.setRepeat(0);       
  //gifExport.setTransparent(255,255,255);
}

//determining the minimum distance of each object in the scene
Vector4 Scene(Vector2 p){
  float[][] a={
  {circle(new Vector2(cos(time*10)*10,0),30,p),255,100,100},
  {circle(new Vector2(150,0),90+sin(time*5)*30,p),200,255,0},
  {circle(new Vector2(-30,sin(30*deg+time)*420),25,p),0,255,100},
  {SmRotCir(new Vector2(150,-300),20,p,200,0),50,50,255}
  //{UnevenCapsule(new Vector2(0,0),p,10,15,10),255,100,100}
  };
  int i=LbI(a);
  return new Vector4(a[i][0],a[i][1],a[i][2],a[i][3]);
}

int LbI(float[][] f){
  float[] v = {f[0][0],0};
  for(int n=1;n<f.length;n++){
    if(f[n][0]<v[0]){
      v[0]=f[n][0];
      v[1]=n;
    }
  }
  return (int)v[1];
}

//greater than zero min()
float gzmin(float[] f){
  for(int n=0;n<f.length;n++){
    //removing NaNs and numbers <0
    if(f[n]<0 || Float.isNaN(f[n])){
      f[n]=Float.POSITIVE_INFINITY;}
    }
  return min(f);
}

//Used to determin light level
float lightingFalloff(float n){
  return pow((1-abs(n-ang)/(fov*2)),2);
}

void draw(){
  translate(width/2,height/2);
  background(0);
  ang=atan2(mouseY-pos.y-height/2,mouseX-pos.x-width/2);//determins angle towards mouse
  for(float n=ang-fov;n<=ang+fov;n+=deg/100){
    float f[]={(-width/2-pos.x)/cos(n),(width/2-pos.x)/cos(n),(-height/2-pos.y)/sin(n),(height/2-pos.y)/sin(n)};//distance to all sides
    float md=gzmin(f);//greater than zero min() of distance to all sides
    Vector2 c=pos;
    while(sqrt((c.x-pos.x)*(c.x-pos.x)+(c.y-pos.y)*(c.y-pos.y))<md){
      //determins lowest distance in scene
      Vector4 d=Scene(c);
      c=new Vector2(c.x+d.x*cos(n),c.y+d.x*sin(n));//marches ray
      float l=lightingFalloff(n);
      if(d.x<0.01){stroke(d.y*l,d.z*l,d.w*l);point(c.x,c.y)/*draws point*/;break;}
    }
  }
  stroke(255);
  
  //draws player
  for(float n=0;n<360;n++){
    point(pos.x+cos(n)*5,pos.y+sin(n)*5);
  }
  for(float n=0;n<5;n++){
    point(pos.x+cos(ang)*n,pos.y+sin(ang)*n);
  }
  
  //debug info
  if(debug==1){
    text("pos:"+str(pos.x)+","+str(pos.y)+"\nang:"+str(ang)+"\nmousePos:"+str(mouseX)+","+str(mouseY)+"\nfov: "+str(fov),-width/2,-height/2+16);
    textSize(16);
  }
  
  //debug FoV
  if(debug==1 && debug2==1){
    for(int n=0;n<500;n++){
      point(pos.x+n*cos(ang+fov),pos.y+n*sin(ang+fov));
      point(pos.x+n*cos(ang-fov),pos.y+n*sin(ang-fov));
    }
  }
  time+=0.01;
  //gifExport.setDelay(1);
  //gifExport.addFrame();
}

void keyPressed(){
  //movements.x=
  if(keyCode==87){pos=new Vector2(pos.x,pos.y-1);}//move up
  if(keyCode==65){pos=new Vector2(pos.x-1,pos.y);}//move left
  if(keyCode==83){pos=new Vector2(pos.x,pos.y+1);}//move down
  if(keyCode==68){pos=new Vector2(pos.x+1,pos.y);}//move right
  
  //debug function toggling
  if(keyCode==114){debug=(debug+1)%2;}//debug info
  if(keyCode==115){debug2=(debug2+1)%2;}//shows FoV
}
//void mouseClicked(){noLoop();gifExport.finish();}
