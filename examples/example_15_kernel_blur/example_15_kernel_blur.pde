PShader myShader;
PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("shader.glsl");
}

void draw() {
  image(img, 0, 0);

  // mouseX scales how far the kernel reaches — 0 = sharp, 5 = very blurry
  float blurAmount = map(mouseX, 0, width, 0.0, 5.0);
  myShader.set("uBlurAmount", blurAmount);

  filter(myShader);
}
