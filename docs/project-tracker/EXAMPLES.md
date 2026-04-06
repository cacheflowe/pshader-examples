# Example Inventory & Code Import Plan

## Current Examples

Each example is a standalone Processing sketch in `/examples/`. Numbered examples (01-19) are imported into the tutorial via `README_SRC.md`. Original `shader_demo_*` directories still exist alongside.

### Legend
- **Imported**: Code is pulled into README.md via build system (35 total imports)
- **Original**: Pre-existing example, not yet cleaned up or removed
- **Diagram**: Visual aid, not a shader example
- **Standalone**: Not referenced in the article

### Numbered Examples (imported into article)

| # | Directory | Section | Files Imported |
|---|-----------|---------|----------------|
| 01 | `01_solid_color/` | Writing a First Shader | .pde + shader.glsl |
| 02 | `02_uv_gradient/` | Coordinate System (gradient) | shader.glsl |
| 03 | `03_uv_map/` | Coordinate System (UV map) | shader.glsl |
| 04 | `04_uniforms_mouse/` | Uniforms | .pde + shader.glsl |
| 05 | `05_texture_grayscale/` | Using Textures | .pde + shader.glsl |
| 06 | `06_cpu_pixels/` | CPU vs GPU (CPU) | .pde |
| 07 | `07_texture_filter/` | CPU vs GPU (GPU) | .pde + shader.glsl |
| 08 | `08_post_brightness/` | Post-Processing | .pde + brightness.glsl |
| 09 | `09_post_vignette/` | Post-Processing | vignette.glsl |
| 10 | `10_post_tiling/` | Post-Processing | tile.glsl |
| 11 | `11_post_displace/` | Post-Processing | displace.glsl |
| 12 | `12_texture_wrap/` | textureWrap() | .pde + uv-adjust.glsl |
| 13 | `13_shader_image/` | Using shader() | .pde + shader.glsl |
| 14 | `14_custom_uv/` | More on UV coordinates | .pde |
| 15 | `15_custom_uv_shader/` | Custom shape UV + shader | .pde + shader.glsl |
| 16 | `16_vertex_shader/` | Adding a vertex shader | .pde + vert.glsl + frag.glsl |
| 17 | `17_vertex_colors/` | Vertex colors | .pde + vert.glsl + frag.glsl |
| 18 | `18_vertex_generative/` | 3D with Z coordinates | .pde + vert.glsl + frag.glsl |
| 19 | `19_vertex_displacement/` | PShape sphere | .pde + vert.glsl + frag.glsl |

### Original Examples (archived to `_assets/article-examples-converted/`)

| Directory | Type | Notes |
|-----------|------|-------|
| `fragment_01_solid_color/` | Standalone | From 50 Shades, uses green |
| `shader_demo_cpu_pixels_bug/` | Standalone | Bug demo |
| `shader_demo_custom_shape_uv/` | Standalone | Custom shape UVs (no texture) |
| `shader_demo_post_processing/` | Original | Combined 4-filter demo |
| `shader_demo_01/` through `shader_demo_vertex_shader_displacement/` | Original | Superseded by numbered versions |

### Diagrams (moved to `/diagrams/`)

| Directory | Notes |
|-----------|-------|
| `diagram_interpolation/` | Could illustrate rasterization section |
| `diagram_normals/` | Images used in article |
| `diagram_uv_coords/` | Images used in article |

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
  myShader.set("uSplitX", mouseX / float(width));
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
