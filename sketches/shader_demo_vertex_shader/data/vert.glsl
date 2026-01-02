// processing-provided variables
uniform mat4 transformMatrix;
uniform mat4 texMatrix;

attribute vec4 position;
attribute vec4 color;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec4 vertTexCoord;

// custom variables
uniform float uDisplaceAmp;
uniform float uTime;


void main() {
  // apply transformations to vertex position
  vec4 newPosition = position;
  
  // Apply a sine wave distortion to the vertices' original positions (only the .xy components)
  // Important note: position is in screen space, rather than normalized UV space like in the fragment shader
  float frequency = 0.015; // use a lower frequency for position space distortion
  float phaseX = uTime * 0.005;
  float phaseY = uTime * 0.007;
  vec2 displace = vec2(
    cos(position.y * frequency + phaseX), 
    sin(position.x * frequency + phaseY)
  );
  newPosition.xy += displace * uDisplaceAmp;

  // set final vertex position and pass varying data to fragment shader
  gl_Position = transformMatrix * newPosition;

  // Pass vertex color and texture coordinate along to fragment shader
  // This is default behavior in Processing, and shows the pipline between
  // geometry creation on the CPU, vertexs shader application, and final 
  // fragment shader rendering to the screen
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}