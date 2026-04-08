// point shaders use separate projection and modelview matrices
// instead of the combined transformMatrix used in other shader types
uniform mat4 projectionMatrix;
uniform mat4 modelviewMatrix;
uniform vec4 viewport;     // canvas dimensions — needed to convert radius to clip space

uniform float uPointRadius;
uniform float uTime;

attribute vec4 position;
attribute vec4 color;
attribute vec2 offset;     // corner offset for this vertex within the point quad
                           // Processing expands each point() call into 4 vertices

varying vec4 vertColor;

void main() {
  vec4 eyePos  = modelviewMatrix * position;
  vec4 clipPos = projectionMatrix * eyePos;

  // convert radius from screen pixels to clip space
  // clip.w / (0.5 * viewport.zw) is the scale factor from pixels to clip coordinates
  vec2 screenScale = clipPos.w / (0.5 * viewport.zw);
  gl_Position.xy = clipPos.xy + offset.xy * uPointRadius * screenScale;
  gl_Position.zw = clipPos.zw;

  // animate color based on position and time
  float brightness = 0.5 + 0.5 * sin(position.x * 0.02 + uTime);
  vertColor = vec4(color.rgb * brightness, color.a);
}
