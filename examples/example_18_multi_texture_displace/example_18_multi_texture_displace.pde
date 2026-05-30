PImage img;
PGraphics displaceMap;
PShader myShader;
PShader noiseShader;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  displaceMap = createGraphics(width, height, P2D);
  myShader = loadShader("shader.glsl");
  noiseShader = loadShader("noise.glsl");
  textureMode(REPEAT);
}

void draw() {
  // Generate animated noise on the displacement map using a shader
  noiseShader.set("uTime", (float) millis() / 1000.0);
  noiseShader.set("uScale", map(mouseY, 0, height, 0.5, 8.0));
  displaceMap.filter(noiseShader);

  if (mousePressed) {
    // draw the displacement map
    image(displaceMap, 0, 0);
  } else {
    // Draw the source image
    image(img, 0, 0, width, height);

    // Then apply displacement via filter()
    myShader.set("uDisplaceMap", displaceMap);
    myShader.set("uDisplaceAmt", (float) mouseX / width);
    filter(myShader);
  }
}
