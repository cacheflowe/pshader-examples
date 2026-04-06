varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float uDisplaceAmp;

void main() {
  // sample color from the image being drawn
  vec2 uv = vertTexCoord.xy;

  // Apply a sine wave distortion to the UV coordinates
  float frequency = 6.0;
  vec2 displace = vec2(cos(uv.y * frequency), sin(uv.x * frequency));
  uv += displace * uDisplaceAmp;

  // draw to screen by sampling the texture at the displaced UVs
  gl_FragColor = texture2D(texture, uv);
}
