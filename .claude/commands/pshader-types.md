# Processing Shader Types Guide

Help me choose the right Processing shader type, understand what built-in variables each provides, and write the correct `#define` directive. Processing uses OpenGL ES 2.0 / GLSL 1.00.

---

## How Processing selects a shader type

Processing automatically detects the shader type from the GLSL source code by looking for specific `#define` directives or attribute declarations. If no `#define` is present, Processing infers the type from the attributes and uniforms used.

The type determines:
- Which built-in uniforms and attributes Processing sends to the shader
- Which drawing operations the shader applies to

---

## Shader type reference

### COLOR — colored geometry, no texture

Used when drawing shapes with `fill()` but no `texture()` or `image()`.

```glsl
// vert.glsl
#define PROCESSING_COLOR_SHADER

uniform mat4 transformMatrix;
attribute vec4 position;
attribute vec4 color;
varying vec4 vertColor;

void main() {
  gl_Position = transformMatrix * position;
  vertColor = color;
}
```

```glsl
// frag.glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;

void main() {
  gl_FragColor = vertColor;
}
```

**Activated by:** drawing shapes with `fill()` after calling `shader(myShader)`

---

### TEXTURE — textured geometry, no lighting

Used when drawing images or textured shapes without Processing lights. This is the most common type for post-processing and 2D effects.

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

**Activated by:** `filter()`, or `shader(myShader)` when drawing images/textured geometry

---

### LIGHT — lighting, no texture

Used when Processing's lighting functions (`lights()`, `pointLight()`, etc.) are active but no texture is applied.

```glsl
// vert.glsl
#define PROCESSING_LIGHT_SHADER

uniform mat4 transformMatrix;
uniform mat4 modelviewMatrix;
uniform mat3 normalMatrix;
// ... plus all light uniforms (see pshader-vertex for full list)

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
// ... plus material attributes
```

**Activated by:** shapes drawn with `lights()` active and no texture

---

### TEXLIGHT — texture + lighting (most capable)

The most feature-rich built-in type. Combines texture access with Processing's full lighting model.

**Activated by:** shapes drawn with both `lights()` active and a texture applied

The default [`TexLightVert.glsl`](https://github.com/processing/processing4/blob/main/core/src/processing/opengl/shaders/TexLightVert.glsl) is the best starting point — it contains the full lighting calculation loop and all variable declarations.

---

### LINE — stroke/line rendering

Used internally by Processing when drawing lines with `stroke()`. Provides special attributes for line geometry expansion.

```glsl
// vert.glsl
#define PROCESSING_LINE_SHADER

uniform mat4 modelviewMatrix;
uniform mat4 projectionMatrix;
uniform vec4 viewport;
uniform int perspective;
uniform vec3 scale;

attribute vec4 position;
attribute vec4 color;
attribute vec4 direction; // .xyz = line direction, .w = stroke weight

varying vec4 vertColor;
```

**Activated by:** line/stroke drawing after `shader(myShader, LINES)`
**Note:** Pass `LINES` as the second argument to `shader()` to target line rendering specifically.

---

### POINT — point rendering

Used for GPU-rendered points via `point()`. Points are expanded into quads on the GPU.

```glsl
// vert.glsl
uniform mat4 projectionMatrix;
uniform mat4 modelviewMatrix;
uniform vec4 viewport;
uniform int perspective;

attribute vec4 position;
attribute vec4 color;
attribute vec2 offset; // corner offset for quad expansion
```

**Activated by:** `point()` calls after `shader(myShader, POINTS)`
**Note:** Pass `POINTS` as the second argument to `shader()`.

---

## Targeting specific drawing operations with shader()

```java
shader(myShader);          // applies to all subsequent geometry
shader(myShader, POINTS);  // applies only to point() calls
shader(myShader, LINES);   // applies only to stroke/line drawing
shader(myShader, TRIANGLES); // applies only to filled geometry
resetShader();             // restores Processing's default shaders
resetShader(POINTS);       // restores default for points only
```

---

## Quick selection guide

| I want to… | Use type |
|-----------|----------|
| Post-process the canvas with `filter()` | TEXTURE |
| Apply an effect to an image with `shader()` | TEXTURE |
| Displace vertices on colored geometry | COLOR |
| Displace vertices on a textured mesh | TEXTURE |
| Add custom lighting effects | TEXLIGHT or LIGHT |
| Render GPU point particles | POINT |
| Customize stroke appearance | LINE |

---

## Type detection: `#define` vs. attribute inference

Processing detects type by scanning the GLSL source for these markers (in priority order):

| `#define` | Type detected |
|-----------|--------------|
| `#define PROCESSING_POINT_SHADER` | POINT |
| `#define PROCESSING_LINE_SHADER` | LINE |
| `#define PROCESSING_COLOR_SHADER` | COLOR |
| `#define PROCESSING_LIGHT_SHADER` | LIGHT |
| `#define PROCESSING_TEXTURE_SHADER` | TEXTURE |
| `#define PROCESSING_TEXLIGHT_SHADER` | TEXLIGHT |
| _(none — fallback)_ | Inferred from `attribute vec2 offset` → POINT, `attribute vec4 direction` → LINE, else POLY/TEXTURE |

Including the `#define` is optional but makes the type explicit and avoids ambiguity.
