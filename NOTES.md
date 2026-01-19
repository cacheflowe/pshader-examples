# Shaders in Processing

Tools used:

- Rich text to markdown converter: https://www.rich-text-to-markdown.com/
- PDF to markdown converter: https://github.com/microsoft/markitdown
```powershell
source .venv/bin/activate
\venv\Scripts\activate.bat
cd packages
pip install -e markitdown[all]
markitdown "D:\workspace\pshader-examples\_assets\es_full_spec_2.0.pdf" > "D:\workspace\pshader-examples\_assets\es_full_spec_2.0.md"
```

## Notes from Raph

- Random number function doesn't exist
- map() function doesn't exist. show custom implementation  
- Noise function doesn't exist - how to handle?
- certain things are better on the CPU
  - Text
  - Shaders complement the CPU
- Enough understanding to know use cases
- List of built-in uniforms. Where's the definitive list? Look @ Processing4 source


## Other ideas

- It is recommended that you use the loadShader() function instead of calling new PShader(), but this does open the door to more advanced options like shader compiling. Here be dragons
  
Outside the scope of tutorial
- PShapeUtil in a library - https://processing.github.io/processing-library-template/


## Topics to cover in tutorial

- Overarching goal for creative coding, not just GLSL proficiency: ***what do shaders unlock***?
- Relate as much as we can back to beginner/intermediate Processing concepts
  - PVector / math functions
  - PImage
  - PShape
- Functions in Processing vs GLSL
  - Function analogies (Look at comparisons in `PROCESSING_FUNCTIONS.md`):
    - sin() ~ sin()
    - cos() ~ cos()
    - ???
    - constrain() ~ clamp()
    - lerp() ~ mix() 
    - PVector ~ vec2/vec3/vec4
    - PImage ~ sampler2D
    - PVector.dist() ~ distance()
    - PVector.mag() ~ length()
    - PVector.normalize() ~ normalize()
- Performance considerations
  - for loops shouldn't be used much
  - minimize conditionals
  - too many texture lookups are bad

