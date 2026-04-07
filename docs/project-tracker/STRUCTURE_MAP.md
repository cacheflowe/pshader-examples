# Article Structure Map

Mapping between README.md sections, their corresponding example directories, and asset files.

This serves as the source-of-truth for the code import system and helps track which examples belong to which sections.

---

## Section → Example Mapping (Updated)

_All examples now use numbered directories with import directives in `README_SRC.md`._
_Original `shader_demo_*` directories archived to `_assets/article-examples-converted/`._

| Section in README.md | New Example Directory | Files Imported | Old Directory |
|---------------------|----------------------|----------------|---------------|
| Writing a First Shader | `01_solid_color/` | .pde + shader.glsl | `shader_demo_01/` |
| A New Coordinate System (x-gradient) | `02_uv_gradient/` | shader.glsl | `shader_demo_02/` |
| A New Coordinate System (UV map) | `03_uv_map/` | shader.glsl | `shader_demo_03_uv_map/` |
| Uniforms: Mouse split | `04_uniforms_mouse/` | .pde + shader.glsl | `shader_demo_04/` |
| Uniforms: Time animation | (inline snippet) | — | — |
| Using Textures (grayscale) | `05_texture_grayscale/` | .pde + shader.glsl | `shader_demo_gpu_pixels/` |
| CPU vs GPU comparison (CPU) | `06_cpu_pixels/` | .pde | `shader_demo_cpu_pixels/` |
| CPU vs GPU comparison (GPU) | `07_texture_filter/` | .pde + shader.glsl | `shader_demo_texture_filter/` |
| Drawing Shapes with Math: SDFs | `08_sdf_circle/` | .pde + shader.glsl | (new — added after tracker was written) |
| Post-Processing: Brightness | `09_post_brightness/` | .pde + brightness.glsl | `shader_demo_post_processing/` |
| Post-Processing: Vignette | `10_post_vignette/` | vignette.glsl | `shader_demo_post_processing/` |
| Post-Processing: Tiling | `11_post_tiling/` | tile.glsl | `shader_demo_post_processing/` |
| Post-Processing: Displacement | `12_post_displace/` | displace.glsl | `shader_demo_post_processing/` |
| textureWrap() | `13_texture_wrap/` | .pde + uv-adjust.glsl | `shader_demo_repeat/` |
| Using shader() | `14_shader_image/` | .pde + shader.glsl | `shader_demo_image_shader/` |
| More on UV coordinates | `15_custom_uv/` | .pde | `shader_demo_image_uv_coords/` |
| Custom shape UV + shader | `16_custom_uv_shader/` | .pde + shader.glsl | `shader_demo_custom_shape_uv_shader/` |
| Adding a vertex shader | `17_vertex_shader/` | .pde + vert.glsl + frag.glsl | `shader_demo_vertex_shader/` |
| Vertex colors | `18_vertex_colors/` | .pde + vert.glsl + frag.glsl | `shader_demo_vertex_shader_colors/` |
| 3D with Z coordinates | `19_vertex_generative/` | .pde + vert.glsl + frag.glsl | `shader_demo_vertex_shader_generative/` |
| PShape sphere displacement | `20_vertex_displacement/` | .pde + vert.glsl + frag.glsl | `shader_demo_vertex_shader_displacement/` |

## Diagram → Section Mapping

Diagrams live in `/diagrams/` (moved from `/examples/`).

| Diagram | Directory | Used In Section |
|---------|-----------|----------------|
| UV coordinate grid | `diagrams/diagram_uv_coords/` | A New Coordinate System |
| Normal directions | `diagrams/diagram_normals/` | Adding Z coordinates |
| Interpolation | `diagrams/diagram_interpolation/` | (not yet used - for rasterization section) |

## Screenshots → Section Mapping

All images are in `/images/`. Each corresponds to an example output.

| Image File | Section |
|-----------|---------|
| `shader_demo_01.png` | Writing a First Shader |
| `shader_demo_02.png` | A New Coordinate System |
| `shader_demo_03.png` | A New Coordinate System (UV map) |
| `example-04.gif` | Uniforms (mouse split) |
| `shader_demo_gpu_pixels.png` | Using Textures |
| `shader_demo_texture_filter.png` | CPU vs GPU |
| `shader_demo_post_processing-brightness.png` | Post-Processing |
| `shader_demo_post_processing-vignette.png` | Post-Processing |
| `shader_demo_post_processing-tiling.png` | Post-Processing |
| `shader_demo_post_processing-displace.png` | Post-Processing |
| `shader_demo_repeat-clamp.png` | textureWrap() |
| `shader_demo_repeat-repeat.png` | textureWrap() |
| `shader_demo_image_shader.png` | Using shader() |
| `shader_demo_image_uv_coords.png` | More on UV coordinates |
| `shader_demo_custom_shape_uv_shader.png` | Custom shape UV |
| `shader_demo_vertex_shader.png` | Adding a vertex shader |
| `shader_demo_vertex_shader_colors.png` | Vertex colors |
| `shader_demo_vertex_shader_generative.png` | 3D with Z |
| `shader_demo_vertex_shader_displacement.png` | PShape sphere |
| `diagram_uv_coords.png` | A New Coordinate System |
| `diagram_normals-rect.png` | Adding Z coordinates |
| `diagram_normals-sphere.png` | Adding Z coordinates |
| `rasterisation.png` | Rasterization pipeline |
| `graphics-pipeline-andres.png` | (in FEEDBACK.md) |
