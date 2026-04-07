# Processing Fragment Shader Assistant

Help me write, extend, or debug a Processing fragment shader (also called a pixel shader). Use the conventions and templates below. Processing uses OpenGL ES 2.0 / GLSL 1.00.

---

## Minimal fragment shader template

Save as `data/shader.glsl` inside the sketch folder. Load with `loadShader("shader.glsl")` in Processing.

```glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertTexCoord; // current pixel's UV position (0.0–1.0)
varying vec4 vertColor;    // interpolated vertex color

void main() {
  vec2 uv = vertTexCoord.xy;
  gl_FragColor = vec4(uv, 0.0, 1.0); // replace with your logic
}
```

Apply with `filter(myShader)` (full canvas) or `shader(myShader)` (geometry only).

---

## All built-in variables available in a fragment shader

| Variable | Type | Notes |
|----------|------|-------|
| `vertTexCoord` | `varying vec4` | Current pixel's UV coordinate. Use `.xy` or `.st` — both work. Range 0.0–1.0. |
| `vertColor` | `varying vec4` | Interpolated vertex color passed from the vertex shader. |
| `texture` | `uniform sampler2D` | The active texture (auto-populated by `filter()`, or bound via `shader()` on textured geometry). |
| `texOffset` | `uniform vec2` | Size of one texel in UV space. For a 640×480 texture: `vec2(1.0/640.0, 1.0/480.0)`. Use to sample neighboring pixels. |
| `gl_FragColor` | built-in output | **Required output.** The final RGBA color of this pixel. |
| `gl_FragCoord` | built-in input | Pixel position in screen space (pixels, not normalized). Less commonly used than `vertTexCoord`. |

---

## Setting uniforms from Processing (Java)

Declare in GLSL: `uniform float uTime;`
Set from Processing: `myShader.set("uTime", (float) millis() / 1000.0);`

| Java call | GLSL declaration |
|-----------|-----------------|
| `myShader.set("uFloat", 1.0)` | `uniform float uFloat;` |
| `myShader.set("uInt", 2)` | `uniform int uInt;` |
| `myShader.set("uVec2", x, y)` | `uniform vec2 uVec2;` |
| `myShader.set("uVec3", x, y, z)` | `uniform vec3 uVec3;` |
| `myShader.set("uVec4", x, y, z, w)` | `uniform vec4 uVec4;` |
| `myShader.set("uTex", myImage)` | `uniform sampler2D uTex;` |

**Gotcha:** Uniform names are case-sensitive and must match exactly. Mismatches fail silently — the uniform stays at 0.

---

## Texture sampling

```glsl
uniform sampler2D texture;
varying vec4 vertTexCoord;

void main() {
  vec4 color = texture2D(texture, vertTexCoord.st);
  gl_FragColor = color;
}
```

For neighbor-pixel sampling (blur, edge detection, etc.):
```glsl
uniform vec2 texOffset;
vec4 above = texture2D(texture, vertTexCoord.st + vec2(0.0, texOffset.y));
vec4 right  = texture2D(texture, vertTexCoord.st + vec2(texOffset.x, 0.0));
```

---

## Common patterns

**Aspect-correct coordinates (for circles, SDFs):**
```glsl
vec2 uv = vertTexCoord.xy;
uv.x *= uAspect; // pass width/height as a uniform from Processing
```

**Map a value to a color for debugging:**
```glsl
gl_FragColor = vec4(someFloat, 0.0, 0.0, 1.0); // red channel = value
```

**Animate with time:**
```glsl
uniform float uTime; // set with millis() / 1000.0 from Processing
float wave = sin(uv.x * 6.28 + uTime);
```

**Blend between two colors:**
```glsl
vec3 colorA = vec3(1.0, 0.0, 0.0);
vec3 colorB = vec3(0.0, 0.0, 1.0);
gl_FragColor = vec4(mix(colorA, colorB, uv.x), 1.0);
```

---

## Debugging checklist

- **Black canvas, no error** → check that `size()` uses `P2D` or `P3D`; confirm `filter()` or `shader()` is being called
- **Wrong color / unexpected output** → set `gl_FragColor = vec4(1.0, 0.0, 1.0, 1.0)` (magenta) to confirm the shader is running
- **Uniform has no effect** → name in `set()` must exactly match the GLSL declaration; check capitalization
- **Crash on `vec4(1, 0, 0, 1)`** → use floats: `vec4(1.0, 0.0, 0.0, 1.0)` — integer literals in vec constructors will error
- **`millis()` as a float uniform** → cast explicitly: `myShader.set("uTime", (float) millis() / 1000.0f)`
- **Shader compiles but looks wrong** → output intermediate values as colors to inspect them
- **Calling `shader()` and shapes look broken afterward** → call `resetShader()` when done

---

## filter() vs shader()

- `filter(myShader)` — applies the shader to the *entire canvas* as a post-processing pass. The canvas is snapshotted into `texture` and processed pixel-by-pixel.
- `shader(myShader)` — applies the shader to *subsequent geometry only* (shapes, images drawn after the call). Call `resetShader()` when done.
- `filter()` can be called multiple times in sequence; each pass receives the output of the previous one.
