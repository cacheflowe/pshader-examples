PShader myShader;

void setup() {
  size(640, 480, P3D);
  myShader = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  background(20);

  // target point() calls specifically — shader() without POINTS would affect all geometry
  shader(myShader, POINTS);

  // pass mouse position and max radius to the vertex shader
  // also offset mouse coordinates to be centered on canvas to match the camera position
  myShader.set("uMouse", float(mouseX) - width / 2.0, float(mouseY) - height / 2.0);
  myShader.set("uMaxRadius", 20.0);

  // draw a grid of points — the vertex shader sizes each one based on distance to mouse
  stroke(255);
  int spacing = 24;
  for (int x = spacing; x < width; x += spacing) {
    for (int y = spacing; y < height; y += spacing) {
      point(x, y);
    }
  }

  resetShader();
}
