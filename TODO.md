# Shaders in Processing

This document continues the work from this [Google Doc](https://docs.google.com/document/d/1w9dV08FGh3ZgyY85iKcwuHZk3oYmdGV_6Xg8XwvWYGo/edit?pli=1&tab=t.0), now converted to [GOOGLE_DOC.md](GOOGLE_DOC.md)

Tools used:

- Rich text to markdown converter: https://www.rich-text-to-markdown.com/
- Alex Miller’s notes: [Processing Shader documentation](https://docs.google.com/document/d/1TjO6dV0GUC4caGDnegNnzS2VBH-hDfN8hql-CFop1hk/edit?tab=t.0)   
- [https://github.com/cacheflowe/haxademic/tree/master/data/haxademic/shaders](https://github.com/cacheflowe/haxademic)   
  - lots of notes about built-in uniforms here  
* [https://github.com/cacheflowe/haxademic/blob/master/guides/shaders-intro.md](https://github.com/cacheflowe/haxademic/blob/master/guides/shaders-intro.md)   
* [https://processing.org/reference/loadShader_.html](https://processing.org/reference/loadShader_.html)   
* [https://processing.org/reference/PShader.html](https://processing.org/reference/PShader.html)   


## Next steps / Editing

- Add more screenshots of results
- Adjust uniforms names to have a `u` prefix to indicate they are uniforms
- Make sure examples exactly match the demos in the tutorial
- Standardize capitalization in comments
- Ask about punctuation/apostrophes/etc
- The first time a Processing function is mentioned, add a link to the documentation page for it:
  - filter(): https://processing.org/reference/filter_.html
  - PShader.set(): https://processing.org/reference/PShader_set_.html
- Apply the [style guide](https://p5js.org/contribute/documentation_style_guide/#unbiased-documentation)

## Notes from Raph

- Random number function doesn't exist
- map() function doesn't exist. show custom implementation  
  ```glsl
  float remap(float value, float low1, float high1, float low2, float high2) {
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1);
  }
  ```
- Noise function doesn't exist - how to handle?
- certain things are better on the CPU
  - Text
  - Shaders complement the CPU
- Built-in uniforms - check Alex's .md file. Where's the definitive list? Look @ Processing4 source
- Enough understanding to know use cases


## Other ideas

- PGraphics can use shaders for more advanced multi-canvas rendering & compositing
  - pg.filter() doesn't need beginDraw()/endDraw()
  - pg.shader() does need beginDraw()/endDraw()
- Report pixel array issue in GitHub if the latest version of Processing hasn't fixed it
- PShapeUtil in a library - https://processing.github.io/processing-library-template/


## Conceptual Overview

- Overarching goal for creative coding, not just GLSL proficiency: ***what do shaders unlock***?
- Explain the basics of shaders 
  - ✅ how they work (parallel) 
  - ✅ basic datatypes & swizzling
  - ✅ Explain the coordinate system 
- Relate as much as we can back to beginner/intermediate Processing concepts
  - PVector / math functions
  - PImage
  - PShape
- Functions in Processing vs GLSL
  - https://registry.khronos.org/OpenGL/specs/
  - Function analogies (Look at comparisons in `.github/processing-functions.md`):
    - sin() ~ sin()
    - cos() ~ cos()
    - ???
    - PVector ~ vec2/vec3/vec4
    - PImage ~ sampler2D
    - PVector.dist() ~ distance()
    - PVector.mag() ~ length()
    - PVector.normalize() ~ normalize()
    - PVector.lerp() ~ mix()
- Build upon techniques for practical use cases
  - ✅ Post-processing effects
  - Generative drawing
  - ✅ Texture mapping
  - Geometry manipulation for (large?) 3D shapes
- Advanced techniques
  - Noise/random functions
  - Custom data types
- Performance considerations
  - for loops shouldn't be used much
  - minimize conditionals
  - too many texture lookups are bad
- Note the connection with ML tools - shaders were foundational in the current age of ML advancements, and new technologies have evolved from there

