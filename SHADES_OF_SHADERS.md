# Fifty Shades of Shaders

From: https://docs.google.com/document/d/1Ctp7HwMX65QuyEy8UZ8DLnVAiKDVVjq3NQbPcEJ2jDc/edit?tab=t.0

**Credit**  
Raffael “Moco” Shiller  
Maximilian Mittermeier  
Raphaël de Courville  

## *A Shader primer for creative coders*

Shaders are a powerful instrument in a creative coder’s toolbox but they often pass as some kind of impenetrable black magic. This is not so much because shader programming is inherently complex but because, mostly for historical reasons, they have long been the territory of expert OpenGL programmers. In consequence, the available learning material is often confusing for the beginner programmer. The basics, however, are really quite simple to grasp provided you know where to start.

This tutorial aimed at Processing coders (intermediate or advanced) with no previous knowledge of shader programming or OpenGL. However, the shader language you will learn is not specific to Processing. You will be able to use your newfound shader skills in any OpenGL/WebGL project. 

This tutorial will focus on hands-on tinkering with simple shaders, so we’ll try to keep the theory to a minimum and only introduce the important notions as we go. It is therefore not intended to replace a proper introduction to interactive 3D computer graphics in OpenGL (actually, you won’t need to write a single line of OpenGL code), nor will it offer an exhaustive view of what can be done with shaders. 

What you will get is the foundation knowledge to start tinkering with shader code and understand the more advanced tutorials and books you might read later. We included a references section packed with great resources to help you go further.

A good program to edit shader files is SublimeText. It runs on Mac, Windows and Linux and offers a free unlimited trial. You can get it from [http://www.sublimetext.com/](http://www.sublimetext.com/).

## **All the theory you need… for now**

   
A shader is a small program that runs on your graphic card (or GPU) and tells your computer what to do with 3D geometry and the pixels on your screen. 

There are several shader languages. This tutorial focuses on the OpenGL Shader Language: GLSL... 

Yep, that’s all. If you feel like you need more, I recommend watching this beautiful presentation by Steven Wittens: [http://youtu.be/GNO\_CYUjMK8](http://youtu.be/GNO_CYUjMK8) 

## **Shaders in Processing**

Processing supports shaders since version 2.0 thanks to the work from Andres Colubri ([https://twitter.com/codeanticode](https://twitter.com/codeanticode)).

![][image1]  
Let’s look at one of the default examples included in Processing. Launch the Processing IDE then go to **File \> Examples** then **Topics \> Shaders** and open the **Landscape** example.

1\) We declare a PShader object: 

| PShader shader; |
| :---- |

## 2\) In setup(), We load the “landscape.glsl” file:

## shader \= loadShader("landscape.glsl");

## *Note: You will find shader files with extensions like .glsl, .frag or .vert or no extension at all. It doesn’t matter to Processing so you can choose whatever is most convenient.*

3\) Passing variables to the shader is done using the set() function of the PShader object. For example, in draw(), we are passing the elapsed time in seconds:

shader.set("time", (float)(millis()/1000.0));

*Note: This only works if the shader code actually contains a variable called* "time"*. We will see how that works very soon.*

4\) This is where we actually call the shader:

shader(shader); 

Everything that you draw on the screen from there on will pass through the shader.

5\) In this case, we just want to fill the window with the image from the shader so we merely draw a rectangle that matches the dimensions of the sketch: 

rect(0, 0, width, height);

## **Pixel shaders (aka Fragment shaders)**

A computer screen displays shapes and colors through a grid of pixels. What it means is that, to be rendered on the screen, any shape must first be divided in “fragments” via a process is called **rasterization**. Fragment and pixel are not exactly the same thing but, for now at least, we will use the words “fragment” and “pixel” interchangeably.

![][image2]

#### ***fragment\_01\_solid\_color***

A pixel shader is a small set of instructions that is run once for every pixel within the target geometry (here, the rectangle that fills your sketch window). The job of the pixel shader is simple: set the value of the corresponding pixel.

![][image3]

gl\_FragColor \= vec4 ( 0.0, 1.0, 0.0, 1.0 );

gl\_FragColor is the OpenGL variable that tells the corresponding pixel of the window what color to display. The type of gl\_FragColor is vec4 which is basically an array of four float values in the range \[0.0, 1.0\]. These values will be interpreted as the red, green, blue and alpha values of the pixel.

All fragments have the same simple set of instructions and work in parallel. This is what makes shaders so much faster than pixel-by-pixel calculations.

Now I hear you thinking: “Pixel shaders set the color of the each pixel and they executes the same set of instructions for every pixel? Okay, it’s fast, but it’s kinda boring. What if I want to do more than filling the window with a single color? Why do you even need to execute the same exact program several time?”

