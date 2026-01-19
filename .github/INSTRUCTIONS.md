# PShader Tutorial WIP Instructions

This is a set of instructions for creating a tutorial on using PShader in Processing. The goal is to cover the basics of shaders, how they work in Processing, and a general introduction to both fragment and vertex shaders for beginners who want to learn how to use shaders effectively in Processing. Unlike most shader tutorials, this tutorial is attempting to provide a ground-up introduction to shaders specifically within the Processing environment, rather than assuming prior knowledge of GLSL or graphics programming. Since Processing is often used by artists and designers with varying levels of programming experience, the tutorial aims to be accessible and practical. It also intends to compare shader-based techniques with traditional CPU-based drawing methods in Processing to highlight the advantages and use cases for shaders, and also the technical differences between the languages and environments.

## Resources

This document continues the work from this [Google Doc](https://docs.google.com/document/d/1w9dV08FGh3ZgyY85iKcwuHZk3oYmdGV_6Xg8XwvWYGo/edit?pli=1&tab=t.0), now converted to [GOOGLE_DOC.md](../docs/GOOGLE_DOC.md)

OpenGL reference for GLES 2.0 interface is here: 
- https://registry.khronos.org/OpenGL/specs/
- https://registry.khronos.org/OpenGL/specs/es/2.0/es_full_spec_2.0.pdf

Source code for the examples in this tutorial are in the [/examples/](../examples/) folder.

Running notes, braindumps, and other article ideas are in the [../docs](/docs/) folder:

- [DOCS_STYLE_GUIDE.md](../docs/DOCS_STYLE_GUIDE.md) - style guide for technical documentation, from Processing Foundation
- [GOOGLE_DOC.md](../docs/GOOGLE_DOC.md) - converted from the original Google Doc outline
- [SHADERS_INTRO.md](../docs/SHADERS_INTRO.md) - Cacheflowe's thoughts on getting started with shaders, and lots of links to other resources
- [SHADES_OF_SHADERS.md](../docs/SHADES_OF_SHADERS.md) - Raph's "Fifty Shades of Shaders" tutorial
- [PROCESSING_FUNCTIONS.md](../docs/PROCESSING_FUNCTIONS.md) - links to official documentation for Processing functions 
- [opengl_es_full_spec_2.0.md](../docs/opengl_es_full_spec_2.0.md) - converted from the official OpenGL ES 2.0 specification PDF 

Robust code examples are in the [/_assets/](../_assets/) folder:

- [1405_FiftyShadesOfShaders_update](../_assets/1405_FiftyShadesOfShaders_update) - from Raph & co
- [processing-examples-Shaders](../_assets/processing-examples-Shaders) - from the official Processing examples repo
- [Processing default shaders](../_assets/processing-default-shaders) - from the official Processing github repo source code
- [haxademic-shaders-@cacheflowe](../_assets/haxademic-shaders-@cacheflowe) - from the Haxademic library
- [pshader-experiments-master-@codeanticode](../_assets/pshader-experiments-master-@codeanticode)
- [processing-postfx-master-@cansik](../_assets/processing-postfx-master-@cansik)
- [Processing-Shader-Examples-master-@genekogan](../_assets/Processing-Shader-Examples-master-@genekogan)

Processing reference pages of interest:

* [PShader](https://processing.org/reference/PShader.html)  
* [loadShader()](https://processing.org/reference/loadShader_.html)   
* [filter()](https://processing.org/reference/filter_.html)
* [shader()](https://processing.org/reference/shader_.html)
* [PShader.set()](https://processing.org/reference/PShader_set_.html)

Processing source code files of interest:

* [core/src/processing/opengl/](https://github.com/processing/processing4/tree/main/core/src/processing/opengl)
* [core/src/processing/opengl/shaders/](https://github.com/processing/processing4/tree/main/core/src/processing/opengl/shaders)
* [PGL.java](https://github.com/processing/processing4/blob/main/core/src/processing/opengl/PGL.java)
* [PShader.java](https://github.com/processing/processing4/blob/main/core/src/processing/opengl/PShader.java)
* [PGraphicsOpenGL.java](https://github.com/processing/processing4/blob/main/core/src/processing/opengl/PGraphicsOpenGL.java)

## Current Status

- We are writing the actual WIP tutorial in README.md
- The current outline of topics to cover is in OUTLINE_WIP.md, and this should be updated as the tutorial progresses.
- Refer to the TODO.md and GOOGLE_DOC.md files for notes and ideas of topics to cover. Some of this has already been incorporated into the tutorial, and some is still pending and needs to be thought through.
- There's a style guide for technical documentation that should be followed: DOCS_STYLE_GUIDE.md
- We are writing small example processing files in /sketches to accompany the tutorial, and the code will be placed inline in the tutorial

## Instructions for Writing the Tutorial

1. Use the style guide in DOCS_STYLE_GUIDE.md and the existing content in README.md as a reference for writing style, technical education, and formatting. Maintain a consistent voice throughout the tutorial, and reference the existing sections for writing voice and style.
2. Follow the outline in OUTLINE_WIP.md closely, ensuring that each topic is covered in a logical order. If you feel that the order should be changed for better flow, please discuss it first.
3. Write clear, concise explanations for each topic, avoiding jargon where possible. When technical terms are necessary, provide definitions or explanations.
4. Include code examples for each concept discussed. Ensure that the code is well-commented and easy to understand. Test all code examples in Processing to ensure they work as intended.
5. Use diagrams or illustrations where helpful to explain concepts visually. These can be created separately and referenced in the tutorial.
6. Review the tutorial for accuracy, clarity, and completeness. Ensure that all topics in the outline are adequately covered.
7. Once a section is completed, update the OUTLINE_WIP.md to reflect progress and any changes made to the structure or content.

## GLSL code examples

1. When writing GLSL code examples, ensure that they are formatted correctly for inclusion in markdown files. Use triple backticks with `glsl` specified for syntax highlighting.
2. Uniforms should be prefixed with `u` (e.g., `uTime`, `uResolution`) to distinguish them from varying variables and attributes.
3. Provide comments within the GLSL code to explain key parts of the shader logic. This is for educational purposes for beginners, so be clear and thorough in explanations.
4. Try to keep GLSL examples as simple as possible while still effectively demonstrating the concept being taught. Avoid overly complex shaders that may confuse beginners.
5. Try to relate GLSL functions and concepts back to their Processing equivalents where possible, as outlined in the TODO.md file. This will help readers make connections between the two environments.