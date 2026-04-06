# Feedback

## Raph notes:

Feedback:

* Very nicely detailed and complete.  
* I like how the examples are practical and immediately applicable.  
* The assumed audience seems to be intermediate to advanced. This is not an issue per se, but could be made clearer at the top, and maybe give pointers to beginners on what to learn/practice first before coming back to this tutorial.  
* Adding examples of what shaders can do in the introduction would help give the reader context and motivation to continue  
* The [explanation of parallelism](https://github.com/cacheflowe/pshader-examples?tab=readme-ov-file#parallel-computing) could be made more visual. See thndl’s [The Pixel Swarm](https://thndl.com/the-pixel-swarm.html). Maybe use doodles like The Book of Shaders [chapter 1](https://thebookofshaders.com/01/). The wikipedia article is a little too complex (maybe there’s a more accessible reference?).  
* Same for the [coordinate system](https://github.com/cacheflowe/pshader-examples?tab=readme-ov-file#a-new-coordinate-system) which could benefit from diagrams. It could be made clearer how a normalized coordinate system works and that it is independent of the aspect ratio and dimensions of the sketch.  
* The [section on uniforms](https://github.com/cacheflowe/pshader-examples?tab=readme-ov-file#uniforms-for-animation-and-interactivity) should probably explain Processing’s [built-in uniforms](https://github.com/processing/processing4/blob/df585defc6e7633aba99ca86400e4d9c2edaaa36/core/src/processing/opengl/PShader.java#L128C3-L170C30): `transform`, `modelview`, `projection`, etc. (see [source code](https://github.com/processing/processing4/blob/df585defc6e7633aba99ca86400e4d9c2edaaa36/core/src/processing/opengl/PShader.java#L1145))  
* What about Processing’s built-in [shader types](https://github.com/processing/processing4/blob/df585defc6e7633aba99ca86400e4d9c2edaaa36/core/src/processing/opengl/PShader.java#L58-L83)? Point, line, texture, light, quad, etc. This is explained in detail in the Processing for Android book.  
* Difference between vanilla glsl and PShader. Could maybe explain how using shaders in Processing differs from using raw glsl and OpenGL (for ppl who want to move to other environments)?  
* The Processing for Android book has this helpful diagram  
  * ![](./images/graphics-pipeline-andres.png)

Prior work:

* [PShader tutorial(s) 2025 (WIP)](https://docs.google.com/document/d/1w9dV08FGh3ZgyY85iKcwuHZk3oYmdGV_6Xg8XwvWYGo/edit?tab=t.0)  
* [Processing-Android-Chapter-15-GLSL-shaders.pdf](https://drive.google.com/file/d/1nDBK9xJrGVSm3gbQPBfxRf17LvASlh-X/view)  
* [140607 Shader Tutorial 2014](https://docs.google.com/document/d/1Ctp7HwMX65QuyEy8UZ8DLnVAiKDVVjq3NQbPcEJ2jDc)

References:

* [[JSConfUS 2013] Steven Wittens: Making WebGL Dance](https://www.youtube.com/watch?v=GNO_CYUjMK8)  
* [Making WebGL Dance —](https://acko.net/tv/webglmath/) [Acko.net](http://Acko.net)  
* [https://acko.net/files/fullfrontal/fullfrontal/webglmath/online.html](https://acko.net/files/fullfrontal/fullfrontal/webglmath/online.html)


## Chris notes:

* In the “New Coordinate system” chapter, I think you might be packing too many ideas into the bullet points between the first x - gradient and the second xy gradient. What ideas can be shared elsewhere in other ways? This especially applies to the UV discussion, which needs a whole diagram and explainer later on perhaps, separate from the immediate discussion? I doubt many ppl know that graphics are applied to a pair of triangles to show them on your screen. I think you could actually add it on to the end of the same chapter? Also it is the reason for the different coordinate system in many ways. Eg:  
  * ~~Requesting a `vec2` from a `vec4` by calling `vertTexCoord.xy` is called [swizzling](https://www.khronos.org/opengl/wiki/Data_Type_(GLSL)#Swizzling). Vector components can be requested in different orders using different property names. Since a `vec3` might be used as either an RGB color or an XYZ coordinate in a shader program, GLSL can use `.rgba` and `.xyzw` interchangeably. **(somewhere later? - actually you have a swizzling chapter, wait till then to explain this?)**  ~~
  * ~~`vertTexCoord` is defined as a `varying` variable, which means that its value was passed to the fragment shader from the vertex shader. This is not critical for now, but becomes important when working with vertex shaders. There is always a vertex shader that runs before the fragment shader. Processing provides a [default vertex shader](https://github.com/processing/processing4/tree/main/core/src/processing/opengl/shaders) if one is not provided. **(somewhere later?)** ~~
  * In shader programming, a pixel’s location (relative to the triangle that it's drawn onto) is called its UV coordinate, which has roots in 3D modeling. Even in seemingly 2-dimensional shader programs, the graphics library shades a polygon mesh behind the scenes, even if it is just two triangles that make a rectangle.   
  * UV coordinates map textures onto polygons in Processing, which explains the name vertTexCoord. The u and v are simply different names for the x and y coordinates of a texture. In Processing, this is similar to how the texture() function works with the vertex() function.  
* In the animation chapter, I can see the next step being adding a sin() to move back and forth, and I would immediately wonder if I should do such calculations in Processing vs in the shader - is it worth speaking about that here - what is better done in a shader and what is better done outside?  
* For the Using Textures chapter - can we make it clearer what filter() is sending/doing? Also the order of operations? Is it safe to say that the full color of the cat was briefly drawn to the screen, only to have the greyscale version drawn overtop by the result of the filter command? If we had drawn many things before filter, would they have all passed into the shader? How is filter() different from myShader.set()? Basically, how can we flesh this out a bit more?  
* In the swizzling chapter, before this sentence “A new `vec3` is created using the red channel, and then passed…” you should let the reader know something like “The following line of code does the same thing, but in a more concise way..” or another way to set the stage for what you are trying to show. I see you do it at the end, but it left me w/o context till I got to the end.