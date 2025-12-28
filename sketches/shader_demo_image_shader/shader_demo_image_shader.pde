PImage img;
PShader myShader;

void setup() {
  size(640, 360, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("shader.glsl");
}

void draw() {
  background(255, 0, 0);
  imageMode(CENTER);

  // Set the shader on the drawing context 
  shader(myShader);

  // Draw an image - the shader will adjust the way it's drawn
  // The `texture` uniform in the shader is automatically set to the PImage
  image(img, width/2, height/2, img.width/2, img.height/2);

  // reset the shader
  resetShader();
}
