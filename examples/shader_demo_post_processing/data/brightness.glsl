varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float brightness;

void main() {
  // Sample the texture at the given texture coordinates
  vec4 color = texture2D(texture, vertTexCoord.xy);
  // Multiply the RGB color by the brightness uniform, but leave alpha unchanged
  gl_FragColor = vec4(color.rgb * brightness, color.a);
  // Try changing just one color component for interesting effects!
  // gl_FragColor = vec4(color.r * brightness,  color.g, color.b, color.a);
}
