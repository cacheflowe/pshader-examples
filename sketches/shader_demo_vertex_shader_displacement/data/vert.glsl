// processing-provided variables
uniform mat4 transformMatrix;
uniform mat4 texMatrix;
uniform sampler2D texture;

attribute vec4 position;
attribute vec2 texCoord;

varying vec4 vertTexCoord;

// custom uniforms
uniform float uDisplaceAmp;

void main() {
  // sample texture color at the vertex's UV coordinate
  vec4 texColor = texture2D(texture, texCoord.xy);

  // for a sphere, displace vertex position based on texture's green channel
  vec3 positionDisplaced = position.xyz;
  positionDisplaced.xyz *= 1. + uDisplaceAmp * texColor.g;
  gl_Position = transformMatrix * vec4(positionDisplaced, position.w);

  // pass texture coordinates to fragment shader
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}