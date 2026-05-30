#define PROCESSING_POINT_SHADER

uniform mat4 projection;
uniform mat4 modelview;

uniform vec2 uMouse;
uniform float uMaxRadius;

attribute vec4 vertex;
attribute vec4 color;
attribute vec2 offset;

varying vec4 vertColor;

void main() {
  vec4 pos = modelview * vertex;
  vec4 clip = projection * pos;

  // compare vertex screen position to mouse and grow points that are nearby
  float dist = distance(vertex.xy, uMouse);
  float radius = uMaxRadius * (1.0 - smoothstep(0.0, 200.0, dist));
  radius = max(radius, 2.0); // minimum visible size

  vec2 of = offset * radius;
  gl_Position = clip + projection * vec4(of, 0.0, 0.0);

  vertColor = color;
}
