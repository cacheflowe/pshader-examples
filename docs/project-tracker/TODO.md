# Actionable TODO List

Unified plan to finish the tutorial. Organized by implementation order.
Cross-referenced with: analysis review, Raph's feedback, Chris's feedback, OUTLINE_WIP.md, NOTES.md.

Check off as completed.

---

## Phase 1: Article Structure & Flow Fixes

Reorganize existing content for better pedagogical flow. No new writing — just moving, combining, and adding brief connective tissue.

- [ ] **1.1** Add a Table of Contents at the top of the article
  - Helps readers navigate the long article and understand scope
  - Update after each new section is added

- [x] **1.2** Add part dividers to group related sections
  - **Part 1: Fragment Shader Fundamentals** — Intro through SDF (examples 1-8)
  - **Part 2: Post-Processing & Texture Techniques** — Post-FX, UV manipulation (examples 9-16)
  - **Part 3: Vertex Shaders & 3D** — Custom vertex shaders through PShape (examples 17-20)
  - **Part 4: Going Further** — Advanced topics, resources

- [x] **1.3** Move GLSL math functions section earlier
  - Moved to after CPU vs GPU comparison, before SDF section
  - Math table now serves as a toolkit the reader carries forward

- [x] **1.4** Fold `textureWrap()` into the tiling post-processing example
  - Folded into the tiling section with textureWrap(REPEAT) vs CLAMP comparison

- [x] **1.5** Tighten the UV / shader() mid-section
  - Combined UV sections into streamlined flow
  - filter() vs shader() distinction clarified

- [ ] **1.6** Foreshadow PShape before the final example
  - Add a one-paragraph mention when vertex shaders are introduced: "Processing's PShape caches geometry on the GPU, which pairs naturally with custom shaders — we'll see this later"
  - Prevents PShape, `sphereDetail()`, `setTexture()`, and equirectangular projection from all arriving at once

---

## Phase 2: Fill Gaps in Existing Written Sections

Targeted additions to existing content. Small-to-medium edits, not full new sections.

- [x] **2.1** Add "What can shaders do?" motivation gallery to the intro ← _Raph feedback_
  - ✅ Section written with 7 categories: generative patterns, raymarching, stylized rendering, physics sims, live coding, creative tools, generative art
  - ✅ Video game graphics origin note added to intro paragraph
  - [ ] 🚨 Images are still TODO placeholders — continue curating artists and capturing screenshots
  - Artists referenced: Inigo Quilez, Kali, Flockaroo, Amanda Ghassaei, Olivia Jack, Patricio Gonzalez Vivo, ilithya, marioecg, lejeunerenard, Char Stiles

- [x] **2.2** Add a "Debugging shaders" section or sidebar ← _NEW (analysis)_
  - Placed after first shader example, before Parallel Computing
  - Covers: console errors, black screen diagnosis, silent uniform mismatches, visualizing values as colors
  - [ ] 🚨 TODO: Test a broken shader in Processing and paste a real compiler error message into the tutorial as an example

- [x] **2.3** Fill in generative 3D grid TODO block
  - Explained: transformMatrix/object space vs screen space, fake lighting caveat, TexLight reference, vertex-to-fragment varying pattern, pixel-space coordinates
  - 🚨 TODO: Manually test example 19 and verify these notes are helpful and accurate in context

- [ ] **2.4** Add sin() CPU vs shader note in animation section ← _Chris feedback_
  - When to calculate on CPU vs in shader
  - Practical guidance: "If the value is the same for every pixel, calculate it on the CPU and send as a uniform"
  - Place in or right after the `uTime` animation example

- [ ] **2.5** Clarify filter() order of operations ← _Chris feedback_
  - What does filter() actually send to the shader?
  - If multiple things are drawn before filter(), do they all pass through?
  - How is filter() different from shader() + geometry?
  - Add in the "Using Textures" section or as a note after first filter() use

- [ ] **2.6** Improve framing before swizzling code examples ← _Chris feedback_
  - Add transition text like "The following line does the same thing, but in a more concise way..."
  - Reader currently lacks context until the end of the section

- [ ] **2.7** Make parallelism section more visual ← _Raph feedback_
  - Reference "The Pixel Swarm" by thndl
  - Consider a simple diagram showing parallel execution
  - The Wikipedia link may be too complex for the audience

---

