// processing-provided variables
uniform mat4 transformMatrix;

attribute vec4 position;
attribute vec4 color;

varying vec4 vertColor;

// custom uniforms
uniform vec2 uMouse;

void main() {
  gl_Position = transformMatrix * position;

  // Calculate distance between mouse and vertex position
  float dist = distance(uMouse, position.xy);

  // Use distance to modify vertex color's rgb components - closer vertices are brighter
  // Create a new `finalColor` variable to hold the adjusted color, since attributes are read-only
  float maxDist = 200.;
  float brightness = 1.0 - dist / maxDist;
  brightness = clamp(brightness, 0.0, 1.0); // clamp is like Processing's constrain()
  vec4 finalColor = color; // copy original color
  finalColor.xyz += vec3(brightness);

  // adjust the original vertex color and pass to fragment shader
  vertColor = finalColor;
}