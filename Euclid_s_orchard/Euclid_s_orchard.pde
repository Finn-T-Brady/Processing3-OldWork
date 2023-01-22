//import gifAnimation.*;
//GifMaker gifExport;
int zoom=2;
void setup(){
  size(800,800);
  background(0);
  frameRate(120);
  //gifExport = new GifMaker(this, "Euclids Orchard.gif");
  //gifExport.setRepeat(0);       
  //gifExport.setTransparent(255,255,255);
}
int fIndex(float[] a, float o){
  int p=-1;
  for(int n=0;n<a.length;n++){
    if(a[n]==o){p=n;break;}
  }
  return p;
}
float aaa(int q){
  if(q>=height/zoom){q=floor(height/zoom)-1;}
  return q;
}
int i=1;
float[] s={-1};
void draw(){
  translate(1,height-1);
  scale(zoom,zoom);
  for(float y=aaa(i);y>=1;y--){
    float x=i-y+1;
    if(x>=+floor(width/zoom)){break;}
    float a=x/(y+x);
    if(fIndex(s,a)==-1){
      point(x,-y);
      s=append(s,a);
    }
  }
  i++;
  stroke(255);
  //gifExport.setDelay(1);
  //gifExport.addFrame();
}

//void mouseClicked(){noLoop();gifExport.finish();}
