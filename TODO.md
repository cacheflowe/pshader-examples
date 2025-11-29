# Shaders in Processing

This document continues the work from this Google Doc:

https://docs.google.com/document/d/1w9dV08FGh3ZgyY85iKcwuHZk3oYmdGV_6Xg8XwvWYGo/edit?pli=1&tab=t.0

## Notes from Raph:

- Random number function doesn't exist
- map() fucntion doesn't exist
- Noise function doesn't exist - 
- for loops shouldn't be used much
- certain things are better on the CPU
  - Text
  - Compliments the cpu
- Built-in uniforms
- Enough understanding to know use cases


Other ideas:
- Report pixel array issue in GitHub if the latest version of Processing hasn't fixed it
- PShapeUtil in a library - https://processing.github.io/processing-library-template/

## Conceptual Overview

- Explain the basics of shaders 
  - ✅ how they work (parallel) 
  - ✅ basic datatypes & swizzling
  - ✅ Explain the coordinate system 
- Relate as much as we can back to beginner/intermediate Processing concepts
  - PVector, PImage, PShape, etc.
- Build upon techniques for practical use cases
  - Post-processing effects
  - Generative drawing
  - Texture mapping
  - Geometry manipulation for large 3D shapes
- Advanced techniques
  - Noise/random functions
  - Custom data types
- Performance considerations

## Proposed Structure

Goal: ***what do shaders unlock***?

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
    - 🚨 Ideas: Post fx - brightness, blur, vignette/radial gradient (note CustomBlend built in example)  
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
  - 🚨 Note: filter() vs shader() behavior  
- MATH - use circle example below
- TEXTURES - color sampling, color adjustment, tiling
- “Advanced” fragment shader info: A shader is a different & potentially more efficient way of drawing  
  - ✅ Compare CPU vs GPU version of pixel manipulation to explain why shaders are great and fast  
  - Example Aspect ratio correction & coordinate system?   
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
  - Generative drawing in a powerful/different way, a la Shadertoy  
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

Each as an individual tutorial? One big tutorial? Seems like One Big Tutorial is the way it works on the Processing website (see [PVector](https://processing.org/tutorials/pvector/)).

