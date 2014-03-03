//Sagar Mohite
//Press v or t for switching between vortex or trench.
//Press 1 to toggle camera

ArrayList<Particle> particles;
int c = 0;
PShader blur;
String mode = "trench";
boolean flag = true;

void setup(){
  size(displayWidth, displayHeight, P3D);
  background(0);
  particles = new ArrayList<Particle>();
  for(int i = 0; i<1; i++){
    particles.add(new Particle(700, random(0, 2*PI)));
  }
  blur = loadShader("blur.glsl");
}

void draw(){
  //background(0);
  //filter(blur);
  stroke(255,0);
  fill(255);
  lights();
  directionalLight(55,105,155,0,-0.5,0.5);
  smooth();

  translate(width/2, height/4);
  for(int i = 0; i<particles.size(); i++){
    particles.get(i).travel(mode);
  }
  c++;
}

boolean sketchFullScreen(){
  return true;
}

void keyPressed(){
  background(0);
  if(key == '1'){
    background(0);
    if(flag){
      camera(0, -height, (height/2.0) / tan(PI*30.0 / 180.0), width/2, height/2, 0.0, 0.0, 1.0, 0.0);
      flag = false;
    }
    else{
      camera();
      flag = true;
    }
  }
  if(key == 'v' || key == 'V')
    mode = "vortex";
  if(key == 't' || key == 'T')
    mode = "trench";
    
  reset();
}

void reset(){
  particles.clear();
  for(int i = 0; i<1; i++){
    particles.add(new Particle(700, random(0, 2*PI)));
  }
}
