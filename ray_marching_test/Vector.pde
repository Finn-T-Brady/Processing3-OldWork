//defines n-dimensional vector classes

class Vector2{
  float x,y,dist;
  Vector2(float x_,float y_){
    x=x_;y=y_;
    dist=sqrt(x*x+y*y);
  }
}
class Vector3{
  float x,y,z,dist;
  Vector3(float x_, float y_, float z_){
    x=x_;y=y_;z=z_;
    dist=sqrt(x*x+y*y+z*z);
  }
}
class Vector4{
  float x,y,z,w,dist;
  Vector4(float x_,float y_,float z_,float w_){
    x=x_;y=y_;z=z_;w=w_;
    dist=sqrt(x*x+y*y+z*z+w*w);
  }
}
float V2Dot(Vector2 a,Vector2 b){
  return a.x*b.x+a.y*b.y;
}
