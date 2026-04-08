varying vec4 vertTexCoord;
uniform vec2 uMouse;
uniform vec2 uSpeed;
uniform float uAspect;

void main() {
  vec2 uv = vertTexCoord.xy;

  // correct x coordinate for aspect ratio so circles aren't stretched
  uv.x *= uAspect;
  vec2 mouse = uMouse;
  mouse.x *= uAspect;

  // vector from mouse position to current pixel
  vec2 diff = uv - mouse;

  // use mouse speed to squish the circle into an oval
  float speed = length(uSpeed) * 15.0;
  vec2 moveDir = length(uSpeed) > 0.001 ? normalize(uSpeed) : vec2(0.0);
  float parallel = dot(diff, moveDir);
  vec2 perpComp = diff - parallel * moveDir;

  // stretch along movement direction
  float stretch = 1.0 + speed;
  vec2 squished = perpComp + moveDir * (parallel / stretch);
  float dist = length(squished);

  // circle radius grows slightly with speed
  float radius = 0.08 + speed * 0.02;

  // smoothstep creates a soft edge instead of a hard pixel boundary
  float circle = 1.0 - smoothstep(radius - 0.01, radius + 0.02, dist);

  // blend between background and circle color using mix()
  vec3 color = mix(vec3(0.1), vec3(1.0, 0.4, 0.1), circle);

  gl_FragColor = vec4(color, 1.0);
}
