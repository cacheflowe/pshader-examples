varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 uMouseOffset;

void main() {
  // Get the UV coordinates from the vertex shader
  // and adjust the UV coordinates based on the mouse position
  vec2 uv = vertTexCoord.xy + uMouseOffset;
  // Sample the texture at the adjusted texture coordinates
  vec4 color = texture2D(texture, uv);
  // Multiply the RGB color by the brightness uniform, but leave alpha unchanged
  gl_FragColor = color;
}
