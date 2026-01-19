PImage myImage;
PShader myShader;

void setup() {
  size(640, 480, P2D);
  myImage = loadImage("cool-cat.jpg");
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
