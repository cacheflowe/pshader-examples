## WIP - outline of topics to cover

- Shader basics for true beginners (get the general idea using pixel shaders only)  
  - ✅ Let’s do more advanced & performant graphics with PShader  
  - ✅ Example 1: solid color  
    - 🚨 Note: can’t open a .frag or .glsl file in the IDE  
    - ✅ Explain color values & introduce vec4 (and other data types?)  
    - 🚨 Float vs int?  
  - ✅ Example 2: UV map colors,   
    - ✅ Explain: coordinate system & how each pixels draws itself  
    - ✅ (0,0) is bottom-left  
  - Example 3: Post processing an existing image - brightness? Chroma-style manipulation to show pixel-based operations? 
    - Explain: `texture` is a built-in uniform, which is used along with texture2d() for sampling. (which we can cover custom uniforms later) - Processing supplies a set of default uniforms which give you information to use inside of your shader. Every environment does some version of this  
    - We’re “talking to a pixel” - all of them at the same time. 
    - 👀 Ideas: Post fx - brightness, blur, vignette/radial gradient (note CustomBlend built in example)  
- How shaders work in Processing (PShader basics and built-in uniforms)  
  - Example:   
    - ✅ Time uniform to allow for movement or something else more explanatory  
    - ✅ interactive mouseX into a uniform, with one color on each side  
    - 🚨 Texture2d for grabbing existing pixels and doing something with them  
  - ✅ Explain: uniforms  
    - ✅ Shader can’t change at all on its own without at least one uniform (usually for *time*)  
    - ✅ Communication between CPU & GPU programs (aka Processing and Shader)  
    - ✅ Allows for interactivity  
    - ✅ Swizzling 
- Compositing with multiple images - using a matte or mask  
  - Example: use mouseX to blend between two images  
  - Explain: how to pass multiple textures into a shader as uniforms
- Drawing generative shapes with fragment shaders
- MATH - use circle example below
  - Show length/distance() to create a circle/vignette/radial gradient
  - Show sin()/cos() to animate a circle in a circle
    - Also show an example of centered coordinate system with aspect ratio correction
  - Show fract() to create a repeating pattern
- TEXTURES - color sampling, color adjustment, tiling
- “Advanced” fragment shader info: A shader is a different & potentially more efficient way of drawing  
  - ✅ Compare CPU vs GPU version of pixel manipulation to explain why shaders are great and fast  
  - Example: Aspect ratio correction & coordinate system?   
  - Example: draw a circle  
     - Link to SDF info  
     - Compare to drawing in Processing: ellipse()  
  - Neighbor pixels / kernel / gaussian (for blur, etc) 
     - Pixels don’t know anything about the rest of the image, besides where it is  
     - Fragment illustration - fireflies,
  - Check/convert notes in haxademic shaders README to explain the built-in uniforms and how to use them. Also, Alex’s default fragment/vertex shader  
     - UV coordinate concepts within variable sized canvases  
     - “Domain warping”  
        - Use fract() to create zoomed/tiled output (coordinate space manipulation / “domain warping”. Compare to texture/vertex in processing  
    - Note textureMode(REPEAT) vs CLAMP setting 
  - Generative drawing in a powerful/different way, a la Shadertoy  
    - Drawing tools - distance functions, patterns, noise
  - Note: filter() vs shader() behavior to contain the shader operation to an image or shape, vs applying the the entire canvas. This can be useful for only affecting specific images or geometry, and necessary for vertex shader usage, where fragment shaders can be applied either way.
- Vertex shaders  
  - What we could explain:   
    - Colors/texturing  
    - Displacement (vertex manipulation, color)  
    - Different types of shaders: \#COLOR, \#TEXTURE, \#TEXLIGHT, \#LINE, \#POINT  
  - Explain: Understand that we have been applying texture to two triangles all along  
    - Show classic rendering stages diagram?  
  - Make patterns and/or colors across a 3D shape  
    - This can show how shader() changes the global context and fragment shader is contained to the shape  
  - Color-per-vertex - without a shader you can set colors per vertex with fill() -\> vertex()  
    - Interpolation between vertices of colors, attribute values, texture coords  
  - 3d geometry & shading, which is the original use case of shaders  
    - How does the vertex position relate to screen space UV coords?  
  - Move in to 3D and adjust positions vertex on a plane  
    - Normals  
    - Uv coords  
  - Explain: varying values - passed from vertex shader to fragment shader  
    - Terrain example between CPU -\> GPU  
  - Explain: attributes  
- Advanced tutorial (Based on Andres’ Android tutorial)  
  - Gradient on a circle - run a shader on a PGraphics and apply as a texture to a circle  
  - Point to default shaders in the Processing source code to let folks know this stuff exists?  
  - Landscape built in example shows how to use shadertoy code?







## Comparing advanced texture mapping to shader drawing

- Zoom/tiling/panning with `texture()` and `vertex` vs doing it in a shader. There are good similarities here, especially around the concept of UV coordinates
- Displacement shader: 2 texture uniforms and reading one to apply to another
- Compositing w/multiple textures and a mask
- Radial gradient comparison

More topics:
- Randomness & noise
- Centering & aspect ratio correction or UV coords
- SDFs & shape drawing
- 


## Drawing shapes?

When `rect()` is called in Processing, there’s no simple equivalent in GLSL. This is where SDFs come into play. If a GLSL program only knows what its coordinate is, a rectangle function has to check its coordinate’s distance against the boundary of the calculation of a rectangle.  

## Vertex Shaders

* What we could explain:
  * That you need geometry to see vertex shaders in action
  * Basic vertex manipulation (position)
  * Colors/texturing 
  * Displacement (vertex manipulation, color)
  * Processing built-in attributes/uniforms for vertex shaders
  * Projection matrix / modelview matrix
  * How to connect a vertex shader to a fragment shader in Processing
    * varying variables to pass data between vertex and fragment shaders
  * Lighting basics (normals, light position, etc)
  

## Potential advanced topics

* Shaders can be applied to the main drawing window, or to a PGraphics instance  
* It is recommended that you use the loadShader() function instead of calling new PShader(), but this does open the door to more advanced options like shader compiling. Here be dragons
