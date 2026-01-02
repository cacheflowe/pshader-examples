varying vec4 vertTexCoord;
uniform sampler2D texture;

void main() {
  // sample color from the image being drawn, 
  // based on geometry's custom UV coords
  vec2 uv = vertTexCoord.xy;

  // draw color to screen
  gl_FragColor = texture2D(texture, uv);
}
