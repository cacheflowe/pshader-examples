#define PROCESSING_POINT_SHADER

uniform mat4 projection;
uniform mat4 modelview;

uniform float uPointRadius;

attribute vec4 vertex;
attribute vec4 color;
attribute vec2 offset;

varying vec4 vertColor;

void main() {
  vec4 pos = modelview * vertex;
  vec4 clip = projection * pos;

  // apply uPointRadius to the per-vertex offset, then project into clip space
  vec2 of = offset * uPointRadius;
  gl_Position = clip + projection * vec4(of, 0.0, 0.0);

  vertColor = color;
}
