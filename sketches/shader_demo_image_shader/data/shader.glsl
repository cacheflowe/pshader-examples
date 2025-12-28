varying vec4 vertTexCoord;
uniform sampler2D texture;

void main() {
  // sample color from the image being drawn
  vec2 uv = vertTexCoord.xy;
  vec4 color = texture2D(texture, uv);

  // Set alpha based on red channel, which makes darker pixels more transparent
  color.a = color.r; 
  gl_FragColor = color;
}