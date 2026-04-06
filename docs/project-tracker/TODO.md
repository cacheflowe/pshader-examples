# Actionable TODO List

Priority-ordered tasks to finish the tutorial. Check off as completed.

---

## Phase 1: Finish Writing Remaining Sections

These are the unwritten sections from the outline that need to be authored in README.md.

- [ ] **1.1** Write "Different types of shaders" section
  - Cover `#COLOR`, `#TEXTURE`, `#TEXLIGHT`, `#LINE`, `#POINT` shader types
  - Reference Processing4 source: `PShader.java` lines 58-83
  - Create example sketches for at least COLOR and TEXLIGHT types
  - Explain when each type is used and what built-in uniforms/attributes they provide

- [ ] **1.2** Write "Lighting basics" section
  - Basic diffuse lighting with normals and light position
  - Reference existing Processing examples: GlossyFishEye, ToonShading
  - Note that custom shaders disable built-in lighting
  - Create example sketch

- [ ] **1.3** Write "Generative fragment shader drawing" section
  - SDF shapes (circle, rectangle)
  - Compare to Processing's `ellipse()` / `rect()`
  - Link to iquilezles.org SDF resources
  - Domain warping deeper dive

- [ ] **1.4** Write placeholder "Advanced concepts" section
  - Brief descriptions with links for: raymarching, GPU particles, feedback loops, multiple render passes, compute shaders
  - Link to external resources and Processing community examples

- [ ] **1.5** Expand interpolation explanation at rasterization pipeline section (🚨 marker)
  - Use `diagram_interpolation` example as visual aid
  - Explain how varying variables are interpolated between vertices

- [ ] **1.6** Fill in the generative 3D grid section's TODO block
  - Explain camera rotation, object space vs world space vs screen space

---

## Phase 2: Address Reviewer Feedback

- [ ] **2.1** Add visual examples of shader capabilities to the intro (Raph)
  - Show compelling images: generative art, post-fx, 3D materials
  - Motivate the reader to continue

- [ ] **2.2** Make parallelism section more visual (Raph)
  - Reference "The Pixel Swarm" by thndl
  - Consider adding a simple diagram

- [ ] **2.3** Document Processing's built-in uniforms (Raph)
  - `transform`, `modelview`, `projection`, `texMatrix`, etc.
  - Reference Alex's Google doc notes and Processing4 source
  - Add a reference table

- [ ] **2.4** Explain PShader vs raw GLSL differences (Raph)
  - How Processing wraps GLSL
  - Version differences
  - What's added automatically

- [ ] **2.5** Clarify filter() order of operations (Chris)
  - What does filter() actually send to the shader?
  - If multiple things are drawn before filter(), do they all pass through?
  - How is filter() different from shader() + geometry?

- [ ] **2.6** Add sin() calculation note in animation section (Chris)
  - When to calculate on CPU vs in shader

---

## Phase 3: Code & Example Cleanup

- [ ] **3.1** Add `u` prefix to all custom uniform names
  - Audit README.md and all example .glsl files
  - e.g., `splitX` → `uSplitX`, `time` → `uTime`

- [x] **3.2** Ensure all examples in /examples/ match tutorial code exactly
  - Resolved via import system — code is now single-source from example files
  - No more duplication to get out of sync

- [ ] **3.3** Standardize comment capitalization across all shader files

- [ ] **3.4** Add Processing function documentation links on first mention
  - `filter()`, `shader()`, `resetShader()`, `loadShader()`, `PShader.set()`, etc.

- [ ] **3.5** Resave all screenshot images at 640×480

- [ ] **3.6** Replace cool-cat image with chuck doge (or finalize image choice)

---

## Phase 4: Build System for Code Import

- [x] **4.1** Build code import script
  - `scripts/build.js` — parses `<!-- @import path lang:xxx -->` directives in `README_SRC.md`
  - Replaces directives with fenced code blocks containing file contents
  - Supports `lang:`, `label:`, and `lines:` options
  - Run via `npm run build:readme`
  - Added `"type": "module"` to package.json for ESM imports
  - Source file: `README_SRC.md` → Output: `README.md`

- [x] **4.2** Convert ALL inline code blocks to import directives — **35 imports, 19 examples**
  - [x] `01_solid_color` (was `shader_demo_01`) — .pde + shader.glsl
  - [x] `02_uv_gradient` (was `shader_demo_02`) — shader.glsl only
  - [x] `03_uv_map` (was `shader_demo_03_uv_map`) — shader.glsl only
  - [x] `04_uniforms_mouse` (was `shader_demo_04`) — .pde + shader.glsl
  - [x] `05_texture_grayscale` (was `shader_demo_gpu_pixels`) — .pde + shader.glsl
  - [x] `06_cpu_pixels` (was `shader_demo_cpu_pixels`) — .pde only
  - [x] `07_texture_filter` (was `shader_demo_texture_filter`) — .pde + shader.glsl
  - [x] `08_post_brightness` (was `shader_demo_post_processing`) — .pde + brightness.glsl
  - [x] `09_post_vignette` — .pde + vignette.glsl
  - [x] `10_post_tiling` — .pde + tile.glsl
  - [x] `11_post_displace` — .pde + displace.glsl
  - [x] `12_texture_wrap` (was `shader_demo_repeat`) — .pde + uv-adjust.glsl
  - [x] `13_shader_image` (was `shader_demo_image_shader`) — .pde + shader.glsl
  - [x] `14_custom_uv` (was `shader_demo_image_uv_coords`) — .pde only
  - [x] `15_custom_uv_shader` (was `shader_demo_custom_shape_uv_shader`) — .pde + shader.glsl
  - [x] `16_vertex_shader` (was `shader_demo_vertex_shader`) — .pde + vert.glsl + frag.glsl
  - [x] `17_vertex_colors` (was `shader_demo_vertex_shader_colors`) — .pde + vert.glsl + frag.glsl
  - [x] `18_vertex_generative` (was `shader_demo_vertex_shader_generative`) — .pde + vert.glsl + frag.glsl
  - [x] `19_vertex_displacement` (was `shader_demo_vertex_shader_displacement`) — .pde + vert.glsl + frag.glsl

- [x] **4.3** Example renaming complete
  - Convention: numbered like `01_solid_color/`
  - Processing sketch convention: `.pde` in same-named directory
  - Shaders in `data/` subdirectory
  - File labels in article use **bold** formatting (e.g., **shader.glsl**)
  - Original examples still exist alongside new numbered versions

---

## Phase 5: Final Polish

- [ ] **5.1** Apply documentation style guide (p5js style guide)
  - American English, Oxford comma, present tense
  - Inclusive and accessible language
  - Review all wording

- [ ] **5.2** Final proofreading pass
  - Check for consistency in terminology
  - Verify all images load correctly
  - Test all linked URLs

- [ ] **5.3** Resolve open questions from TODO.md
  - Decide on `#define PROCESSING_TEXTURE_SHADER` guidance
  - Decide on precision specifier guidance
  - Decide on linking to repo examples vs keeping code inline

- [ ] **5.4** Clean up /docs/wip/ once content is merged into article
