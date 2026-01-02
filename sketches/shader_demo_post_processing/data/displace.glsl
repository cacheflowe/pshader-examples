uniform sampler2D texture;
varying vec4 vertTexCoord;
uniform float uPhase;

void main() {
  vec2 uv = vertTexCoord.xy;
  
  // Apply a sine wave distortion to the UV coordinates
  // When a float is multiplied by a vec2, it multiplies both components
  float frequency = 6.0;
  float amp = 0.1;
  vec2 displace = vec2(
    cos(uPhase + uv.y * frequency), 
    sin(uPhase + uv.x * frequency)
  ); 
  uv += displace * amp;

  // sample the color from the texture with the warped UVs
  gl_FragColor = texture2D(texture, uv);
}