---
applyTo: "**/*.glsl, **/*.frag, **/*.vert"
---

# Processing GLSL Shader Context

This file is a GLSL shader written for **Processing (Java)**. Processing uses **OpenGL ES 2.0 / GLSL version 1.00**. Some standard GLSL features (geometry shaders, compute shaders, `gl_FragDepth`, GLSL 3.x syntax) are not available.

## Required boilerplate

All fragment shaders should include this precision block for OpenGL ES compatibility:

```glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
```

## Shader types

Processing detects shader type from `#define` directives. Include the appropriate one:

| `#define` | Used when |
|-----------|-----------|
| `#define PROCESSING_COLOR_SHADER` | Colored geometry, no texture |
| `#define PROCESSING_TEXTURE_SHADER` | Textured geometry (most common) |
| `#define PROCESSING_LIGHT_SHADER` | Lit geometry, no texture |
| `#define PROCESSING_TEXLIGHT_SHADER` | Lit + textured geometry |
| `#define PROCESSING_LINE_SHADER` | Stroke/line rendering |
| `#define PROCESSING_POINT_SHADER` | Point rendering |

The `#define` is optional — Processing infers type from attributes if omitted — but explicit is better.

## Fragment shader built-ins

| Variable | Type | Notes |
|----------|------|-------|
| `vertTexCoord` | `varying vec4` | Current pixel's UV. Use `.xy` or `.st`. Range 0.0–1.0. |
| `vertColor` | `varying vec4` | Interpolated vertex color from vertex shader. |
| `texture` | `uniform sampler2D` | Active texture. Auto-populated by `filter()` or bound geometry. |
| `texOffset` | `uniform vec2` | Size of one texel in UV space — use for neighbor-pixel sampling. |
| `gl_FragColor` | built-in output | **Required.** Final RGBA color of this pixel. |
| `gl_FragCoord` | built-in input | Pixel position in screen pixels (not normalized). |

## Vertex shader built-ins — texture type (most common)

| Variable | Type | Notes |
|----------|------|-------|
| `transformMatrix` | `uniform mat4` | Combined modelview + projection. Use: `gl_Position = transformMatrix * position`. |
| `texMatrix` | `uniform mat4` | Texture transform. Use: `texMatrix * vec4(texCoord, 1.0, 1.0)`. |
| `position` | `attribute vec4` | Vertex position in screen-space pixels. |
| `color` | `attribute vec4` | Vertex color (0–1). Set by `fill()` in Processing. |
| `texCoord` | `attribute vec2` | UV assigned to this vertex. |
| `normal` | `attribute vec3` | Surface normal. Available in LIGHT/TEXLIGHT types. |
| `vertColor` | `varying vec4` | Output: color passed to fragment shader. |
| `vertTexCoord` | `varying vec4` | Output: UV passed to fragment shader. |
| `gl_Position` | built-in output | **Required.** Final clip-space vertex position. |

## Minimal templates

**Fragment shader only** (loaded with `loadShader("shader.glsl")`):
```glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertTexCoord;
varying vec4 vertColor;

void main() {
  vec2 uv = vertTexCoord.xy;
  gl_FragColor = vec4(uv, 0.0, 1.0);
}
```

**Vertex + fragment pair** (loaded with `loadShader("frag.glsl", "vert.glsl")`):
```glsl
// vert.glsl
uniform mat4 transformMatrix;
uniform mat4 texMatrix;
attribute vec4 position;
attribute vec4 color;
attribute vec2 texCoord;
varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  gl_Position = transformMatrix * position;
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}
```

```glsl
// frag.glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec2 texOffset;
varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  gl_FragColor = texture2D(texture, vertTexCoord.st) * vertColor;
}
```

## Conventions in this project

- Custom uniforms use a `u` prefix: `uTime`, `uMouse`, `uAspect`
- Custom varyings use a `v` prefix: `vNormal`, `vDisplace`
- Uniform names are **case-sensitive** and must exactly match the `set()` call in Processing

## Critical gotchas

- **Always use float literals**: `vec4(1.0, 0.0, 0.0, 1.0)` — integer literals in vec constructors will error
- **`varying` declarations must match exactly** (name and type) in both vert and frag files
- **Displace vertices along `normal`**, not just Z, to avoid distortion on curved surfaces
- **Custom shaders replace built-in lighting** — use TEXLIGHT type or reimplement lighting manually if `lights()` is needed
- No `noise()` or `random()` in GLSL — implement hash-based pseudo-random functions manually
- No `map()` in GLSL — use: `float map(float v, float i1, float i2, float o1, float o2) { return o1 + (o2-o1)*((v-i1)/(i2-i1)); }`
