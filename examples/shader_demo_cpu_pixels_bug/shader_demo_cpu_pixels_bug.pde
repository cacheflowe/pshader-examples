PImage myImage;

void setup() {
  size(640, 480);
  //pixelDensity(1); // breaks w/2
}

void draw() {
  background(0);
  fill(255, 255, 0);
  rect(100, 100, width - 200, height - 200);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y * width;
      float r = red(pixels[loc]);
      pixels[loc] =  color(r,r,r);
    }
  }
  updatePixels();
}
