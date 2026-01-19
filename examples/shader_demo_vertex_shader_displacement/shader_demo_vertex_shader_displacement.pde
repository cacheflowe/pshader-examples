PImage img;
PShader myShader;
PShape globe;

void setup() {
  size(640, 480, P3D);
  img = loadImage("blue-marble.png");
  myShader = loadShader("frag.glsl", "vert.glsl");
  
  // build a texture-mapped sphere using PShape
  sphereDetail(80);
  globe = createShape(SPHERE, 150);
  globe.setTexture(img);
  globe.setStroke(color(0, 0));  
}

void draw() {
  background(0);

  // set center of screen as 3d world origin
  translate(width/2, height/2, -100);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));

  // Update shader uniform and apply shader to the context 
  myShader.set("uDisplaceAmp", map(sin(millis() * 0.001), -1, 1, 0, 0.2));
  shader(myShader);

  // draw a textured sphere
  shape(globe);
  
  resetShader();
}