## Phase 3: New Sections — Fragment Shader Topics

New sections that complete the fragment shader story. These fill the gap between the current post-processing content and the vertex shader sections.

- [x] **3.1** Write "Drawing Shapes with Math: Signed Distance Functions" section — interactive SDF circle example (08_sdf_circle) with mouse following & speed squish
  - Simple `step(distance(...))` circle example — compare to Processing's `ellipse()`
  - Show aspect ratio correction for proper circles regardless of canvas size
  - SDF rectangle — compare to Processing's `rect()`
  - Link to iquilezles.org SDF resources and Shadertoy
  - _Source: OUTLINE_WIP.md, GOOGLE_DOC.md, analysis_

- [ ] **3.2** Write "Noise in GLSL" section or subsection
  - There is no `noise()` or `random()` in GLSL — this surprises Processing users
  - Show a simple hash-based pseudo-random function
  - Reference Ashima's simplex noise or similar community implementations
  - Practical uses: grain effect, displacement, generative patterns
  - Compare to Processing's `noise()` function
  - _Source: NOTES.md (Raph noted this), OUTLINE_WIP.md_

- [ ] **3.3** Write "Multiple textures / compositing" section
  - Passing a second `sampler2D` uniform via `set()` — the article mentions this is possible but never demonstrates it
  - Simple example: blend two images with `mix()` based on mouse position
  - Optionally: mask/matte compositing
  - _Source: OUTLINE_WIP.md, analysis_

- [ ] **3.4** Write "Neighbor pixel sampling" section (kernels, blur)
  - Introduce `texOffset` built-in uniform
  - Simple blur or edge detection kernel
  - Explain that pixels normally don't know about neighbors — this is the workaround
  - Reference Processing's built-in blur filter example
  - _Source: OUTLINE_WIP.md, GOOGLE_DOC.md_

- [ ] **3.5** Write "PGraphics + shaders" section
  - Multi-pass rendering with offscreen buffers
  - `pg.filter()` doesn't need `beginDraw()`/`endDraw()`, but `pg.shader()` does
  - Feedback loops and compositing pipelines
  - Distinctly Processing-specific and practical
  - _Source: OUTLINE_WIP.md_

---

## Phase 4: New Sections — Vertex Shader & Advanced Topics

These extend the existing vertex shader coverage and add the planned advanced material.

- [ ] **4.1** Write "Different types of shaders" section
  - Cover `#COLOR`, `#TEXTURE`, `#TEXLIGHT`, `#LINE`, `#POINT` shader types
  - Reference Processing4 source: `PShader.java` lines 58-83
  - Create example sketches for at least COLOR and TEXLIGHT types
  - Explain when each type is used and what built-in uniforms/attributes they provide
  - _Source: OUTLINE_WIP.md, Raph feedback_

- [ ] **4.2** Write "Lighting basics" section
  - Basic diffuse lighting with normals and light position
  - Reference existing Processing examples: GlossyFishEye, ToonShading
  - Note that custom shaders disable built-in lighting (connects to 2.3 above)
  - Connect to `#TEXLIGHT` shader type
  - Create example sketch
  - _Source: OUTLINE_WIP.md, Raph feedback_

- [ ] **4.3** Write "PShape deep-dive" section (if not already covered enough)
  - Cached geometry + shaders for performance
  - Custom attributes via `attrib()` (if appropriate for this level)
  - `beginShape()` vs PShape performance comparison
  - _Source: OUTLINE_WIP.md, NOTES.md_

- [ ] **4.4** Write POINTS shader example
  - Check 50 Shades demos for reference
  - GPU point rendering / particles
  - _Source: OUTLINE_WIP.md_

- [ ] **4.5** Write Line shader example
  - Fill + stroke interaction with shaders
  - _Source: OUTLINE_WIP.md_

---

## Phase 5: Reference Material & Reviewer Feedback

These are reference-style additions rather than tutorial flow. Can be integrated into existing sections or added as appendix material.

