PShader myShader;

void setup() {
  size(640, 480, P2D);
  myShader = loadShader("shader.glsl");
}

void draw() {
  // Normalize mouseX to 0-1 to match the shader's coordinate system,
  // and pass that value to the shader via the "uSplitX" uniform
  myShader.set("uSplitX", mouseX / float(width));
  // or do it with time
  //myShader.set("uSplitX", (millis() / 1000.0) % 1.0);
  filter(myShader);
}
