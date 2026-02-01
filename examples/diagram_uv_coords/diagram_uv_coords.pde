void setup() {
  size(640, 480, P3D);
}

void draw() {
  background(180);
  drawUvCoords();
}

// draw a grid with uv coordinates as colored arrows
void drawUvCoords() {
  float rectW = width - 200;
  float rectH = height - 200;
  int cols = 16;
  int rows = 10;
  float cellSize = rectW / cols;
  stroke(0);
  fill(150);
  strokeWeight(2);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = 100 + i * cellSize;
      float y = 100 + j * cellSize;
      // uv coordinates range from 0 to 1 across the rectangle
      float u = (float)i / cols;  
      float v = (float)j / rows;
      // draw rect for pixel
      fill(u * 255, 255 - v * 255, 0);
      rect(x, y, cellSize, cellSize);
    }
  }

  // draw labels at each corner of the outer rectangle, describing the extents of the UV coordinates
  fill(0);
  textSize(24);
  // top left
  textAlign(CENTER, BOTTOM);
  text("(0, 1)", 100, 100 - 16);
  // top right
  textAlign(CENTER, BOTTOM);
  text("(1, 1)", 100 + rectW, 100 - 16);
  // bottom right
  textAlign(CENTER, TOP);
  text("(1, 0)", 100 + rectW, 100 + rectH + 8);
  // bottom left
  textAlign(CENTER, TOP);
  text("(0, 0)", 100, 100 + rectH + 8);
}

void mousePressed() {
  saveFrame("../../images/"+sketchFile("").getName()+"-####.png");
}

