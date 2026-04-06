# Article Structure Map

Mapping between README.md sections, their corresponding example directories, and asset files.

This serves as the source-of-truth for the code import system and helps track which examples belong to which sections.

---

## Section → Example Mapping

| Section in README.md | Example Directory | Files Used |
|---------------------|-------------------|------------|
| Writing a First Shader | `shader_demo_01/` | `shader_demo_01.pde`, `shader.glsl` |
| A New Coordinate System (x-gradient) | `shader_demo_02/` | `shader_demo_02.pde`, `shader.glsl` |
| A New Coordinate System (UV map) | `shader_demo_03_uv_map/` | `shader_demo_03_uv_map.pde`, `data/shader.glsl` |
| Uniforms: Mouse split | `shader_demo_04/` | `shader_demo_04.pde`, `shader.glsl` |
| Uniforms: Time animation | `shader_demo_04/` | (partial - draw loop only) |
| Using Textures (grayscale) | `shader_demo_gpu_pixels/` | `shader_demo_gpu_pixels.pde`, `data/shader.glsl` |
| CPU vs GPU comparison (CPU) | `shader_demo_cpu_pixels/` | `shader_demo_cpu_pixels.pde` |
| CPU vs GPU comparison (GPU) | `shader_demo_texture_filter/` | `shader_demo_texture_filter.pde`, `data/shader.glsl` |
| Post-Processing: Brightness | `shader_demo_post_processing/` | `data/brightness.glsl` |
| Post-Processing: Vignette | `shader_demo_post_processing/` | `data/vignette.glsl` |
| Post-Processing: Tiling | `shader_demo_post_processing/` | `data/tiling.glsl` |
| Post-Processing: Displacement | `shader_demo_post_processing/` | `data/displace.glsl` |
| textureWrap() | `shader_demo_repeat/` | `shader_demo_repeat.pde`, `data/uv-adjust.glsl` |
| Using shader() | `shader_demo_image_shader/` | `shader_demo_image_shader.pde`, `data/shader.glsl` |
| More on UV coordinates | `shader_demo_image_uv_coords/` | `shader_demo_image_uv_coords.pde` |
| Custom shape UV + shader | `shader_demo_custom_shape_uv_shader/` | Both .pde and `data/shader.glsl` |
| Adding a vertex shader | `shader_demo_vertex_shader/` | .pde, `data/frag.glsl`, `data/vert.glsl` |
| Vertex colors | `shader_demo_vertex_shader_colors/` | .pde, `data/frag.glsl`, `data/vert.glsl` |
| 3D with Z coordinates | `shader_demo_vertex_shader_generative/` | .pde, `data/frag.glsl`, `data/vert.glsl` |
| PShape sphere displacement | `shader_demo_vertex_shader_displacement/` | .pde, `data/frag.glsl`, `data/vert.glsl` |

## Diagram → Section Mapping

| Diagram | Example Directory | Used In Section |
|---------|-------------------|-----------------|
| UV coordinate grid | `diagram_uv_coords/` | A New Coordinate System |
| Normal directions | `diagram_normals/` | Adding Z coordinates |
| Interpolation | `diagram_interpolation/` | (not yet used - for rasterization section) |

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
