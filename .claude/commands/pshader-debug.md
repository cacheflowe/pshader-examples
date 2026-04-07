# Processing Shader Debugging Guide

Help me diagnose and fix a broken Processing shader. Processing uses OpenGL ES 2.0 / GLSL 1.00. Shader errors can be silent or cryptic — work through this guide systematically.

---

## Step 1: Check the console for compiler errors

When a shader fails to compile, Processing prints the GLSL compiler error to the console. Look for:

```
ERROR: 0:12: 'gl_FragColor' : undeclared identifier
ERROR: 0:5: 'main' : syntax error
```

The format is `ERROR: file:line: message`. The file number is usually `0` (the only file). Fix syntax errors before anything else — a shader that doesn't compile produces no output at all.

---

## Step 2: Confirm the shader is actually running

If the canvas is black (or unchanged), replace your `gl_FragColor` with a solid known color:

```glsl
void main() {
  gl_FragColor = vec4(1.0, 0.0, 1.0, 1.0); // magenta
}
```

- **Magenta appears** → the shader is loading and running. The problem is in your logic.
- **Still black / unchanged** → the shader is not being applied. Check:
  - Is `size()` using `P2D` or `P3D`? Shaders require an OpenGL renderer.
  - Is `filter(myShader)` or `shader(myShader)` actually being called in `draw()`?
  - Is `loadShader()` pointing to the correct filename (relative to the `data/` folder)?
  - Is there a Java-side error in the console (NullPointerException, file not found)?

---

## Step 3: Inspect values with color output

Shaders can't print to the console. Use color as your readout:

```glsl
// Is a float arriving correctly?
uniform float uMyValue;
void main() {
  gl_FragColor = vec4(uMyValue, 0.0, 0.0, 1.0); // red = value
}

// Is a vec2 arriving?
uniform vec2 uMouse;
void main() {
  gl_FragColor = vec4(uMouse.x, uMouse.y, 0.0, 1.0);
}

// Is a coordinate in range?
varying vec4 vertTexCoord;
void main() {
  gl_FragColor = vec4(vertTexCoord.xy, 0.0, 1.0); // classic UV debug view
}
```

Expected UV debug output: black at bottom-left, red at right, green at top, yellow at top-right. If you see something else, coordinate setup is wrong.

---

## Common errors and fixes

### Uniform has no effect / stays at 0

**Cause:** Name mismatch between `set()` call and GLSL declaration. Fails silently.

```java
myShader.set("utime", value);   // wrong
myShader.set("uTime", value);   // correct — must match exactly
```

Also check: is the uniform declared in the shader file that actually uses it? A uniform must be declared in the vertex *or* fragment file where it's referenced.

---

### Crash or pink/error output on startup

**Cause:** Usually a type mismatch — passing an `int` where a `float` is expected.

```glsl
gl_FragColor = vec4(1, 0, 0, 1);    // WRONG — int literals in vec4
gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0); // correct
```

Also check `set()` calls:
```java
myShader.set("uTime", millis());             // wrong — millis() returns int
myShader.set("uTime", (float) millis() / 1000.0f); // correct
```

---

### Geometry disappears when using a vertex shader

**Cause 1:** `gl_Position` is not being set, or set to 0.

```glsl
// Must always set gl_Position in a vertex shader
gl_Position = transformMatrix * position;
```

**Cause 2:** Wrong renderer. Vertex shaders require `P3D` (not `P2D`) for 3D geometry.

**Cause 3:** `resetShader()` was not called after a previous `shader()` call — the wrong shader is still active.

---

### Displacement looks stretched or wrong in 3D

**Cause:** Displacing along world Z instead of along the vertex normal.

```glsl
// Wrong — moves everything in world Z direction
vec4 displaced = position + vec4(0.0, 0.0, wave, 0.0);

// Correct — moves each vertex outward from surface
vec4 displaced = position + vec4(normal * wave, 0.0);
```

---

### Lighting disappears after applying a custom shader

**Cause:** Custom shaders replace Processing's built-in lighting entirely. The shader must implement lighting itself using the `TexLight` shader type and `lightPosition`, `lightDiffuse`, etc. uniforms.

Quick workaround: base your shader on [`TexLightVert.glsl`](https://github.com/processing/processing4/blob/main/core/src/processing/opengl/shaders/TexLightVert.glsl) and extend from there.

---

### Varyings don't match between vertex and fragment

**Cause:** `varying` declarations must be identical (same name, same type) in both shader files.

```glsl
// vert.glsl
varying vec3 vNormal;   // declared here

// frag.glsl
varying vec3 vNormal;   // must match exactly — same name, same type
```

---

### textureWrap / texture sampling behaves unexpectedly

**Cause:** Default texture wrap mode is `CLAMP` — UV coordinates outside 0–1 return the edge pixel color.

```java
// Add to Processing sketch to enable repeating:
textureWrap(REPEAT);
```

Or clamp manually in the shader:
```glsl
vec2 uv = fract(vertTexCoord.xy * tileCount); // fract() wraps 0-1
```

---

### Shader works in fragment but breaks with vertex shader added

**Cause 1:** `vertTexCoord` is not being set in the vertex shader.
```glsl
// Vertex shader must pass this through:
vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
```

**Cause 2:** Fragment shader declares uniforms or varyings that the vertex shader doesn't provide. Check that all `varying` outputs in the vertex shader are declared as `varying` inputs in the fragment shader.

---

## Quick checklist

```
[ ] size() uses P2D or P3D
[ ] loadShader() filename is correct (relative to data/ folder)
[ ] filter() or shader() is called in draw()
[ ] No Java-side errors in console
[ ] gl_FragColor is set (fragment) / gl_Position is set (vertex)
[ ] All float literals use decimal points (1.0 not 1)
[ ] Uniform names match exactly between set() and GLSL declaration
[ ] millis() cast to float before set()
[ ] varying declarations match in both vert and frag files
[ ] resetShader() called after shader() when done
[ ] textureWrap(REPEAT) set if UVs go beyond 0-1
```
