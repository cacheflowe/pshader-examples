
void setup() {
  size(640, 480, P3D);
}

void draw() {
  // draw a rectangle in the center of the screen, at a bit of a 3d tilt, with colored arrows showing the normals
  background(180);
  // lights();
  drawRectangleNormals();
  // drawSphereNormals();
}

void drawRectangleNormals() {
  translate(width * 0.55, height * 0.4, 0);
  // rotateX(-PI/6);
  // rotateY(PI/5);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -TWO_PI, TWO_PI));

  // draw rectangle
  float rectW = width * 0.6;
  float rectH = height * 0.4;
  fill(150);
  stroke(0);
  rect(-rectW/2, -rectH/2, rectW, rectH);

  // draw normals as colored arrows
  strokeWeight(3);
  stroke(255, 0, 0);
  float normalLength = 50;
  int normalColor = color(0, 0, 255);
  drawArrow(new PVector(-rectW/2, -rectH/2, 0), new PVector(-rectW/2, -rectH/2, normalLength), normalColor);
  drawArrow(new PVector(rectW/2, -rectH/2, 0), new PVector(rectW/2, -rectH/2, normalLength), normalColor);
  drawArrow(new PVector(rectW/2, rectH/2, 0), new PVector(rectW/2, rectH/2, normalLength), normalColor);
  drawArrow(new PVector(-rectW/2, rectH/2, 0), new PVector(-rectW/2, rectH/2, normalLength), normalColor);
}

void drawSphereNormals() {
  translate(width/2, height/2, 0);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -TWO_PI, TWO_PI));

  // draw sphere
  float sphereRadius = 150;
  int latSteps = 10;
  int lonSteps = 15;
  fill(150);
  stroke(0);
  sphereDetail(lonSteps, latSteps);
  sphere(sphereRadius);

  // draw normals as colored arrows
  rotateX(HALF_PI); // align sphere poles with y axis
  strokeWeight(2);
  stroke(255, 0, 0);
  int normalColor = color(0, 0, 255);
  for (int lat = 0; lat <= latSteps; lat++) {
    float theta = map(lat, 0, latSteps, 0, PI);
    for (int lon = 0; lon <= lonSteps; lon++) {
      float phi = map(lon, 0, lonSteps, 0, TWO_PI);
      // calculate vertex position on sphere surface
      float x = sphereRadius * sin(theta) * cos(phi);
      float y = sphereRadius * sin(theta) * sin(phi);
      float z = sphereRadius * cos(theta);
      PVector vertexPos = new PVector(x, y, z);
      // normal vector is just the normalized vertex position
      PVector normalVec = vertexPos.copy().normalize().mult(30); // scale normal length
      drawArrow(vertexPos, PVector.add(vertexPos, normalVec), normalColor);
    }
  }
}

void drawArrow(PVector base, PVector tip, color c) {
  stroke(c);
  line(base.x, base.y, base.z, tip.x, tip.y, tip.z);
  PVector arrowBack = PVector.lerp(tip, base, 0.2);
  // draw cone for arrowhead
  pushMatrix();
  translate(tip.x, tip.y, tip.z);
  
  // Direction the cone should point (from arrowBack to tip)
  PVector dir = PVector.sub(tip, arrowBack).normalize();
  
  // Align the cone (which points up +Z by default) with the direction vector
  // Use rotation from +Z axis to the desired direction
  PVector zAxis = new PVector(0, 0, 1);
  PVector rotAxis = zAxis.cross(dir);
  float rotAngle = PVector.angleBetween(zAxis, dir);
  
  // Only rotate if the vectors aren't parallel
  if (rotAxis.mag() > 0.001) {
    rotate(rotAngle, rotAxis.x, rotAxis.y, rotAxis.z);
  } else if (dir.z < 0) {
    // If pointing in -Z direction, rotate 180 degrees
    rotateX(PI);
  }
  
  fill(c);
  noStroke();
  cone(5, PVector.dist(tip, arrowBack));
  popMatrix();
}

// function to draw a cone at the origin, pointing up the z axis
void cone(float radius, float height) {
  int sides = 20;
  beginShape(TRIANGLE_FAN);
  vertex(0, 0, height); // tip of cone
  for (int i = 0; i <= sides; i++) {
    float angle = TWO_PI * i / sides;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    vertex(x, y, 0);
  }
  endShape();
}

void mousePressed() {
  saveFrame("../../images/"+sketchFile("").getName()+"-####.png");
}
