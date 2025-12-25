PImage img;
PShader uvRepeatShader;

void setup() {
  size(640, 360, P2D);
  img = loadImage("cool-cat.jpg");
  uvRepeatShader = loadShader("uv-adjust.glsl");
}

void draw() {
  // Alternate between REPEAT and CLAMP every 60 frames
  if(frameCount % 120 < 60) {
    // When UV coordinates go outside 0.0 - 1.0 range, repeat the texture.
    // This behaves like modulo in Java, or fract() in glsl
    textureWrap(REPEAT);
  } else {
    // default is CLAMP
    textureWrap(CLAMP); 
  }

  // draw a scene to be post-processed
  image(img, 0, 0);
  
  // adjust UVs to show repeating vs clamping behavior
  float mouseOffsetX = map(mouseX, 0, width, 1.0, -1.0);
  float mouseOffsetY = map(mouseY, 0, height, -1.0, 1.0);
  uvRepeatShader.set("uMouseOffset", mouseOffsetX, mouseOffsetY);
  filter(uvRepeatShader);
}
