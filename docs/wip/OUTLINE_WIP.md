## WIP - outline of topics to cover

## Completed concepts

- ✅ Shader basics for true beginners (get the general idea using pixel shaders only)  
  - ✅ Let’s do more advanced & performant graphics with PShader  
  - ✅ Example 1: solid color  
    - ✅ Explain color values & introduce vec4 (and other data types?)  
      - ✅ Swizzling
    - ✅ Float vs int?  
  - ✅ Example 2: UV map colors,   
    - ✅ Explain: coordinate system & how each pixels draws itself  
    - ✅ (0,0) is bottom-left  
  - ✅ Example 3: Post processing an existing image - brightness? Chroma-style manipulation to show pixel-based operations? 
    - ✅ Explain: `texture` is a built-in uniform, which is used along with texture2d() for sampling. (which we can cover custom uniforms later) - Processing supplies a set of default uniforms which give you information to use inside of your shader. Every environment does some version of this  
    - ✅  Ideas: Post fx - brightness, blur, vignette/radial gradient (note CustomBlend built in example)  
- ✅ How shaders work in Processing (PShader basics and built-in uniforms)  
  - ✅ Example:   
    - ✅ Time uniform to allow for movement or something else more explanatory  
    - ✅ interactive mouseX into a uniform, with one color on each side  
    - ✅ Texture2d for grabbing existing pixels and doing something with them  
  - ✅ Explain: uniforms  
    - ✅ Shader can’t change at all on its own without at least one uniform (usually for *time*)  
    - ✅ Communication between CPU & GPU programs (aka Processing and Shader)  
    - ✅ Allows for interactivity  
    - ✅ Swizzling 
  - ✅ Show fract() to create a repeating pattern
- ✅ TEXTURES - color sampling, color adjustment, tiling
- ✅ “Advanced” fragment shader info: A shader is a different & potentially more efficient way of drawing  
  - ✅ Compare CPU vs GPU version of pixel manipulation to explain why shaders are great and fast  
     ✅ - UV coordinate concepts within variable sized canvases  
     ✅ - “Domain warping”  
        ✅ - Use fract() to create zoomed/tiled output (coordinate space manipulation / “domain warping”). Compare to texture/vertex in processing  
    - ✅ Note textureMode(REPEAT) vs CLAMP setting 
  - ✅ Note: filter() vs shader() behavior to contain the shader operation to an image or shape, vs applying the the entire canvas. This can be useful for only affecting specific images or geometry, and necessary for vertex shader usage, where fragment shaders can be applied either way.
  
## Remaining concepts to cover

### Vertex shaders  

- ✅ That you need geometry to see vertex shaders in action
- ✅ texturing
- ✅ Colors set on vertices
  - * `varying vec4 vertColor` - Original vertex color, supplied by Processing draw calls (or PShape)
- ✅ Displacement (vertex manipulation, color)  
- Different types of shaders: #COLOR, #TEXTURE, #TEXLIGHT, #LINE, #POINT  
- 🚨Explain: Understand that we have been applying texture to two triangles all along - do this in the rasterization section
  - ✅ Show classic rendering stages diagram?  
- 🚨 Make patterns and/or colors across a 3D shape  
  - ✅ This can show how shader() changes the global context and fragment shader is contained to the shape  
- ✅ Color-per-vertex - without a shader you can set colors per vertex with fill() -> vertex()  
  - 🚨 Interpolation between vertices of colors, attribute values, texture coords - do this in the rasterization section 
- 3d geometry & shading, which is the original use case of shaders  
  - ✅ How does the vertex position relate to screen space UV coords?
- ✅ Move in to 3D and adjust positions vertex on a plane  
  - ✅ Normals  
  - ✅ UV coords  
- ✅ Explain: varying values - passed from vertex shader to fragment shader  
  - 🚨 Terrain example between CPU -> GPU
- ✅ Explain: attributes  
  - Custom attributes would be cool - are these only on PShape? And not in the official documentation despite being public method `attrib()`
- Advanced tutorial (Based on Andres’ Android tutorial)  
- Gradient on a circle - run a shader on a PGraphics and apply as a texture to a circle  
- ✅ Point to default shaders in the Processing source code to let folks know this stuff exists? 
  - https://github.com/processing/processing4/tree/main/core/src/processing/opengl/shaders
