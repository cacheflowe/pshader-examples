PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
}

void draw() {
  background(0);
  
  // Specify custom UV coordinates for each vertex
  // Use normalized coordinates (0-1), to match GLSL
  textureMode(NORMAL); 
  // set UV coords to repeat
  textureWrap(REPEAT); 
    
  // draw tiled image via UV multiplication
  // https://processing.org/reference/texture_.html
  float numTiles = map(mouseX, 0, width, 1, 10);
  beginShape();
  texture(img);
  vertex(0, 0, 0, 0);
  vertex(width, 0, numTiles, 0);
  vertex(width, height, numTiles, numTiles);
  vertex(0, height, 0, numTiles);
  endShape();
}
