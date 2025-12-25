uniform sampler2D texture;
varying vec4 vertTexCoord;
uniform float tiles;

void main() {
  vec2 uv = vertTexCoord.xy;

  // Multiply UVs by the number of tiles (e.g., 0-1 becomes 0-4)
  // Then take the fractional part to reset the range to 0-1 four times
  vec2 tiledUV = fract(uv * tiles);

  vec4 color = texture2D(texture, tiledUV);
  gl_FragColor = color;
}