PShader myShader;
float smoothSpeedX = 0;
float smoothSpeedY = 0;

void setup() {
  size(640, 480, P2D);
  myShader = loadShader("shader.glsl");
}

void draw() {
  // normalize mouse position (flip y for GLSL coordinates)
  float mx = (float) mouseX / width;
  float my = 1.0 - (float) mouseY / height;
  myShader.set("uMouse", mx, my);

  // smooth the mouse speed for fluid animation
  smoothSpeedX = lerp(smoothSpeedX, (float)(mouseX - pmouseX) / width, 0.2);
  smoothSpeedY = lerp(smoothSpeedY, (float)(pmouseY - mouseY) / height, 0.2);
  myShader.set("uSpeed", smoothSpeedX, smoothSpeedY);

  // pass aspect ratio for proper circle shape
  myShader.set("uAspect", (float) width / height);

  filter(myShader);
}
