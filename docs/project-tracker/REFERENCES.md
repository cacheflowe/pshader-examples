# Reference Material Index

Quick reference to all source material, prior art, and external resources collected in this project.

---

## Prior Art & Foundational Documents

| Resource | Location | Notes |
|----------|----------|-------|
| 50 Shades of Shaders (2014) | `_assets/1405_FiftyShadesOfShaders_update/` | Raph/Moco/Max tutorial with commented examples |
| Processing for Android Ch.15 | `docs/other-articles/Processing-Android-Chapter-15-GLSL-shaders.md` (also [Google Drive PDF](https://drive.google.com/file/d/1nDBK9xJrGVSm3gbQPBfxRf17LvASlh-X/view)) | Andres Colubri's shader chapter — now local as markdown |
| PShader Tutorial WIP Google Doc | [Google Doc](https://docs.google.com/document/d/1w9dV08FGh3ZgyY85iKcwuHZk3oYmdGV_6Xg8XwvWYGo/edit) | Collaborative draft |
| Alex Miller's Processing Shader Notes | [Google Doc](https://docs.google.com/document/d/1TjO6dV0GUC4caGDnegNnzS2VBH-hDfN8hql-CFop1hk/edit) | Built-in uniforms documentation |
| Justin's Shader Intro | `docs/other-articles/SHADERS_INTRO.md` | General GLSL learning guide |
| Fifty Shades text | `docs/other-articles/SHADES_OF_SHADERS.md` | Converted to markdown |
| Lygia p5 examples | `_assets/lygia_p5_examples/` | Lygia shader library demos |

## Processing Source Code References

The Processing4 source is available **locally** at `D:\workspace\processing4\core\src\processing\`. The most relevant directories for this tutorial:

| File / Directory | Local Path | Notes |
|-----------------|-----------|-------|
| Default shaders | `opengl/shaders/` (also in `_assets/processing-default-shaders/`) | Ground truth for all built-in uniforms, attributes, and shader types |
| `PShader.java` | `opengl/PShader.java` (1477 lines) | Shader type constants (L58-83), built-in uniform setup (L128-170), `set()` methods |
| `PGraphicsOpenGL.java` | `opengl/PGraphicsOpenGL.java` (14583 lines) | How Processing sets uniforms, activates shaders, manages draw state |
| `PGL.java` | `opengl/PGL.java` (3430 lines) | OpenGL ES abstraction layer |
| `PGraphics3D.java` | `opengl/PGraphics3D.java` | 3D renderer |
| `PShapeOpenGL.java` | `opengl/PShapeOpenGL.java` | PShape + shader interaction |
| `PImage.java` | `core/PImage.java` | Image/texture handling |
| `PShape.java` | `core/PShape.java` | Base PShape class |

Also available via GitHub:
| What | URL |
|------|-----|
| Default shaders | https://github.com/processing/processing4/tree/main/core/src/processing/opengl/shaders |
| PShader.java (shader types) | https://github.com/processing/processing4/blob/main/core/src/processing/opengl/PShader.java#L58-L83 |
| PShader.java (built-in uniforms) | https://github.com/processing/processing4/blob/main/core/src/processing/opengl/PShader.java#L128-L170 |
| Processing built-in examples | https://github.com/processing/processing-examples/tree/main/Topics/Shaders |
| OpenGL ES 2.0 spec | `docs/language-resources/opengl_es_full_spec_2.0.md` |
| Processing functions reference | `docs/language-resources/PROCESSING_FUNCTIONS.md` |

## External Learning Resources

- [The Book of Shaders](https://thebookofshaders.com/)
- [The Pixel Swarm](https://thndl.com/the-pixel-swarm.html) - visual parallelism explanation
- [Fragment Foundry](https://hughsk.io/fragment-foundry/) - interactive tutorial
- [Intro to Shader Art Coding (YouTube)](https://www.youtube.com/watch?v=f4s1h2YETNY)
- [Shadertoy](https://www.shadertoy.com/)
- [IQ's SDF articles](https://iquilezles.org/articles/)
- [IQ's Domain Warping article](https://iquilezles.org/articles/warp/)
- [GLSL Noise Functions (gist)](https://gist.github.com/patriciogonzalezvivo/670c22f3966e662d2f83)
- [Steven Wittens: Making WebGL Dance](https://www.youtube.com/watch?v=GNO_CYUjMK8)

## Community Processing Shader Projects

- [codeanticode/pshader-experiments](https://github.com/codeanticode/pshader-experiments)
- [cansik/processing-postfx](https://github.com/cansik/processing-postfx)
- [genekogan/Processing-Shader-Examples](https://github.com/genekogan/Processing-Shader-Examples)
- [cacheflowe/haxademic shaders](https://github.com/cacheflowe/haxademic/tree/master/data/haxademic/shaders)
- [SableRaf/Filters4Processing](https://github.com/SableRaf/Filters4Processing) — Raph's Processing filter library
- [SableRaf/Shadertoy2Processing](https://github.com/SableRaf/Shadertoy2Processing) — port Shadertoy shaders to Processing
- [prontopablo/FIP](https://github.com/prontopablo/FIP) / [docs](https://prontopablo.github.io/FIP/) — shader helper library

## Image Assets

| Image | Source |
|-------|--------|
| cool-cat.png/jpg | https://www.freepik.com/free-photo/beautiful-cat-portrait-close-up_19866347.htm |
| moon-nasa.jpg | https://svs.gsfc.nasa.gov/4720 |
| graphics-pipeline-andres.png | From Andres' Processing for Android book |

## Public Domain Image Archives (for replacing cool-cat)

- https://pdimagearchive.org/ — general public domain image archive
- Chuck doge photo — from Justin (needs to be confirmed/sourced)
