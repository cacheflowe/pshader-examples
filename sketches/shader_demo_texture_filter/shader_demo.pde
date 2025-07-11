PImage myImage;
PShader myShader;

void setup() {
  size(640, 360, P2D);
  myImage = loadImage("cool-cat.png");
  myShader = loadShader("shader.glsl"); 
}

void draw() {
  int time = millis();
  image(myImage, 0, 0);
  filter(myShader); 
  if(frameCount == 10) {
    println(millis() - time);
  }
}
