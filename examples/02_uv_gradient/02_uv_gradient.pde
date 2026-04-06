PShader myShader;

void setup() {
  size(640, 480, P2D);
  myShader = loadShader("shader.glsl"); 
}

void draw() {
  filter(myShader);
}
