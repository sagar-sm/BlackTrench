class Particle{
  PVector pos;
  float amp;
  float theta;
  
  Particle(float _a, float _t){
    pos = new PVector();
    amp = _a;
    theta = _t;
    pos.x = amp*sin(theta);
    pos.z = amp*cos(theta);
    pos.y = amp;
  }
  
  void travel(){
    update();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(2);
    //point(pos.x, pos.y, pos.z);
    //normal(0,1,0);
    //vertex(pos.x, pos.y, pos.z);
    popMatrix();
  }
  
  void update(){
    pos.y = height/(1*(pow(abs(pos.x),2)/700)); //inverse square relationship x-y
    pos.x=amp*sin(theta);
    pos.z=amp*cos(theta);
    theta+=0.1;
    amp-=0.1;
  }
}
