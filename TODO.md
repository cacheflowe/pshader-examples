# Shaders in Processing

This document continues the work from this Google Doc:

https://docs.google.com/document/d/1w9dV08FGh3ZgyY85iKcwuHZk3oYmdGV_6Xg8XwvWYGo/edit?pli=1&tab=t.0

## Shaders in the processing4 repo

- https://github.com/processing/processing4/tree/main/core/src/processing/opengl/shaders

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

- Overarching goal for creative coding, not just GLSL proficiency: ***what do shaders unlock***?
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


