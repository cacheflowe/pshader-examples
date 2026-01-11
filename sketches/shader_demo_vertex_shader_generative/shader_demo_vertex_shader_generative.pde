PImage img;
PShader myShader;

void setup() {
  size(640, 360, P3D);
  myShader = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  background(0);
  
  // set center of screen as 3d world origin
  translate(width/2, height/2, -100);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));

  // Update shader uniform and apply shader to the context 
  myShader.set("uTime", (float) millis());
  myShader.set("uDisplaceAmp", 100.0);
  shader(myShader);

  // Draw a subdivided mesh grid
  fill(255);
  noStroke();
  float cellSize = 20;  // Reduced from 30 to 10 for higher resolution
  int cols = (int)(width / cellSize);
  int rows = (int)(height / cellSize);
  
  // Create mesh using quads
  beginShape(QUADS);
  for(int row = 0; row < rows; row++) {
    for(int col = 0; col < cols; col++) {
      float x = col * cellSize - width / 2;
      float y = row * cellSize - height / 2;
      
      // Create a quad with 4 vertices
      vertex(x, y, 0);
      vertex(x + cellSize, y, 0);
      vertex(x + cellSize, y + cellSize, 0);
      vertex(x, y + cellSize, 0);
    }
  }
  endShape();
  
  resetShader();
}
