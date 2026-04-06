ArrayList<PVector> vertices = new ArrayList<PVector>();
ArrayList<PVector> colors = new ArrayList<PVector>();

void setup() {
  size(640, 480, P3D);
  vertices.add(new PVector(0.5, 0.1));
  vertices.add(new PVector(0.88, 0.82));
  vertices.add(new PVector(0.12, 0.82));
  colors.add(new PVector(255, 0, 0));
  colors.add(new PVector(0, 255, 0));
  colors.add(new PVector(0, 0, 255));
}

void draw() {
  background(180);
  drawGrid();
  drawVertices();
}

// draw a grid with uv coordinates as colored arrows
void drawGrid() {
  float rectW = width - 200;
  float rectH = height - 200;
  int cellSize = 20;
  int cols = (int)(rectW / cellSize);
  int rows = (int)(rectH / cellSize);
  stroke(0, 80);
  fill(150);
  strokeWeight(2);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = 100 + i * cellSize;
      float y = 100 + j * cellSize;
      // fill or no fill - is it inside the triangle or anti-aliased on the edge?
      boolean insidePolygon = insidePolygon(new PVector((x + cellSize/2 - 100) / rectW, (y + cellSize/2 - 100) / rectH), vertices);
      boolean intersectsEdge = rectIntersectsLine(x, y, cellSize, cellSize, 100 + vertices.get(0).x * rectW, 100 + vertices.get(0).y * rectH, 100 + vertices.get(1).x * rectW, 100 + vertices.get(1).y * rectH) ||
                                rectIntersectsLine(x, y, cellSize, cellSize, 100 + vertices.get(1).x * rectW, 100 + vertices.get(1).y * rectH, 100 + vertices.get(2).x * rectW, 100 + vertices.get(2).y * rectH) ||
                                rectIntersectsLine(x, y, cellSize, cellSize, 100 + vertices.get(2).x * rectW, 100 + vertices.get(2).y * rectH, 100 + vertices.get(0).x * rectW, 100 + vertices.get(0).y * rectH);
      float distFromEdge = aaAlpha(cellSize, rectW, rectH);
      if (insidePolygon || intersectsEdge) {
        // fill(150, 200);
        // interpolate colors based on distance to vertices
        float d0 = dist(x + cellSize/2, y + cellSize/2, 100 + vertices.get(0).x * rectW, 100 + vertices.get(0).y * rectH);
        float d1 = dist(x + cellSize/2, y + cellSize/2, 100 + vertices.get(1).x * rectW, 100 + vertices.get(1).y * rectH);
        float d2 = dist(x + cellSize/2, y + cellSize/2, 100 + vertices.get(2).x * rectW, 100 + vertices.get(2).y * rectH);
        float sum = d0 + d1 + d2;
        float w0 = 1 - d0 / sum;
        float w1 = 1 - d1 / sum;
        float w2 = 1 - d2 / sum;
        float r = w0 * colors.get(0).x + w1 * colors.get(1).x + w2 * colors.get(2).x;
        float g = w0 * colors.get(0).y + w1 * colors.get(1).y + w2 * colors.get(2).y;
        float b = w0 * colors.get(0).z + w1 * colors.get(1).z + w2 * colors.get(2).z;
        float alpha = distFromEdge < cellSize/2 ? map(distFromEdge, 0, cellSize/2, 255, 50) : 255;
        if (insidePolygon) alpha = 255;
        fill(r, g, b, alpha);
        fill(alpha);
      } else {
        noFill();
      }
      // float u = (float)i / cols;  
      // float v = (float)j / rows;
      // draw rect for pixel
      rect(x, y, cellSize, cellSize);
    }
  }
}

void drawVertices() {
  stroke(0);
  strokeWeight(4);
  beginShape();
  noFill();
  for (int i=0; i < vertices.size(); i++) {
    PVector v = vertices.get(i);
    PVector c = colors.get(i);
    // fill(c.x, c.y, c.z);
    float x = 100 + v.x * (width - 200);
    float y = 100 + v.y * (height - 200);
    vertex(x, y, 0);
  }
  endShape(CLOSE);
}

boolean insidePolygon(PVector point, ArrayList<PVector> polygon) {
  int n = polygon.size();
  boolean inside = false;
  for (int i = 0, j = n - 1; i < n; j = i++) {
    PVector pi = polygon.get(i);
    PVector pj = polygon.get(j);
    if ((pi.y > point.y) != (pj.y > point.y) &&
        (point.x < (pj.x - pi.x) * (point.y - pi.y) / (pj.y - pi.y) + pi.x)) {
      inside = !inside;
    }
  }
  return inside;
}

boolean rectIntersectsLine(float rx, float ry, float rw, float rh, float x1, float y1, float x2, float y2) {
  // Check if the line intersects any of the rectangle's edges
  return lineIntersectsLine(rx, ry, rx + rw, ry, x1, y1, x2, y2) ||
          lineIntersectsLine(rx + rw, ry, rx + rw, ry + rh, x1, y1, x2, y2) ||
          lineIntersectsLine(rx + rw, ry + rh, rx, ry + rh, x1, y1, x2, y2) ||
          lineIntersectsLine(rx, ry + rh, rx, ry, x1, y1, x2, y2);
}

boolean lineIntersectsLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  // Calculate the direction vectors
  float dx1 = x2 - x1;
  float dy1 = y2 - y1;
  float dx2 = x4 - x3;
  float dy2 = y4 - y3;

  // Calculate the determinant
  float det = dx1 * dy2 - dy1 * dx2;
  if (det == 0) {
    return false; // Lines are parallel
  }

  // Calculate the intersection point
  float t = ((x3 - x1) * dy2 - (y3 - y1) * dx2) / det;
  float u = ((x3 - x1) * dy1 - (y3 - y1) * dx1) / det;

  return (t >= 0 && t <= 1 && u >= 0 && u <= 1);
}

float aaAlpha(int cellSize, float rectW, float rectH) {
  // Calculate anti-aliasing alpha based on distance to edge
  float distFromEdge = Float.MAX_VALUE;
  for (int k = 0; k < vertices.size(); k++) {
    PVector v1 = vertices.get(k);
    PVector v2 = vertices.get((k + 1) % vertices.size());
    float d = distToSegment(new PVector((v1.x + cellSize/2 - 100) / rectW, (v1.y + cellSize/2 - 100) / rectH), v1, v2);
    if (d < distFromEdge) {
      distFromEdge = d;
    }
  }
  return distFromEdge; 
}

float distToSegment(PVector p, PVector v, PVector w) {
  float l2 = PVector.dist(v, w) * PVector.dist(v, w);
  if (l2 == 0) return PVector.dist(p, v);
  float t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
  t = max(0, min(1, t));
  return PVector.dist(p, new PVector(v.x + t * (w.x - v.x), v.y + t * (w.y - v.y)));
}

void mousePressed() {
  saveFrame("../../images/"+sketchFile("").getName()+"-####.png");
}

