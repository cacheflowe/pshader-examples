PImage img1;
PImage img2;
PShader myShader;

void setup() {
  size(640, 480, P2D);
  img1 = loadImage("cool-cat.jpg");
  img2 = loadImage("moon-nasa.jpg");
  myShader = loadShader("shader.glsl");
}

void draw() {
  background(0);

  // Set the shader and pass a second texture
  shader(myShader);
  myShader.set("uTexture2", img2);
  myShader.set("uMix", (float) mouseX / width);

  // Draw the first image - it becomes the default `texture` uniform
  image(img1, 0, 0, width, height);

  resetShader();
}
