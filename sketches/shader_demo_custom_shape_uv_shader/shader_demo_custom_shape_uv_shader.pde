PImage img;
PShader myShader;

void setup() {
  size(640, 360, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("shader.glsl");
}

void draw() {
  background(0);

  // draw a circle with custom UV coordinates
  textureMode(NORMAL);
  textureWrap(REPEAT);
  
  // update shader uniform
  float displaceAmp = map(mouseX, 0, width, -0.25, 0.25);
  myShader.set("uDisplaceAmp", displaceAmp);
  shader(myShader);

  // move geometry around a little bit, for fun effect
  float shapeX = map(mouseX, 0, width, -200, 200);
  float shapeY = map(mouseY, 0, height, -100, 100);
  translate(shapeX, shapeY);

  // apply shader to the context, and draw custom geometry
  noStroke();
  beginShape();
  texture(img);
  int circleResolution = 36;
  float radius = 150;
  for (int i = 0; i <= circleResolution; i++) {
    // calculate vertex positions around circle
    float angle = TWO_PI * i / circleResolution;
    float x = width/2 + cos(angle) * radius;
    float y = height/2 + sin(angle) * radius;
    
    // map UVs to circle shape
    // and correct for image aspect ratio, so the image doesn't look squished
    float aspect = float(img.width) / float(img.height);
    float u = 0.5 + cos(angle) * 0.5 / aspect;
    float v = 0.5 + sin(angle) * 0.5;
    
    // draw each vertex position and UV coords
    vertex(x, y, u, v);
  }
  endShape(CLOSE);
  
  resetShader();
}
