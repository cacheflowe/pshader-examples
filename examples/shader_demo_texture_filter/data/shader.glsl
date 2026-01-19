varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float brightness;

void main() {
  vec2 uv = vertTexCoord.xy;
  vec4 color = texture2D(texture, uv);
  gl_FragColor = vec4(color.r, color.r, color.r, 1.0);
  // gl_FragColor = vec4(color.xxx, 1.0);
  // gl_FragColor = vec4(color.sss, 1.0);
  color.rb *= 0.0;
  gl_FragColor = vec4(color.rgb, 1.0);
}
