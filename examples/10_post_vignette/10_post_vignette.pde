PShader myShader;
PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("vignette.glsl");
}

void draw() {
  image(img, 0, 0);
  filter(myShader);
}
