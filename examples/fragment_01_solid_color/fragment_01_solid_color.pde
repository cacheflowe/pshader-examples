
// Let's declare the shader object
PShader myShader;

// Runs once
void setup() {
  // Dimensions of the window and renderer
  // You need to call the P2D or P3D renderers 
  // to be able to use shaders
  size(512, 512, P2D);

  // Add the specified shader file to the sketch. 
  // It has to be in a folder called "data" next to your .pde
  myShader = loadShader("solid_color.frag");
  
}

// Runs every frame
void draw() {
  // Apply myShader to the screen 
  filter(myShader);  
}
