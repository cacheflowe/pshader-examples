# Shaders in Processing

Tools used:

- Rich text to markdown converter: https://www.rich-text-to-markdown.com/
- PDF to markdown converter: https://github.com/microsoft/markitdown
```powershell
python -m venv .venv
source .venv/bin/activate # macOS/Linux
.\venv\Scripts\activate.bat # Windows
cd packages
pip install -e markitdown[all]
markitdown "D:\workspace\pshader-examples\_assets\es_full_spec_2.0.pdf" > "D:\workspace\pshader-examples\_assets\es_full_spec_2.0.md"
```

Cool cat image source:
- https://www.freepik.com/free-photo/beautiful-cat-portrait-close-up_19866347.htm


## Notes from Raph

- Random number function doesn't exist
- map() function doesn't exist. show custom implementation  
- Noise function doesn't exist - how to handle?
- certain things are better on the CPU
  - Text
  - Shaders complement the CPU
- Enough understanding to know use cases
- List of built-in uniforms. Where's the definitive list? Look @ Processing4 source

## Bring these in for reference:

- https://github.com/SableRaf/Filters4Processing
- https://github.com/SableRaf/Shadertoy2Processing
- https://github.com/prontopablo/FIP
  - https://prontopablo.github.io/FIP/

## Topics to cover in tutorial

- Overarching goal for creative coding, not just GLSL proficiency: ***what do shaders unlock***?
- Relate as much as we can back to beginner/intermediate Processing concepts
  - PVector / math functions
  - PImage
  - PShape
- Performance considerations
  - for loops shouldn't be used much
  - minimize conditionals
  - too many texture lookups are bad
- It is recommended that you use the loadShader() function instead of calling new PShader(), but this does open the door to more advanced options like shader compiling. Here be dragons

## Other ideas
  
Outside the scope of tutorial
- PShapeUtil in a library - https://processing.github.io/processing-library-template/
Help with pixelDensity issues
- https://github.com/processing/processing4/blob/main/BUILD.md

##  Notes from Raph convo

- Pshader abstracts boilerplate of OpenGL for setting up shaders
  - What are simplifications provided by processing vs opengl?
  - built-in conveniences
- Expand on the idea of a fragment shader in a visual way
  - show a grid of pixels
  - thendl - explains this well with human pixels
  - put the person in the pixel fragment themselves - little autonomous programs
  - little computer people
- More nasa images to replace cool cat? Maybe change NASA image
  - Public domain image archive? https://pdimagearchive.org/
  - Use chuck photo



# Justin’s extra/advanced notes/topics

* Topics that I wish I had guidance on early on:  
  * Loading only a fragment shader and using filter()  
  * The difference between filter() on an existing PGraphics or app surface vs shader() and then drawing some geometry or a PImage  
    * When using shader(), making sure to call resetShader()  
  * Explanation of some of the common provided uniforms \- what do they mean?  
    * Relate these to shadertoy or other common GLSL environments?   
    * I have notes on this [here](https://github.com/cacheflowe/haxademic/blob/master/data/haxademic/shaders/README.md)  
  * Using uniforms, and the difference between float/int  
  * Pointing out the [default shaders](https://github.com/benfry/processing4/tree/main/core/src/processing/opengl/shaders) location, as Alex pointed out  
    * Noting when to use each type, and the \#SHADER\_TYPE preprocessor that belongs to each  
  * Setting [attributes](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_VertexShader_GPUParticlesMoveShapes_DepthCamera.java#L123) as geometry metadata using attrib()  
    * PShape is a relevant topic to shaders, but starting with basic geometry interactions with shaders would be good to cover  
  * Which version number of GLSL is default, and what happens when you try to compile your own shaders (the version number gets weird). It’s maybe important to know how this relates to GLSL documentation and why your shader’s main() looks different from ShaderToy  
* Examples:  
  * I have a ton of ready-to-use (and no-so-ready) shader examples [here](https://github.com/cacheflowe/haxademic/tree/master/data/haxademic/shaders)  
  * Matcap is a simple but powerful shader concept  
    * @wblut has a demo [here](https://wblut.com/code/matcap.zip) and I reimplemented [here](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_MatCap.java#L25)  
  * [https://github.com/codeanticode/pshader-experiments](https://github.com/codeanticode/pshader-experiments)   
  * [https://github.com/cansik/processing-postfx](https://github.com/cansik/processing-postfx)   
  * [https://github.com/genekogan/Processing-Shader-Examples](https://github.com/genekogan/Processing-Shader-Examples)   
* Off the deep end:  
  * I have a hot-reloading PShader compiler [here](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/core/draw/context/PShaderHotSwap.java) that uses an hacky PShader [subclass](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/core/draw/context/PShaderCompiler.java) to do its job  
  * You can compile glsl from [inline code](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_VertexShader_ReloadInlineGlsl_Rippleskin.java), especially now that the Processing IDE supports multiline strings  
  * Using float32 textures for particle simulations. I have a solution in this [GitHub issue](https://github.com/benfry/processing4/issues/724), but also have a [working](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/core/draw/context/pg32/PGraphics32.java) [implementation](https://github.com/cacheflowe/haxademic/blob/master/src/com/haxademic/demo/draw/shapes/shader/Demo_VertexShader_GPUParticles.java) that I could convert into a pure Processing demo