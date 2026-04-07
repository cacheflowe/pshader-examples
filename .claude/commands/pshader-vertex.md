# Processing Vertex Shader Assistant

Help me write, extend, or debug a Processing vertex shader. A vertex shader always pairs with a fragment shader — load both with `loadShader("frag.glsl", "vert.glsl")`. Processing uses OpenGL ES 2.0 / GLSL 1.00.

---

## Minimal vertex + fragment shader pair

**`data/vert.glsl`** — based on Processing's default `TexVert.glsl`:
```glsl
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

**`data/frag.glsl`** — minimal pass-through fragment shader:
```glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  gl_FragColor = texture2D(texture, vertTexCoord.st) * vertColor;
}
```

Apply with `shader(myShader)` before drawing geometry. Call `resetShader()` when done.

---

## All built-in vertex shader variables

### Color type — no texture (`ColorVert.glsl`)

| Variable | Type | Description |
|----------|------|-------------|
| `transformMatrix` | `uniform mat4` | Combined modelview + projection. Multiply `position` by this for `gl_Position`. |
| `position` | `attribute vec4` | Vertex position in screen-space pixels. Set by `vertex(x, y)` / `vertex(x, y, z)`. |
| `color` | `attribute vec4` | Vertex color (0–1 range). Set by `fill()` before `vertex()`. |
| `vertColor` | `varying vec4` | Output color passed to the fragment shader. |
| `gl_Position` | built-in output | **Required output.** Final clip-space vertex position. |

### Texture type — with image/texture (`TexVert.glsl`) — adds:

| Variable | Type | Description |
|----------|------|-------------|
| `texMatrix` | `uniform mat4` | Texture transform. Apply as `texMatrix * vec4(texCoord, 1.0, 1.0)`. |
| `texCoord` | `attribute vec2` | UV coordinate for this vertex. Set by `vertex(x, y, u, v)` or assigned automatically. |
| `vertTexCoord` | `varying vec4` | Output UV passed to the fragment shader. |

### Light + texture type (`TexLightVert.glsl`) — adds:

| Variable | Type | Description |
|----------|------|-------------|
| `modelviewMatrix` | `uniform mat4` | Modelview without projection. Used for eye-space lighting calculations. |
| `normalMatrix` | `uniform mat3` | Transforms normals to eye space. |
| `normal` | `attribute vec3` | Surface normal at this vertex. Auto-set by Processing primitives; set manually with `normal()`. |
| `ambient` | `attribute vec4` | Material ambient color (`ambient()` in Processing). |
| `specular` | `attribute vec4` | Material specular color (`specular()`). |
| `emissive` | `attribute vec4` | Material emissive color (`emissive()`). |
| `shininess` | `attribute float` | Specular shininess (`shininess()`). |
| `lightCount` | `uniform int` | Number of active lights (max 8). |
| `lightPosition[8]` | `uniform vec4` | Light position in eye space. `.w` = 0 for directional, 1 for point/spot. |
| `lightNormal[8]` | `uniform vec3` | Light direction vector. |
| `lightAmbient[8]` | `uniform vec3` | Light ambient contribution. |
| `lightDiffuse[8]` | `uniform vec3` | Light diffuse contribution. |
| `lightSpecular[8]` | `uniform vec3` | Light specular contribution. |
| `lightFalloff[8]` | `uniform vec3` | Falloff coefficients (constant, linear, quadratic). |
| `lightSpot[8]` | `uniform vec2` | Spotlight cutoff cosine (`.x`) and exponent (`.y`). |

---

## Coordinate spaces

- **`position`** is in screen-space pixels (e.g., `vertex(200, 300)` → `position.xy = vec2(200, 300)`)
- After `transformMatrix * position`, the result is in clip space — what the GPU needs for `gl_Position`
- Displacement in the vertex shader is in screen-space pixels, not normalized UV coordinates
- `modelviewMatrix * position` gives the vertex in eye space — needed for lighting and depth calculations

---

## Passing data from vertex to fragment shader (varyings)

Declare the same `varying` in both files:

**vert.glsl:**
```glsl
varying float vDisplace; // custom value to pass down
void main() {
  vDisplace = sin(position.x * 0.05);
  gl_Position = transformMatrix * position;
  // ...
}
```

**frag.glsl:**
```glsl
varying float vDisplace; // same name and type
void main() {
  gl_FragColor = vec4(vDisplace, 0.0, 0.0, 1.0);
}
```

Varyings are **interpolated** across pixels between vertices — this is how smooth gradients and texture mapping work.

---

## Displacement pattern

```glsl
attribute vec4 position;
attribute vec3 normal;
uniform mat4 transformMatrix;
uniform float uTime;
uniform float uAmp;

void main() {
  float wave = sin(position.x * 0.05 + uTime) * uAmp;
  vec4 displaced = position + vec4(normal * wave, 0.0); // displace along normal
  gl_Position = transformMatrix * displaced;
  // ...
}
```

Displace along the vertex normal (not just Z) to avoid distortion on curved surfaces.

---

## Debugging checklist

- **Geometry disappears** → `gl_Position` is not being set, or `transformMatrix` multiplication is missing
- **Displacement looks wrong in 3D** → displace along `normal`, not just `position.z`; ensure `P3D` renderer
- **Custom uniform has no effect in vertex shader** → uniforms set via `myShader.set()` are available in *both* shaders as long as they're declared in the GLSL file — check the declaration
- **Fragment shader looks wrong after adding vertex shader** → the `varying` declarations must match exactly (name, type) in both files
- **Lighting disappears** → custom shaders replace Processing's built-in lighting entirely; use the `TexLight` type or implement lighting manually
- **int cast warning with `millis()`** → use `myShader.set("uTime", (float) millis() / 1000.0f)`
- **`resetShader()` needed** → always call after drawing with `shader()` or other geometry will be affected
