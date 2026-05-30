#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertTexCoord;

uniform vec2 texOffset;

uniform float uTime;
uniform float uScale;

// 3d noise function from:
//	<https://www.shadertoy.com/view/4dS3Wd>
//	By Morgan McGuire @morgan3d, http://graphicscodex.com
//  from https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83

float hash(float n) {
  return fract(sin(n) * 1e4);
}
float hash(vec2 p) {
  return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x))));
}

float noise(float x) {
  float i = floor(x);
  float f = fract(x);
  float u = f * f * (3.0 - 2.0 * f);
  return mix(hash(i), hash(i + 1.0), u);
}

float noise(vec2 x) {
  vec2 i = floor(x);
  vec2 f = fract(x);

  float a = hash(i);
  float b = hash(i + vec2(1.0, 0.0));
  float c = hash(i + vec2(0.0, 1.0));
  float d = hash(i + vec2(1.0, 1.0));

  vec2 u = f * f * (3.0 - 2.0 * f);
  return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

float noise(vec3 x) {
  const vec3 step = vec3(110, 241, 171);

  vec3 i = floor(x);
  vec3 f = fract(x);

	// For performance, compute the base input to a 1D hash from the integer part of the argument and the 
	// incremental change to the 1D based on the 3D -> 1D wrapping
  float n = dot(i, step);

  vec3 u = f * f * (3.0 - 2.0 * f);
  return mix(mix(mix(hash(n + dot(step, vec3(0, 0, 0))), hash(n + dot(step, vec3(1, 0, 0))), u.x), mix(hash(n + dot(step, vec3(0, 1, 0))), hash(n + dot(step, vec3(1, 1, 0))), u.x), u.y), mix(mix(hash(n + dot(step, vec3(0, 0, 1))), hash(n + dot(step, vec3(1, 0, 1))), u.x), mix(hash(n + dot(step, vec3(0, 1, 1))), hash(n + dot(step, vec3(1, 1, 1))), u.x), u.y), u.z);
}

void main() {
  // center the coordinate system
  vec2 uv = vertTexCoord.xy - 0.5;

  // correct for aspect ratio
  uv.x *= texOffset.y / texOffset.x;

  // Sample 3D noise at different Z offsets for each color channel
  float r = noise(vec3(uv * uScale, uTime * 0.2));
  float g = noise(vec3(uv * uScale, uTime * 0.4 + 100.0));
  float b = noise(vec3(uv * uScale, uTime * 0.6 + 200.0));

  // draw RGB noise 
  gl_FragColor = vec4(r, g, b, 1.0);
}
