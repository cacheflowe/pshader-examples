PShader myShader;
PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("tile.glsl");
}

void draw() {
  image(img, 0, 0);

  // Map mouseX to a tiling value between 1.0 (no tiling) and 4.0 (4x4 tiles)
  float tilesVal = map(mouseX, 0, width, 1.0, 4.0);
  myShader.set("uTiles", tilesVal);
  filter(myShader);
}
