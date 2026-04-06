# Project Status & Progress

_Last updated: 2025-04-06_

## Overall State

The tutorial is **roughly 70% written**. The article in `README.md` covers fragment shaders comprehensively and has a solid start on vertex shaders. The remaining work is primarily in advanced vertex shader topics, shader types, lighting, and a final "further exploration" section. There are also editorial passes needed (style guide, feedback integration, code example cleanup).

---

## Sections: Written vs. Remaining

### Completed Sections (in README.md)

| Section | Status | Notes |
|---------|--------|-------|
| Introduction: What are Shaders? | Done | Could add visual examples of what shaders unlock (Raph feedback) |
| Processing Shader Examples | Done | Points to built-in examples |
| Writing a First Shader | Done | Solid color example |
| Parallel Computing | Done | Could be more visual (Raph feedback - see "Pixel Swarm") |
| A New Coordinate System | Done | Diagrams added. Chris feedback partially addressed |
| Uniforms for Animation and Interactivity | Done | Uniform table present. Missing: array examples, built-in uniforms list |
| Using Textures | Done | `texture2D()` + `sampler2D` explained |
| Swizzling and Vector Component Shortcuts | Done | Chris feedback about framing partially addressed |
| Comparing CPU vs GPU Pixel Manipulation | Done | Side-by-side comparison |
| Post-Processing Shaders | Done | 4 examples: brightness, vignette, tiling, displacement |
| `textureWrap()` REPEAT vs CLAMP | Done | |
| Using `shader()` for more control | Done | filter() vs shader() explained |
| More on UV coordinates | Done | Custom UVs with beginShape/vertex |
| Custom shape UV + shader | Done | Circle with displaced UVs |
| Adding a custom vertex shader | Done | First vertex shader example |
| Rasterization pipeline explained | Done | Diagram present, interpolation explanation marked 🚨 |
| Using vertex colors | Done | Per-vertex color with mouse interaction |
| Adding Z coordinates (3D) | Done | Generative grid displacement |
| GLSL math functions | Done | Processing ↔ GLSL comparison table |
| Spherical texturing with PShape | Done | Moon displacement sphere |

### Remaining Sections (outlined but not written)

| Section | Priority | Notes |
|---------|----------|-------|
| Different shader types (#COLOR, #TEXTURE, #TEXLIGHT, #LINE, #POINT) | High | Mentioned in outline, Raph feedback |
| Lighting basics (normals, light position) | High | Core 3D shader concept |
| POINTS shader | Medium | Check 50 Shades demos |
| Line shader | Medium | |
| PShape deep-dive | Medium | Cached geometry + shaders |
| Generative fragment shader drawing (SDF, Shadertoy-style) | Medium | In outline but deferred |
| Terrain example (CPU → GPU comparison) | Medium | In outline |
| Multiple textures / compositing | Medium | Blend between images |
| Advanced concepts & further exploration | Low | Raymarching, GPU particles, feedback loops, etc. |
| Interpolation deep-dive + rasterization diagram | Medium | 🚨 flagged in article |

---

## Inline 🚨 Markers in README.md

These are issues flagged directly in the article text:

1. **Line ~112**: UV coordinate explanation - "Can we better explain this?" (the two-triangles concept)
2. **Line ~139**: Uniform table - "Add array examples to the table"
3. **Line ~240**: `#define PROCESSING_TEXTURE_SHADER` commented-out block - still deciding if needed
4. **Line ~400**: Performance comparison timing note commented out - could add back
5. **Line ~870**: Rasterization pipeline - "Explain interpolation here"
6. **Line ~1050**: Generative 3D grid - TODO block about explaining output, camera rotation, object space vs. world space
7. **Line ~1300+**: "Next" placeholder for shader types section

---

## Feedback Integration Status

### Raph's Feedback (from FEEDBACK.md)
- [ ] Add visual examples of what shaders can do in the intro (motivation)
- [ ] Make parallelism explanation more visual (Pixel Swarm reference)
- [ ] Better coordinate system diagrams (aspect ratio independence)
- [ ] Document Processing's built-in uniforms (`transform`, `modelview`, `projection`, etc.)
- [ ] Cover Processing's shader types (point, line, texture, light, quad)
- [ ] Explain difference between vanilla GLSL and PShader
- [x] Add graphics pipeline diagram (Andres' diagram referenced, rasterisation.png added)

### Chris's Feedback (from FEEDBACK.md)
- [x] Moved swizzling/UV bullets to appropriate sections
- [ ] Add note about doing sin() calculations in Processing vs shader
- [ ] Clarify what filter() is sending/doing (order of operations)
- [ ] Better framing before swizzling code examples ("The following line does the same thing...")

---

## Editorial TODO (from TODO.md)
- [ ] Add `u` prefix to uniform names (standardize naming)
- [ ] Make examples exactly match demos in tutorial
- [ ] Standardize capitalization in comments
- [ ] First mention of Processing functions → link to docs
- [ ] Apply p5js style guide
- [ ] Resave images at 640×480
- [ ] Change cool cat to chuck doge

## Open Questions (from TODO.md)
- Punctuation/apostrophe conventions?
- Should we link to this repo's examples directly in the tutorial?
- Are `#define PROCESSING_TEXTURE_SHADER` directives needed?
- Are precision specifiers needed in fragment shaders?
