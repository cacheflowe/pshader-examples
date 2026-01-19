PShader myShader;

void setup() {
  size(640, 360, P2D);
  myShader = loadShader("shader.glsl");
}

void draw() {
  background(0);

  // Set the shader on the global context - 
  // any shapes drawn will use this shader
  shader(myShader);

  // Draw a rectangle that uses the shader.
  // A rectangle has UV coordinates that go from
  // (0,0) in the top-left to (1,1) in the bottom-right
  // Any original fill color is discarded in this example 
  float rectW = 150 + 50 * sin(frameCount * 0.05);
  rect(100, 100, rectW, 200);
  
  // Now draw a custom shape with custom UV coordinates
  // per-vertex, which will affect how the shader maps
  // the UVs within the shape when using `vertTexCoord`
  beginShape();
  vertex(450, 100, 0.5, 0); // top-center
  vertex(550, 200, 1, 0.5); // middle-right
  vertex(450, 300, 0.5, 1); // bottom-center
  vertex(350, 200, 0, 0.5); // middle-left
  endShape(CLOSE);

  // reset the shader - this is like using pop() to reset 
  // colors and transformations after push()
  resetShader();
}
