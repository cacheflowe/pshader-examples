PImage myImage;
PShader myShader;

void setup() {
  size(640, 360, P2D);
  myImage = loadImage("cool-cat.jpg");
  myShader = loadShader("shader.glsl"); 
}

void draw() {
  image(myImage, 0, 0);
  filter(myShader);  
}
