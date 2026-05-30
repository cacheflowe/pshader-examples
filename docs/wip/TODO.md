# TODO

## Next steps / Editing

- Continue filling out OUTLINE_WIP.md as we write the tutorial in README.md
- Capture missing example screenshots (run sketch + click to saveFrame):
  - `example_09_noise_grain` — film grain effect
  - `example_15_kernel_blur` — blur/edge detection
  - `example_25_point_shader` — point shader grid
  - `example_08_sdf_circle` — animated gif of SDF circle
  - `example_19_multi_texture` — multi-texture blend
  - `example_20_multi_texture_displace` — noise displacement
- Source 7 intro gallery images (inspirational artist work for lines 65–93)
- Add more screenshots of results
- Adjust uniforms names to have a `u` prefix to indicate they are uniforms
- Link to processing-examples shader examples in tutorial
- Show a cool demo (images/video) that show cool things that shaders can do
- Clean up this table: `Processing Code to Set Value | GLSL Uniform Declaration` - should show arrays!
- Make sure examples exactly match the demos in the tutorial
- Standardize capitalization in comments
- The first time a Processing function is mentioned, add a link to the documentation page for it:
  - filter(): https://processing.org/reference/filter_.html
  - PShader.set(): https://processing.org/reference/PShader_set_.html
  - Make a pass through the tutorial and add ticks around keywords and links to reference pages. What's the standard here?
- Apply the [style guide](https://p5js.org/contribute/documentation_style_guide/#unbiased-documentation)
- Resave images w/old dimensions - make 640x480
- Change cool cat to chuck doge


## Questions:

- Ask about punctuation/apostrophes/etc
- Can/should we link to this repo's examples in tutorial?
  - If so, I should rename the sketch folders 
  - Should more examples be created in the official examples repo in a PShader tutorial section?
- Replace cat pics with Chuck pics!
  - Can I use the example image I found? cool cat? what else could we use here?
  - https://www.freepik.com/free-photo/beautiful-cat-portrait-close-up_19866347.htm
- Do we actually need these directives? `#define PROCESSING_TEXTURE_SHADER`
- Do we need precision specifiers in fragment shaders?
```c++
#ifdef 
precision mediump float; 
#endif
```
