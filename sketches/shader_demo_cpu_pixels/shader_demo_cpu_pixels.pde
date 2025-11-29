PImage myImage;

void setup() {
  size(640, 480);
  myImage = loadImage("data/cool-cat.jpg");
}

void draw() {
  int time = millis();
  image(myImage, 0, 0);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y * width;
      float r = red(pixels[loc]);
      // float g = green(pixels[loc]);
      // float b = blue(pixels[loc]);
      pixels[loc] =  color(r,r,r);
    }
  }
  updatePixels();
  if(frameCount == 10) {
    println(millis() - time);
  }
}
