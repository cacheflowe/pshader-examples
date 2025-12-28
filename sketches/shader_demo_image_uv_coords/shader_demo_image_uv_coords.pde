PImage img;
PShader myShader;

void setup() {
  size(640, 360, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("shader.glsl");
}

void draw() {
  background(0);

  // Set the shader on the drawing context 
  // shader(myShader);
  
  float vOffset = frameCount * 0.01;
  
  // Specify custom UV coordinates for each vertex
  // Use normalized coordinates (0-1), like in GLSL
  textureMode(NORMAL); 
  // make sure UV coords repeat
  textureWrap(REPEAT); 
  
  // Draw textured vertices with vertically-scrolling UV.
  // In this example, the four corners are drawn in sequence, clockwise
  beginShape();
  texture(img);
  vertex(width * 0.1, height * 0.1, 0, 0 + vOffset); // top-left
  vertex(width * 0.9, height * 0.1, 1, 0 + vOffset); // top-right
  vertex(width * 0.9, height * 0.9, 1, 1 + vOffset); // bottom-right
  vertex(width * 0.1, height * 0.9, 0, 1 + vOffset); // bottom-left
  endShape();
  
  // draw tiled image via UV multiplication
  // https://processing.org/reference/texture_.html
  beginShape();
  texture(img);
  float numTiles = map(mouseX, 0, width, 1, 10);
  vertex(width * 0.1, height * 0.1, 0, 0);
  vertex(width * 0.9, height * 0.1, numTiles, 0);
  vertex(width * 0.9, height * 0.9, numTiles, numTiles);
  vertex(width * 0.1, height * 0.9, 0, numTiles);
  endShape();

  // reset the shader
  // resetShader();
  
  // image(img, 0, 0);
}
