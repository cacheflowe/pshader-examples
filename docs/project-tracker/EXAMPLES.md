# Example Inventory & Code Import Plan

## Current Examples

Each example is a standalone Processing sketch in `/examples/`. Some are used directly in the tutorial (README.md), some are diagrams, and some are standalone demos.

### Legend
- **In Article**: Code appears inline in README.md
- **Diagram**: Visual aid, not a shader example
- **Standalone**: Not yet referenced in the article

| # | Directory | Type | Shader | In Article? | Notes |
|---|-----------|------|--------|-------------|-------|
| 1 | `diagram_interpolation/` | Diagram | None | No | Color interpolation visualization |
| 2 | `diagram_normals/` | Diagram | None | Yes (images only) | Normal direction visualization |
| 3 | `diagram_uv_coords/` | Diagram | None | Yes (images only) | UV coordinate grid |
| 4 | `fragment_01_solid_color/` | Demo | Fragment | No | Green solid color (from 50 Shades) |
| — | ~~`shader_demo_01/`~~ | — | — | — | **Renamed → `01_solid_color/`** ✅ imported |
| — | ~~`shader_demo_02/`~~ | — | — | — | **Renamed → `02_uv_gradient/`** ✅ imported |
| — | ~~`shader_demo_03_uv_map/`~~ | — | — | — | **Renamed → `03_uv_map/`** ✅ imported |
| 8 | `shader_demo_04/` | Demo | Fragment | Yes | Mouse split-screen — **next to convert** |
| 9 | `shader_demo_cpu_pixels/` | Demo | None (CPU) | Yes | CPU pixel manipulation |
| 10 | `shader_demo_cpu_pixels_bug/` | Demo | None (CPU) | No | Bug demonstration |
| 11 | `shader_demo_custom_shape_uv/` | Demo | Fragment | No | Custom shape UVs (no texture) |
| 12 | `shader_demo_custom_shape_uv_shader/` | Demo | Fragment | Yes | Circle with displaced UVs |
| 13 | `shader_demo_gpu_pixels/` | Demo | Fragment | Yes | GPU grayscale filter |
| 14 | `shader_demo_image_shader/` | Demo | Fragment | Yes | shader() on drawn image |
| 15 | `shader_demo_image_uv_coords/` | Demo | Fragment | Yes | Custom UV tiling |
| 16 | `shader_demo_post_processing/` | Demo | Fragment (4x) | Yes | Brightness, vignette, tiling, displace |
| 17 | `shader_demo_repeat/` | Demo | Fragment | Yes | REPEAT vs CLAMP |
| 18 | `shader_demo_texture_filter/` | Demo | Fragment | Yes | GPU texture filter + timing |
| 19 | `shader_demo_vertex_shader/` | Demo | Vert+Frag | Yes | Circle vertex displacement |
| 20 | `shader_demo_vertex_shader_colors/` | Demo | Vert+Frag | Yes | Per-vertex colors + mouse |
| 21 | `shader_demo_vertex_shader_displacement/` | Demo | Vert+Frag | Yes | PShape sphere displacement |
| 22 | `shader_demo_vertex_shader_generative/` | Demo | Vert+Frag | Yes | 3D grid generative |

### Examples NOT yet in the article
- `fragment_01_solid_color/` - From 50 Shades, uses green instead of red
- `shader_demo_cpu_pixels_bug/` - Bug demo, may not belong in tutorial
- `shader_demo_custom_shape_uv/` - Could fit in UV section
- `diagram_interpolation/` - Could illustrate interpolation/rasterization

---

## Code Import Directive Proposal

### Problem
Code examples are duplicated: once in `/examples/` as runnable sketches, and again inline in `README.md`. Changes must be maintained in both places.

### Proposed Solution: Import Directives

Use a custom directive syntax in `README.md` that a build script can process to inject code from example files:

```markdown
<!-- @import examples/shader_demo_01/shader_demo_01.pde -->
```

Or with language hint for syntax highlighting:

```markdown
<!-- @import examples/shader_demo_01/shader_demo_01.pde lang:java -->
<!-- @import examples/shader_demo_01/shader.glsl lang:glsl -->
```

For shader files inside `data/` directories:

```markdown
<!-- @import examples/shader_demo_post_processing/data/brightness.glsl lang:glsl -->
```

### How It Works

1. Author writes `README.md` with import directives where code blocks currently live
2. A build script (`scripts/build.js` or similar) reads `README.md`, finds directives, and replaces them with fenced code blocks containing the file contents
3. Output goes to a built file (e.g., `TUTORIAL.md` or replaces `README.md` in a CI step)
4. The source of truth for code is always the `/examples/` directory

### Directive Format Options

**Option A: HTML comment (invisible in raw markdown)**
```markdown
<!-- @import examples/shader_demo_01/shader_demo_01.pde as:java -->
```

**Option B: Custom fenced block (visible but clear)**
```markdown
:::import{src="examples/shader_demo_01/shader_demo_01.pde" lang="java"}
:::
```

**Option C: Simple placeholder with label**
```markdown
<!-- @code examples/shader_demo_01/shader_demo_01.pde java -->
```

**Recommendation**: Option A (HTML comment) is cleanest - it's invisible when viewing the raw markdown on GitHub, and the build step replaces it with a proper fenced code block.

### Partial Imports

Some examples have setup code that isn't relevant to the concept being taught. Support extracting specific line ranges or labeled regions:

```markdown
<!-- @import examples/shader_demo_04/shader_demo_04.pde lines:12-18 lang:java -->
```

Or use markers in the source code:
```java
// @region draw-loop
void draw() {
  myShader.set("splitX", mouseX / float(width));
  filter(myShader);
}
// @endregion draw-loop
```
```markdown
<!-- @import examples/shader_demo_04/shader_demo_04.pde region:draw-loop lang:java -->
```

---

## Example Naming Conventions

Current naming is inconsistent. Consider standardizing:

| Current | Proposed | Reason |
|---------|----------|--------|
| `shader_demo_01/` | `01_solid_color/` | Numbered for article order |
| `shader_demo_02/` | `02_uv_gradient/` | Descriptive |
| `shader_demo_03_uv_map/` | `03_uv_map/` | Consistent prefix |
| `shader_demo_04/` | `04_uniforms_mouse/` | Descriptive |
| `shader_demo_cpu_pixels/` | `10_cpu_pixels/` | Numbered |
| `shader_demo_gpu_pixels/` | `11_gpu_pixels/` | Numbered |
| `diagram_uv_coords/` | `diagrams/uv_coords/` | Grouped |

This renaming would happen when examples are finalized and the import system is built.

---

## Examples Still Needed

Based on the outline and remaining sections:

| Example | Section | Description |
|---------|---------|-------------|
| `shader_types_color/` | Shader Types | `#define PROCESSING_COLOR_SHADER` |
| `shader_types_texlight/` | Shader Types | `#define PROCESSING_TEXLIGHT_SHADER` |
| `shader_types_line/` | Shader Types | Line shader with stroke |
| `shader_types_point/` | Shader Types | Point shader for particles |
| `lighting_basic/` | Lighting | Basic diffuse lighting |
| `generative_sdf/` | Generative Drawing | SDF circle/shapes |
| `terrain_comparison/` | Terrain | CPU vs GPU terrain |
| `multi_texture/` | Compositing | Multiple sampler2D uniforms |
