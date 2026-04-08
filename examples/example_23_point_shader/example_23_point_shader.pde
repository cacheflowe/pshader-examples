PShader myShader;

void setup() {
  size(640, 480, P2D);
  myShader = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  background(20);

  // target point() calls specifically — shader() without POINTS would affect all geometry
  shader(myShader, POINTS);

  // mouseX controls point radius in pixels
  float radius = map(mouseX, 0, width, 2.0, 30.0);
  myShader.set("uPointRadius", radius);
  myShader.set("uTime", millis() / 1000.0);

  // draw a grid of points — the vertex shader sizes them on the GPU
  stroke(255);
  int spacing = 24;
  for (int x = spacing; x < width; x += spacing) {
    for (int y = spacing; y < height; y += spacing) {
      point(x, y);
    }
  }

  resetShader();
}