Well, while it IS the same program, it IS NOT the same fragment... 

Confusing? Read on.

#### ***fragment\_02\_linear\_gradient*** 

Fragments are in fact not all identical. The main difference between them is that each fragment is “aware” of its x and y position. It may not seem like much but it’s actually one of the most powerful feature of pixel shaders.

Let’s see what happens when we make color depend on position on the x-axis.  
![][image4]  
gl\_FragColor \= vec4 ( pos.x, 0.0, 0.0, 1.0 );

The gradient you see is not defined anywhere in the program. It *emerges* from this one simple rule, applied at the position of each pixel in the window.

As a helpful metaphor, you can imagine that carbon copies of your shader program are sent as instructions to a crowd of little pixels people that can change color at will.

### **Fun with functions**

*Topics: Center coordinates, Functions (length, step, smoothstep)*

#### ***fragment\_03\_radial\_gradient*** 

![][image5]

#### ***fragment\_04\_circle***

### **Interacting with shaders**

*Topics: Updating uniforms, math functions (sin)*

#### ***fragment\_05\_mouse\_uniform***

#### ***fragment\_06\_time\_uniform***

## **References**

### **Tutorials and introductions**

#### ***Beginner***

Steven Wittens excellent introduction to 3D computer graphics (a good starting point)  
[http://youtu.be/GNO\_CYUjMK8](http://youtu.be/GNO_CYUjMK8)  
The slides for the presentation are available as well: [http://acko.net/files/fullfrontal/fullfrontal/webglmath/online.html](http://acko.net/files/fullfrontal/fullfrontal/webglmath/online.html)

Shader programming in Three.js (good way to review the basics)  
[http://aerotwist.com/tutorials/an-introduction-to-shaders-part-1/](http://aerotwist.com/tutorials/an-introduction-to-shaders-part-1/)  
[http://aerotwist.com/tutorials/an-introduction-to-shaders-part-2/](http://aerotwist.com/tutorials/an-introduction-to-shaders-part-2/)

#### ***Intermediate***

Updated reference (May 2014\) for the PShader API  
[http://codeanticode.wordpress.com/2014/05/08/shader\_api\_in\_processing\_2/](http://codeanticode.wordpress.com/2014/05/08/shader_api_in_processing_2/)

The official Processing PShader tutorial. It assumes previous knowledge of GLSL.  
[http://processing.org/tutorials/pshader/](http://processing.org/tutorials/pshader/)

Udacity’s free “Interactive 3D Graphics” video course  
[https://www.udacity.com/course/cs291](https://www.udacity.com/course/cs291)

An introduction to shader programming with a nice collection of interactive examples.  
[http://pixelshaders.com/](http://pixelshaders.com/)

The wikipedia page about shaders is a good reference when you already have a grasp of the basics of the OpenGL pipeline and shader programming.  
[https://en.wikipedia.org/wiki/Shaders](https://en.wikipedia.org/wiki/Shaders)

#### ***Advanced***

A comprehensive GLSL tutorial (assumes previous knowledge of OpenGL)  
[http://www.lighthouse3d.com/tutorials/glsl-core-tutorial/glsl-core-tutorial-index/](http://www.lighthouse3d.com/tutorials/glsl-core-tutorial/glsl-core-tutorial-index/)

OpenGL ES 2.0 reference card [http://www.khronos.org/opengles/sdk/docs/reference\_cards/OpenGL-ES-2\_0-Reference-card.pdf](http://www.khronos.org/opengles/sdk/docs/reference_cards/OpenGL-ES-2_0-Reference-card.pdf)

Learning Modern 3D Graphics Programming (in depth CG tutorials)  
[http://www.arcsynthesis.org/gltut/](http://www.arcsynthesis.org/gltut/)

A full shader course aimed at Javascript programmers (you need to know some basic git and node.js to access the lessons):  
[https://github.com/stackgl/shader-school](https://github.com/stackgl/shader-school)

### **Online shader editors**

Shadertoy: [https://www.shadertoy.com/](https://www.shadertoy.com/)  
GLSL sandbox: [http://glsl.heroku.com/](http://glsl.heroku.com/)  
WebGL playground: [http://webglplayground.net/gallery](http://webglplayground.net/gallery)

### **Acknowledgements**

The authors of this tutorial wish to thank 

* Andres Colubri for bringing shader support to Processing  
* Andrew Baldwin for [his great GLSL tutorials](http://thndl.com/)  
* Iñigo Quilez for creating [shadertoy.com](https://www.shadertoy.com)


