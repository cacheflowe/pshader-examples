---
applyTo: "**/*.pde"
---

# Processing Shader (PShader) Context

This sketch uses Processing's **PShader** system for GLSL shaders. Processing uses OpenGL ES 2.0. Shaders only work with the `P2D` or `P3D` renderer — always check `size()`.

## Loading shaders

```java
// Fragment shader only (file goes in sketch's data/ folder)
PShader myShader = loadShader("shader.glsl");

// Vertex + fragment pair (fragment first, then vertex)
PShader myShader = loadShader("frag.glsl", "vert.glsl");
```

Load in `setup()`. Reload dynamically in `draw()` to live-edit during development.

## Applying shaders

```java
filter(myShader);        // post-process the entire canvas as-is
shader(myShader);        // apply to all subsequent draw calls
shader(myShader, LINES); // apply only to line/stroke drawing
shader(myShader, POINTS);// apply only to point() calls
resetShader();           // restore Processing's default shaders — always call when done
```

`filter()` snapshots the full canvas into a texture and passes it to the shader as `texture`.
`shader()` applies to geometry drawn after the call. Call `resetShader()` when done or subsequent shapes will be affected.

## Setting uniforms

```java
myShader.set("uFloat",  1.5);
myShader.set("uInt",    2);
myShader.set("uVec2",   mouseX, mouseY);           // or: new PVector(x, y)
myShader.set("uVec3",   x, y, z);
myShader.set("uVec4",   x, y, z, w);
myShader.set("uBool",   true);
myShader.set("uTex",    myImage);                  // PImage → sampler2D
myShader.set("uTime",   (float) millis() / 1000.0); // cast millis() to float
```

Uniform names are **case-sensitive** and must exactly match the GLSL declaration. Mismatches fail silently — the uniform stays at its default value (0).

## Common patterns

```java
void setup() {
  size(640, 480, P2D);  // P2D or P3D required
  myShader = loadShader("shader.glsl");
}

void draw() {
  // draw content first, then apply shader
  image(myImage, 0, 0);
  myShader.set("uTime", (float) millis() / 1000.0);
  myShader.set("uMouse", (float) mouseX / width, (float) mouseY / height);
  filter(myShader);
}
```

## PGraphics + shaders

```java
PGraphics pg = createGraphics(width, height, P2D);

// filter() on PGraphics — no beginDraw()/endDraw() needed
pg.filter(myShader);

// shader() on PGraphics — requires beginDraw()/endDraw()
pg.beginDraw();
pg.shader(myShader);
pg.rect(0, 0, width, height);
pg.resetShader();
pg.endDraw();
```

## Critical gotchas

- **`millis()` returns `int`** — always cast: `(float) millis() / 1000.0f`
- **`P2D` or `P3D` required** — default renderer doesn't support shaders
- **Always call `resetShader()`** after `shader()` or subsequent geometry is affected
- **`filter()` order matters** — it snapshots the canvas at the moment it's called; call after drawing content
- **Multiple `filter()` calls chain** — each pass gets the output of the previous one
- **`textureWrap(REPEAT)`** — set this if shader UVs go outside 0–1 range (default is CLAMP)
