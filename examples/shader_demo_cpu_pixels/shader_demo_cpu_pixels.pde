PImage myImage;

void setup() {
  size(640, 480);
  pixelDensity(1); // breaks w/2
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
      pixels[loc] =  color(0, r, 0);
    }
  }
  updatePixels();
  if(frameCount == 10) {
    println(millis() - time);
  }
}

void mousePressed() {
  saveFrame("../../images/"+sketchFile("").getName()+"-####.png");
}
