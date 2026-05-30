PShader myShader;

void setup() {
  size(640, 480, P2D);
  myShader = loadShader("shader.glsl");
}

void draw() {
  // pass resolution and normalized mouse position into the shader
  // flip the y coordinate because in Processing, (0, 0) is the top left, but in GLSL it's the bottom left
  myShader.set("uResolution", (float) width, (float) height);
  myShader.set("uMouse", (float) mouseX / width, 1.0 - (float) mouseY / height);
  filter(myShader);
}
