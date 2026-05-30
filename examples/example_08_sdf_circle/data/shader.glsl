#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform vec2 uResolution;
uniform vec2 uMouse;

void main() {
  // calculate aspect ratio from canvas size
  float aspect = uResolution.x / uResolution.y;

  // correct for aspect ratio so the circle isn't stretched
  vec2 uv = vertTexCoord.xy;
  uv.x *= aspect;
  vec2 mouseUV = uMouse;
  mouseUV.x *= aspect;

  // distance from mouse position to current pixel
  float dist = distance(uv, mouseUV);

  // mouseX controls circle radius, mouseY controls edge softness
  float radius = uMouse.x * 0.3;
  float softness = uMouse.y * 0.15;

  // smoothstep creates a soft edge instead of a hard pixel boundary
  float circle = 1.0 - smoothstep(radius - softness, radius + softness, dist);

  // blend between background and circle color using mix()
  vec3 bgColor = vec3(0.1);
  vec3 circleColor = vec3(1.0);
  vec3 color = mix(bgColor, circleColor, circle);

  gl_FragColor = vec4(color, 1.0);
}