- [ ] **5.1** Document Processing's built-in uniforms ← _Raph feedback_
  - Vertex shader: `transformMatrix`, `modelviewMatrix`, `texMatrix`, `normalMatrix`, light uniforms
  - Vertex attributes: `position`, `color`, `normal`, `texCoord`, `ambient`, `specular`, `emissive`, `shininess`
  - Fragment shader: `texture`, `texOffset`, `gl_FragCoord`
  - Reference Alex's Google doc notes and Processing4 source
  - Add as a reference table — either inline or as an appendix
  - _Source: GOOGLE_DOC.md (Alex's list), Raph feedback, NOTES.md_

- [ ] **5.2** Explain PShader vs raw GLSL differences ← _Raph feedback_
  - How Processing wraps GLSL (what's added automatically)
  - GLSL version differences — Processing uses OpenGL ES 2.0 (already noted in intro)
  - Why your shader's `main()` looks different from Shadertoy
  - `loadShader()` vs `new PShader()` — and why the former is recommended
  - _Source: Raph feedback, NOTES.md (Justin noted GLSL version issues)_

- [ ] **5.3** Add a "Common pitfalls" sidebar or section
  - Aggregate warnings already scattered through the article:
    - int vs float type mismatch
    - Forgetting P2D/P3D in `size()`
    - Not calling `resetShader()` after `shader()`
    - Misspelled uniform names fail silently
    - `millis()` returns int — cast to float for uniforms
  - Quick-reference format for debugging
  - _Source: analysis, content already exists scattered through article_

- [ ] **5.4** Add "Performance tips" sidebar
  - Minimize for loops and conditionals in shaders
  - Limit texture lookups
  - Certain things still better on CPU (text, complex logic)
  - Shaders complement the CPU, not replace it
  - _Source: NOTES.md (Raph noted this)_

- [ ] **5.5** Coordinate system diagrams — aspect ratio independence ← _Raph feedback_
  - Make clearer how normalized coordinates work across different canvas sizes
  - Could connect to the SDF/circle aspect-correction example in 3.1

---

## Phase 6: Advanced Concepts & Conclusion

- [ ] **6.1** Write "Advanced concepts & further exploration" section
  - Brief descriptions with links for each topic:
    - Raymarching
    - GPU particle systems (mention float32 texture approach from NOTES.md)
    - Feedback loops with PGraphics
    - Using textures as data (heightmaps, simulation state)
    - Multiple render passes / FBOs
    - Compute shaders (if supported)
    - Matcap shading (reference from NOTES.md)
    - Simulation shaders (Conway, `ppixels`)
  - Link to external resources and Processing community examples
  - _Source: OUTLINE_WIP.md, NOTES.md, GOOGLE_DOC.md_

- [ ] **6.2** Write tutorial conclusion
  - Brief summary of what was covered
  - Encouragement to experiment
  - Links to community resources, Shadertoy, Book of Shaders, iquilezles.org

---

## Phase 7: Final Polish

- [x] **7.1** Add `u` prefix to all custom uniform names — _already done by author_
- [x] **7.2** Examples match tutorial code — _resolved via import system_
- [ ] **7.3** Standardize comment capitalization across all shader files
- [ ] **7.4** Add Processing function documentation links on first mention
  - `filter()`, `shader()`, `resetShader()`, `loadShader()`, `PShader.set()`, etc.
- [ ] **7.5** Resave all screenshot images at 640×480
- [ ] **7.6** Replace cool-cat image with chuck doge (or finalize image choice)
- [ ] **7.7** Apply p5js documentation style guide
- [ ] **7.8** Final proofreading pass
- [ ] **7.9** Resolve remaining open questions
  - Are precision specifiers needed in fragment shaders?
  - Should we link to this repo's examples in the tutorial?
- [ ] **7.10** Clean up /docs/wip/ once content is merged into article

---

## Completed Work

### Build System (Phase 4 — DONE)

- [x] Built `scripts/build.js` — import directive processor
- [x] Converted all 19 examples to import directives (35 imports)
- [x] Renamed all examples to numbered convention (`01_solid_color` through `19_vertex_displacement`)
- [x] Archived original `shader_demo_*` directories to `_assets/article-examples-converted/`
- [x] Moved diagrams to `/diagrams/`

### Editorial Gap Fixes (Phase 3.5 — DONE)

- [x] UV coordinate explanation — added two-triangles concept
- [x] Uniform array table note — removed (not needed for intro)
- [x] `#define PROCESSING_TEXTURE_SHADER` block — deleted
- [x] CPU/GPU timing comparison — uncommented and integrated
- [x] Interpolation explanation — added at rasterization section
- [ ] Generative 3D TODO block + "Next:" placeholder — deferred to Phase 2.3
