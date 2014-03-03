ArrayList<Particle> particles;
int c = 0;
PShader blur;

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
    particles.get(i).travel();
  }
  c++;
}

boolean sketchFullScreen(){
  return true;
}
