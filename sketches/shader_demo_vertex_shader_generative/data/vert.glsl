// processing-provided variables
uniform mat4 transformMatrix;

attribute vec4 vertex;
attribute vec3 normal;

varying vec4 vertColor;

// custom uniforms
uniform float uTime;
uniform float uDisplaceAmp;

void main() {
  // Calculate distance from center of world 
  // in original xy coords
  float dist = distance(vec2(0.), vertex.xy);
  dist *= 0.05;

  // sin function for circular wave, normalized & offset over time
  float phaseOffset = uTime * -0.003;
  float sinAmp = 0.5 + 0.5 * sin(phaseOffset + dist);

  // Use the sin amplitude to also create the vertex color 
  // and pass to fragment shader to match displacement
  vec4 finalColor = vec4(vec3(sinAmp), 1.);
  vertColor = finalColor;

  // Apply displacement in object space along Z axis
  // using the normal direction, which orients properly
  vec4 displacedvertex = vertex;
  displacedvertex.xyz += normal * (sinAmp * uDisplaceAmp); 
  gl_Position = transformMatrix * displacedvertex;
}