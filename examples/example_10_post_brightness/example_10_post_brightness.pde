PShader myShader;
PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("brightness.glsl");
}

void draw() {
  // Draw a scene to be processed
  image(img, 0, 0);

  // Map mouseX to a brightness value between 0.0 (black) and 2.0 (2x brightness)
  float brightVal = map(mouseX, 0, width, 0.0, 2.0);
  myShader.set("uBrightness", brightVal);
  filter(myShader);
}
