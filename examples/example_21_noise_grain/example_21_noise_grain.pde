PShader myShader;
PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("shader.glsl");
}

void draw() {
  image(img, 0, 0);

  // animate grain each frame so it doesn't look frozen
  myShader.set("uTime", millis() / 1000.0);

  // mouseX controls how much grain overlays the image
  float crossfade = map(mouseX, 0, width, 0.0, 1.0);
  myShader.set("uCrossfade", crossfade);

  filter(myShader);
}
