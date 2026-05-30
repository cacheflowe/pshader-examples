PImage img;
PShader myShader;

void setup() {
  size(640, 480, P2D);
  myShader = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  background(0);

  // Update shader uniform and apply shader to the context 
  myShader.set("uMouse", (float) mouseX, (float) mouseY);
  shader(myShader);

  // Draw a rectangle with a different fill color on each vertex
  // Colors here mimic the "UV map" so the interpolation between
  // vertices is clearly illustrated
  noStroke();
  beginShape();
  // black at top-left corner
  fill(0, 0, 0);
  vertex(width * 0.2, height * 0.2, 0, 0);
  // green at top-right corner
  fill(255, 0, 0);
  vertex(width * 0.8, height * 0.2, 1, 0);
  // yellow at bottom-right corner
  fill(255, 255, 0);
  vertex(width * 0.8, height * 0.8, 1, 1);
  // green at bottom-left corner
  fill(0, 255, 0);
  vertex(width * 0.2, height * 0.8, 0, 1);
  endShape(CLOSE);
  
  resetShader();
}
