PImage img;
PShader brightnessShader;
PShader tilingShader;
PShader vignetteShader;
PShader displaceShader;

void setup() {
  size(640, 360, P2D);
  img = loadImage("cool-cat.jpg");
  brightnessShader = loadShader("brightness.glsl");
  tilingShader = loadShader("tiling.glsl");
  vignetteShader = loadShader("vignette.glsl");
  displaceShader = loadShader("displace.glsl");
}

void draw() {
  // When UV coordinates go outside 0.0 - 1.0 range, repeat the texture.
  // This behaves like modulo in Java, or fract() in glsl
  textureWrap(REPEAT); // default is CLAMP

  // draw a scene to be post-processed
  image(img, 0, 0);
  
  // apply post-processing shaders in sequence
  // Map mouseY to a tiling value between 1.0 (no tiling) and 4.0 (4x4 tiles)
  float tilesVal = map(mouseY, 0, height, 1.0, 4.0);
  tilingShader.set("tiles", tilesVal);
  filter(tilingShader);
  
  // Map mouseX to a brightness value between 0.0 (black) and 2.0 (2x brightness)
  float brightVal = map(mouseX, 0, width, 0.0, 3.0);
  brightnessShader.set("brightness", brightVal);
  filter(brightnessShader);
  
  displaceShader.set("uPhase", frameCount * 0.05);
  filter(displaceShader);

  vignetteShader.set("tiles", brightVal);
  filter(vignetteShader);
}
