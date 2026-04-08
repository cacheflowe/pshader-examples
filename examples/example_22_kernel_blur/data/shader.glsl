varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 texOffset;     // size of one pixel in UV space, provided automatically by Processing
uniform float uBlurAmount;

void main() {
  vec2 uv = vertTexCoord.st;

  // scale texOffset by blurAmount to control how far the kernel reaches
  vec2 px = texOffset * uBlurAmount;

  // sample the 3x3 grid of neighboring pixels around the current pixel
  // each variable is one step away from center in UV space
  vec4 c0 = texture2D(texture, uv + vec2(-px.x, -px.y));
  vec4 c1 = texture2D(texture, uv + vec2(  0.0, -px.y));
  vec4 c2 = texture2D(texture, uv + vec2(+px.x, -px.y));
  vec4 c3 = texture2D(texture, uv + vec2(-px.x,   0.0));
  vec4 c4 = texture2D(texture, uv + vec2(  0.0,   0.0)); // center pixel
  vec4 c5 = texture2D(texture, uv + vec2(+px.x,   0.0));
  vec4 c6 = texture2D(texture, uv + vec2(-px.x, +px.y));
  vec4 c7 = texture2D(texture, uv + vec2(  0.0, +px.y));
  vec4 c8 = texture2D(texture, uv + vec2(+px.x, +px.y));

  // weighted average: center gets most weight (4x), edges get 2x, corners get 1x
  // this is a 3x3 Gaussian blur kernel — weights sum to 16
  gl_FragColor = (      c0 + 2.0*c1 +       c2 +
                  2.0*c3 + 4.0*c4 + 2.0*c5 +
                        c6 + 2.0*c7 +       c8) / 16.0;

  // edge detection variation: subtract neighbors from the center
  // amplifies differences between pixels instead of averaging them
  // gl_FragColor = vec4((8.0*c4 - (c0+c1+c2+c3+c5+c6+c7+c8)).rgb, 1.0);
}
