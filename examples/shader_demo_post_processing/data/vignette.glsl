uniform sampler2D texture;
varying vec4 vertTexCoord;

void main() {
  // Get the UV coordinates and sample the texture
  vec2 uv = vertTexCoord.xy;
  vec4 color = texture2D(texture, uv);

  // Calculate this pixel's distance from the center (0.5, 0.5)
  vec2 center = vec2(0.5, 0.5);
  float dist = distance(uv, center);

  // Invert the distance so the center is kept to the 
  // original color (by multiplying by 1), and edges 
  // are darker by multiplying downward with distance.
  float vignette = 1.0 - (dist * 1.5);

  gl_FragColor = vec4(color.rgb * vignette, 1.0);
}
