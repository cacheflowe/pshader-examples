# Project Status & Progress

_Last updated: 2026-04-06_

## Overall State

The tutorial is **roughly 70% written**. The article in `README.md` covers fragment shaders comprehensively and has a solid start on vertex shaders. The remaining work is primarily in advanced vertex shader topics, shader types, lighting, and a final "further exploration" section. There are also editorial passes needed (style guide, feedback integration, code example cleanup).

### Build System & Code Import: COMPLETE

All inline code blocks have been converted to import directives. The article source is now `README_SRC.md`, which is processed by `scripts/build.js` to generate `README.md`. **37 imports** across **20 standalone examples** are fully working. Run `npm run build:readme` to rebuild.

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
| Uniforms for Animation and Interactivity | Done | Uniform table present. Missing: built-in uniforms list |
| Using Textures | Done | `texture2D()` + `sampler2D` explained |
| Swizzling and Vector Component Shortcuts | Done | Chris feedback about framing partially addressed |
| Comparing CPU vs GPU Pixel Manipulation | Done | Side-by-side comparison |
| Post-Processing Shaders | Done | 4 examples: brightness, vignette, tiling, displacement |
| `textureWrap()` REPEAT vs CLAMP | Done | |
| Using `shader()` for more control | Done | filter() vs shader() explained |
| More on UV coordinates | Done | Custom UVs with beginShape/vertex |
| Custom shape UV + shader | Done | Circle with displaced UVs |
| Adding a custom vertex shader | Done | First vertex shader example |
| Rasterization pipeline explained | Done | Diagram present, interpolation explanation added |
| Using vertex colors | Done | Per-vertex color with mouse interaction |
| Adding Z coordinates (3D) | Done | Generative grid displacement |
| GLSL math functions | Done | Processing ↔ GLSL comparison table |
| Spherical texturing with PShape | Done | Moon displacement sphere |

### Remaining Sections (outlined but not written)

| Section | Priority | Phase | Notes |
|---------|----------|-------|-------|
| **Structural / flow fixes** | | | |
| Table of contents | High | 1.1 | Helps navigation as article grows |
| Part dividers (4 parts) | High | 1.2 | Reader progress visibility |
| Move GLSL math section earlier | High | 1.3 | Reader uses `sin()`, `fract()`, etc. long before seeing the table |
| Fold textureWrap into tiling example | Medium | 1.4 | Currently breaks flow |
| Tighten UV/shader() mid-section | Medium | 1.5 | Reduce gap before vertex shaders |
| Foreshadow PShape earlier | Low | 1.6 | Prevents info overload in final example |
| **Existing section gap fills** | | | |
| Motivation gallery in intro | High | 2.1 | Raph feedback — "why should I care?" |
| Debugging shaders section | High | 2.2 | Most critical missing practical topic |
| Generative 3D grid TODO (🚨 #6) | Medium | 2.3 | Object/world/screen space, lighting note |
| sin() CPU vs shader note | Low | 2.4 | Chris feedback |
| filter() order of operations | Medium | 2.5 | Chris feedback |
| Swizzling framing improvement | Low | 2.6 | Chris feedback |
| Parallelism visual | Low | 2.7 | Raph feedback |
| **New sections — fragment shader** | | | |
| Generative drawing / SDFs | High | 3.1 | Completes fragment shader story |
| Noise in GLSL | Medium | 3.2 | No `noise()` or `random()` — surprises Processing users |
| Multiple textures / compositing | Medium | 3.3 | Practical, mentioned but not demonstrated |
| Neighbor pixel sampling / kernels | Medium | 3.4 | Blur, edge detection via `texOffset` |
| PGraphics + shaders | Medium | 3.5 | Multi-pass rendering, distinctly Processing |
| **New sections — vertex shader & advanced** | | | |
| Shader types (#COLOR, #TEXLIGHT, etc.) | High | 4.1 | Raph feedback, core Processing concept |
| Lighting basics | High | 4.2 | Normals, diffuse lighting |
| PShape deep-dive | Medium | 4.3 | Cached geometry + performance |
| POINTS shader | Medium | 4.4 | GPU points / particles |
| Line shader | Low | 4.5 | Fill + stroke interaction |
| **Reference material** | | | |
| Built-in uniforms reference table | High | 5.1 | Raph feedback, Alex's list |
| PShader vs raw GLSL | Medium | 5.2 | Raph feedback |
| Common pitfalls sidebar | Medium | 5.3 | Aggregate existing scattered warnings |
| Performance tips | Low | 5.4 | Raph/NOTES.md |
| Aspect ratio diagrams | Low | 5.5 | Raph feedback |
| **Conclusion** | | | |
| Advanced concepts & further exploration | Low | 6.1 | Links and brief descriptions |
| Tutorial conclusion | Low | 6.2 | Summary, encouragement, resources |

---

## Inline 🚨 Markers in README_SRC.md

These are issues flagged directly in the article text:

1. ~~**UV coordinate explanation** - "Can we better explain this?"~~ ✅ Resolved — added two-triangles explanation
2. ~~**Uniform table** - "Add array examples to the table"~~ ✅ Resolved — removed note, arrays not needed for intro tutorial
3. ~~**`#define PROCESSING_TEXTURE_SHADER` commented-out block**~~ ✅ Resolved — deleted the block
4. ~~**Performance comparison timing note**~~ ✅ Resolved — uncommented and integrated into prose
5. ~~**Rasterization pipeline** - "Explain interpolation here"~~ ✅ Resolved — added interpolation explanation
6. **Line ~442**: Generative 3D grid - TODO block about explaining output, camera rotation, object space vs. world space
7. **Line ~524**: "Next" placeholder for shader types section

---

## Feedback Integration Status

### Raph's Feedback (from FEEDBACK.md)
- [ ] Add visual examples of what shaders can do in the intro (motivation) → **Phase 2.1**
- [ ] Make parallelism explanation more visual (Pixel Swarm reference) → **Phase 2.7**
- [ ] Better coordinate system diagrams (aspect ratio independence) → **Phase 5.5**
- [ ] Document Processing's built-in uniforms (`transform`, `modelview`, `projection`, etc.) → **Phase 5.1**
- [ ] Cover Processing's shader types (point, line, texture, light, quad) → **Phase 4.1**
- [ ] Explain difference between vanilla GLSL and PShader → **Phase 5.2**
- [x] Add graphics pipeline diagram (Andres' diagram referenced, rasterisation.png added)

### Chris's Feedback (from FEEDBACK.md)
- [x] Moved swizzling/UV bullets to appropriate sections
- [ ] Add note about doing sin() calculations in Processing vs shader → **Phase 2.4**
- [ ] Clarify what filter() is sending/doing (order of operations) → **Phase 2.5**
- [ ] Better framing before swizzling code examples → **Phase 2.6**

---

## Editorial TODO (from TODO.md)
- [x] Add `u` prefix to uniform names (standardize naming) — already done by author
- [x] Make examples exactly match demos in tutorial — resolved via import system
- [ ] Standardize capitalization in comments → **Phase 7.3**
- [ ] First mention of Processing functions → link to docs → **Phase 7.4**
- [ ] Apply p5js style guide → **Phase 7.7**
- [ ] Resave images at 640×480 → **Phase 7.5**
- [ ] Change cool cat to chuck doge → **Phase 7.6**

## Open Questions (from TODO.md)
- Punctuation/apostrophe conventions?
- Should we link to this repo's examples directly in the tutorial?
- ~~Are `#define PROCESSING_TEXTURE_SHADER` directives needed?~~ — Removed; not needed for this tutorial
- Are precision specifiers needed in fragment shaders?