- Landscape built in example shows how to use shadertoy code?
- PShape!
  - This speeds up the sketch because creating geometry is expensive. With the geometry cached, the program runs faster. 


* Extra Vertex shader notes - TODO: merge these into the outline above
  * ✅  transform matrix - esp when thinking about z-displacement
    * ✅ Need to displace in the direction of the model normal, not just z-axis in space
    * ✅ PShape solves for some of this
  * ✅ Processing built-in attributes/uniforms for vertex shaders
    - 🚨 Note the **interpolation** of texture data, behaves just like the interpolation of color data if vertices are drawn with colors, and how this color data is also passed as "varying" data from the vertex shader to the fragment shader
  * Line shader, point shader types, texlight
    * Fill + stroke gets more complicated
  * ✅ Projection matrix / modelview matrix
  * ✅ How to connect a vertex shader to a fragment shader in Processing
    * ✅ varying variables to pass data between vertex and fragment shaders
  * Particles - check points demo in 50 shades dir
  * Lighting basics (normals, light position, etc)
  - custom lighting:
    - https://github.com/processing/processing-examples/tree/main/Topics/Shaders/GlossyFishEye
    - https://github.com/processing/processing-examples/tree/main/Topics/Shaders/ToonShading


### Back to fragment shaders - math, functions, generative drawing

- ✅ We're "talking to a pixel" - all of them at the same time. 
  - ✅ Show rasterization diagram? especially when we get to vertex shaders and non-rectangular shapes
- Check/convert notes in haxademic shaders README to explain the built-in uniforms and how to use them. Also, Alex’s default fragment/vertex shader  
- Add to post-processing section?
  - Compositing with multiple images - using a matte or mask  
    - Example: use mouseX to blend between two images  
    - Explain: how to pass multiple textures into a shader as uniforms
- Go back to add generative shader examples
- Come back to drawing generative shapes with fragment shaders now that we've covered coordinates, uniforms, textures
  - Generative drawing in a powerful/different way, a la Shadertoy  
  - SDFs & shape drawing
    - Comparison: When `rect()` is called in Processing, there’s no simple equivalent in GLSL. This is where SDFs come into play. If a GLSL program only knows what its coordinate is, a rectangle function has to check its coordinate’s distance against the boundary of the calculation of a rectangle.  
  - Show aspect-correction example to draw a proper circle, regardless of canvas size
    - look at 50shades 01/04 example
    - Centering & aspect ratio correction or UV coords
  - Drawing tools - distance functions, patterns, noise
  - Example: Aspect ratio correction & coordinate system?   
  - Example: draw a circle  
     - Link to SDF info  
     - Compare to drawing in Processing: ellipse()  
  - Neighbor pixels / kernel / gaussian (for blur, etc) - texOffset - could be added in post-processing section!
     - Pixels don’t know anything about the rest of the image, besides where it is  
     - Fragment illustration - fireflies,
    - `texOffset` & sampling kernel w/built-in texOffset uniform for neighbor pixels
      - https://github.com/processing/processing-examples/blob/main/Topics/Shaders/BlurFilter/data/blur.glsl
    -  `uniform vec2 texOffset` - The size of a pixel, mapped to normalized `vertTexCoord` coordinates. If original texture is 1000px wide, `texOffset.x` is 1/1000.
  - MATH - use circle example below
    - Show length/distance() to create a circle/radial gradient
    - Show sin()/cos() to animate a circle in a circle
    - Show mix() to blend between two colors
    - Noise generation - compare to noise() in Processing
      - Could implement a grain post-processing effect as a demo, or displacement in a vertex shader
    - Randomness & noise (no noise() or random() functions in GLSL)
    - map() function doesn't exist. show custom implementation  
      ```glsl
      float remap(float value, float low1, float high1, float low2, float high2) {
        return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
      }
      ```

- PGraphics can use shaders for more advanced multi-canvas rendering & compositing
  - pg.filter() doesn't need beginDraw()/endDraw()
  - pg.shader() does need beginDraw()/endDraw()
  - Shaders can be applied to the main drawing window, or to a PGraphics instance  

- PShape advanced ideas
  - `attrib()` custom attributes

- Simulation ideas?  
  - Particle systems? Probably too advanced for this tutorial  
  - Cellular automata? https://github.com/processing/processing-examples/tree/main/Topics/Shaders
    - `ppixels`!!!!! Conway example - simulation shaders


## Summary/conclusion 

???
