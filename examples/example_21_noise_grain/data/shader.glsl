varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float uTime;
uniform float uCrossfade;

// GLSL has no built-in random() or noise() function.
// This is a common workaround: sin(dot()) produces values that appear
// random for different input coordinates. fract() keeps the result in 0.0-1.0.
float random(vec2 st) {
  return fract(sin(dot(st, vec2(17.0, 180.0))) * 2500.0 + uTime);
}

void main() {
  vec2 uv = vertTexCoord.xy;

  // sample the original image
  vec4 color = texture2D(texture, uv);

  // generate a random grayscale value at this pixel's location
  float grain = random(uv);

  // blend the original image with the grain based on the crossfade amount
  gl_FragColor = mix(color, vec4(vec3(grain), 1.0), uCrossfade);

  // try adding grain subtly on top of the image instead of replacing it
  // gl_FragColor = vec4(color.rgb + (grain - 0.5) * uCrossfade, 1.0);
}
