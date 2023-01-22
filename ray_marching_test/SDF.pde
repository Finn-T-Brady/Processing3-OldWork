//smooth min function
//sourced from https://www.iquilezles.org/www/articles/smin/smin.htm
float smin( float a, float b, float k )
{
    float h = max( k-abs(a-b), 0.0 )/k;
    return min( a, b ) - h*h*k*(1.0/4.0);
}

//definitions of all signed distance functions used in program
float circle(Vector2 s,float r,Vector2 p){
  return sqrt((s.x-p.x)*(s.x-p.x)+(s.y-p.y)*(s.y-p.y))-r;
}

float SmRotCir(Vector2 s,float r,Vector2 p,float speed,float c){
  float a=circle(new Vector2(s.x+cos(speed*time*deg)*(r-c),s.y+sin(speed*time*deg)*(r-c)),r,p);
  float b=circle(new Vector2(s.x-cos(speed*time*deg)*(r-c),s.y-sin(speed*time*deg)*(r-c)),r,p);
  return smin(a,b,20);
}

float UnevenCapsule(Vector2 p,Vector2 s,float r1, float r2, float h){
  p.x=abs(p.x);
  float b=(r1+r2)/h;
  float a=sqrt(1-b*b);
  float k=V2Dot(p,new Vector2(-b,a));
  if(k<0){return sqrt((p.x-s.x)*(p.x-s.x)+(p.y-s.y)*(p.y-s.y))-r1;}
  if(k>a*h){return sqrt((p.x-s.x)*(p.x-s.x)+(p.y-s.y-h)*(p.y-s.y-h))-r1;}
  return V2Dot(p,new Vector2(a,b))-r1;
}
