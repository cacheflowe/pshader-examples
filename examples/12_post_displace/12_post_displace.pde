PShader myShader;
PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("displace.glsl");
}

void draw() {
  image(img, 0, 0);

  // Animate the displacement phase over time
  myShader.set("uPhase", frameCount * 0.05);
  filter(myShader);
}
