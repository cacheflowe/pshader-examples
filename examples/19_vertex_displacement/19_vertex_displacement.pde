PImage img;
PShader myShader;
PShape globe;

void setup() {
  size(640, 480, P3D);
  img = loadImage("moon-nasa.jpg");

  // load shader and set on context
  // no need to resetShader() later since we're only drawing with the shader
  myShader = loadShader("frag.glsl", "vert.glsl");
  shader(myShader);
  
  // build a texture-mapped sphere using PShape
  sphereDetail(80); // increase detail for smoother sphere
  globe = createShape(SPHERE, 150);
  globe.setTexture(img);
  globe.setStroke(color(0, 0)); // invisible stroke
}

void draw() {
  background(0);

  // set center of screen as 3d world origin
  translate(width/2, height/2, -100);

  // rotate based on mouse position
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));

  // Update shader uniform and activate shader
  myShader.set("uDisplaceAmp", map(sin(millis() * 0.001), -1, 1, 0, 0.75));

  // draw the textured sphere with displacement
  shape(globe);
}
