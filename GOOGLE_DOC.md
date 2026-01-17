
## Proposed Structure

Goal: ***what do shaders unlock***?

* Shader basics for true beginners (get the general idea using pixel shaders only)  
  * Let’s do more advanced & performant graphics with PShader  
  * Example 1: solid color  
    1. Note: can’t open a .frag or .glsl file in the IDE  
    2. Explain color values & introduce vec4 (and other data types?)  
    3. Float vs int?  
  * Example 2: UV map colors,   
    1. Explain: coordinate system & how each pixels draws itself  
    2. (0,0) is bottom-left  
  * Example 3: Post processing an existing image - brightness? Chroma-style manipulation to show pixel-based operations? )  
    1. Explain: Texture is a built-in uniform, which is used along with texture2d() for sampling. (which we can cover custom uniforms later) - Processing supplies a set of default uniforms which give you information to use inside of your shader. Every environment does some version of this  
    2. We’re “talking to a pixel” - all of them at the same time. Pixels don’t know anything about the rest of the image, besides where it is  
    3. Ideas: Post fx - brightness, blur, vignette/radial gradient (note CustomBlend built in example)  
* How shaders work in Processing (PShader basics and built-in uniforms)  
  * Example:   
    1. Time uniform to allow for movement or something else more explanatory  
    2. interactive mouseX into a uniform, with one color on each side  
    3. Texture2d for grabbing existing pixels and doing something with them  
  * Explain: uniforms  
    1. Shader can’t change at all on its own without at least one uniform (usually for *time*)  
    2. Communication between CPU & GPU programs (aka Processing and Shader)  
    3. Allows for interactivity   
  * Note: filter() vs shader() behavior  
