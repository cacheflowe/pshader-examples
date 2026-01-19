PImage img;
PShader myShader;

void setup() {
  size(640, 480, P2D);
  img = loadImage("cool-cat.jpg");
  myShader = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  background(0);

  // Update shader uniform and apply shader to the context 
  float displaceAmp = map(mouseX, 0, width, 0, 50);
  myShader.set("uDisplaceAmp", displaceAmp);
  myShader.set("uTime", (float) millis());
  shader(myShader);

  // draw a circle with custom UV coordinates
  noStroke();
  textureMode(NORMAL);
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
