PImage myImage;

void setup() {
  size(640, 480, P2D);
  pixelDensity(1);
  myImage = loadImage("cool-cat.png");
}

void draw() {
  image(myImage, 0, 0);
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      float r = red(pixels[loc]);
      pixels[loc] =  color(0, r, 0); // set green channel to red value
    }
  }
  updatePixels();
}