* “Advanced” fragment shader info: A shader is a different & potentially more efficient way of drawing  
  * Compare CPU vs GPU version of pixel manipulation to explain why shaders are great and fast  
  * Example Aspect ratio correction & coordinate system?   
    1. Example: draw a circle  
       1. Link to SDF info  
       2. Compare to drawing in Processing: ellipse()  
    2. Neighbor pixels / kernel / gaussian (for blur, etc)  
    3. Check/convert notes in haxademic shaders README to explain the built-in uniforms and how to use them. Also, Alex’s default fragment/vertex shader  
       1. UV coordinate concepts within variable sized canvases  
       2. “Domain warping”  
          1. Use fract() to create zoomed/tiled output (coordinate space manipulation / “domain warping”. Compare to texture/vertex in processing  
  * Generative drawing in a powerful/different way, a la Shadertoy  
* Vertex shaders  
  * What we could explain:   
    1. Colors/texturing  
    2. Displacement (vertex manipulation, color)  
    3. Different types of shaders: #COLOR, #TEXTURE, #TEXLIGHT, #LINE, #POINT  
  * Explain: Understand that we have been applying texture to two triangles all along  
    1. Show classic rendering stages diagram?  
  * Make patterns and/or colors across a 3D shape  
    1. This can show how shader() changes the global context and fragment shader is contained to the shape  
  * Color-per-vertex - without a shader you can set colors per vertex with fill() -> vertex()  
    1. Interpolation between vertices of colors, attribute values, texture coords  
  * 3d geometry & shading, which is the original use case of shaders  
    1. How does the vertex position relate to screen space UV coords?  
  * Move in to 3D and adjust positions vertex on a plane  
    1. Normals  
    2. Uv coords  
  * Explain: varying values - passed from vertex shader to fragment shader  
    1. Terrain example between CPU -> GPU  
  * Explain: attributes  
* Advanced tutorial (Based on Andres’ Android tutorial)  
  * Gradient on a circle - run a shader on a PGraphics and apply as a texture to a circle  
  * Point to default shaders in the Processing source code to let folks know this stuff exists?  
  * Landscape built in example shows how to use shadertoy code?

Each as an individual tutorial? One big tutorial? Seems like One Big Tutorial is the way it works on the Processing website (see [PVector](https://processing.org/tutorials/pvector/)).

## Material & Reference

From Chris:  
*All, I just heard back from Andreas who said he has finished a revamped shaders tutorial. He is willing to share it but it will need some editing as it is going to be part of his processing for android book and so it is focused on mobile and android. I assume that also means it will be quite robust. I will have a copy soon and am happy to chat with whomever about editing and deciding if that is still the direction to go?*

*[Processing-Android-Chapter-15-GLSL-shaders.pdf](https://drive.google.com/file/d/1nDBK9xJrGVSm3gbQPBfxRf17LvASlh-X/view?usp=sharing)*

From Raphaël:  
*We built those examples for an introduction to Shaders in Processing back then. The code is heavily commented and each example was built to introduce a new concept. Credit: Raffael “Moco” Shiller, Maximilian Mittermeier, Raphaël de Courville*

Text: [140607 Shader Tutorial 2014](https://docs.google.com/document/d/1Ctp7HwMX65QuyEy8UZ8DLnVAiKDVVjq3NQbPcEJ2jDc/edit#heading=h.lhw7aoa2dbbv)  
Code Examples: [1405_FiftyShadesOfShaders_update](https://www.dropbox.com/scl/fo/lyc4ag8vdplfq5ddv9o30/AM4t7lnCrOvDLMpCHB6cbQs?rlkey=ixuh602wmzt42qr19d6p9pc5c&dl=0)

![][image1]

![][image2]

![][image3]

From Nick:  
[https://en.wikibooks.org/wiki/Cg_Programming/Unity](https://en.wikibooks.org/wiki/Cg_Programming/Unity)  
*This uses Unity's Legacy Pipeline, scripted in CGFX--but it could be easily adapted for GLSL, and it was my first resource for shader writing. Look particularly at the progression of examples--the organization makes a lot more sense to me than many. And another really important thing is, they stress the difference between the boilerplate or markup for using the shader code (which Unity somewhat confusingly calls "ShaderLab" and the shader code itself*

## Notes

Spacefiller: *This is an aside, but I really like this ontology of documentation that divides things up into four distinct categories: [https://docs.divio.com/documentation-system/](https://docs.divio.com/documentation-system/). I think the Processing documentation already does a pretty good job of this, but could be useful to keep in mind as new docs are added!*

* *We can release a set of Examples that would have the focus of Shaders!?*  
* *(need to look at the examples that exist.)*  
* *PDZE File format and Url format - it will download a folder and open it in Processing*  
* *Proof of concept: [https://sableraf.github.io/testURIscheme/](https://sableraf.github.io/testURIscheme/)*  
* *Wholesome version of North Korea explanation*

## Other links

* Alex Miller’s notes: [Processing Shader documentation](https://docs.google.com/document/d/1TjO6dV0GUC4caGDnegNnzS2VBH-hDfN8hql-CFop1hk/edit?tab=t.0)   
* [https://github.com/cacheflowe/haxademic/tree/master/data/haxademic/shaders](https://github.com/cacheflowe/haxademic)   
    - lots of notes about built-in uniforms here  
* [The Pixel Swarm | thndl](https://thndl.com/the-pixel-swarm.html)  
* [https://github.com/cacheflowe/haxademic/blob/master/guides/shaders-intro.md](https://github.com/cacheflowe/haxademic/blob/master/guides/shaders-intro.md)   
* [https://processing.org/reference/loadShader_.html](https://processing.org/reference/loadShader_.html)   
* [https://processing.org/reference/PShader.html](https://processing.org/reference/PShader.html)   
* [https://www.reddit.com/r/processing/comments/wg17pa/how_to_use_shader/?rdt=41083](https://www.reddit.com/r/processing/comments/wg17pa/how_to_use_shader/?rdt=41083)   
* [learningprocessing.com](http://learningprocessing.com) - tons of Processing examples to compare against  
  


# Justin’s notes/topics

* Topics that I wish I had guidance on early on:  
  * Loading only a fragment shader and using filter()  
  * The difference between:  
    * filter() on an existing PGraphics or app surface *vs*   
    * shader() and then drawing some geometry or a PImage  
      * When using shader(), making sure to call resetShader(), like push()/pop()  
  * Explanation of some of the common provided uniforms - what do they mean?  
    * Alex’s Google doc notes these  
    * Relate these to shadertoy or other common GLSL environments?   
    * I have notes on this [here](https://github.com/cacheflowe/haxademic/blob/master/data/haxademic/shaders/README.md)  
  * Using uniforms, and the difference between float/int  
  * Pointing out the [default shaders](https://github.com/benfry/processing4/tree/main/core/src/processing/opengl/shaders) location, as Alex pointed out  
    * Noting when to use each type, and the #SHADER_TYPE preprocessor that belongs to each  
  * Setting [attributes](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_VertexShader_GPUParticlesMoveShapes_DepthCamera.java#L123) as geometry metadata using attrib()  
    * PShape is a relevant topic to shaders, but starting with basic geometry interactions with shaders would be good to cover  
  * Which version number of GLSL is default, and what happens when you try to compile your own shaders (the version number gets weird). It’s maybe important to know how this relates to GLSL documentation and why your shader’s main() looks different from ShaderToy  
* Examples:  
  * I have a ton of ready-to-use (and no-so-ready) shader examples [here](https://github.com/cacheflowe/haxademic/tree/master/data/haxademic/shaders)  
  * Matcap is a simple but powerful shader concept  
    * @wblut has a demo [here](https://wblut.com/code/matcap.zip) and I reimplemented [here](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_MatCap.java#L25)  
  * [https://github.com/codeanticode/pshader-experiments](https://github.com/codeanticode/pshader-experiments)   
  * [https://github.com/cansik/processing-postfx](https://github.com/cansik/processing-postfx) - PostFX for Processing  
  * [https://github.com/genekogan/Processing-Shader-Examples](https://github.com/genekogan/Processing-Shader-Examples)   
* Off the deep end:  
  * I have a hot-reloading PShader compiler [here](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/core/draw/context/PShaderHotSwap.java) that uses an hacky PShader [subclass](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/core/draw/context/PShaderCompiler.java) to do its job  
  * You can compile glsl from [inline code](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_VertexShader_ReloadInlineGlsl_Rippleskin.java), especially now that the Processing IDE supports multiline strings  
  * Using float32 textures for particle simulations. I have a solution in this [GitHub issue](https://github.com/benfry/processing4/issues/724), but also have a [working](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/core/draw/context/pg32/PGraphics32.java) [implementation](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_VertexShader_GPUParticles.java) that I could convert into a pure Processing demo

