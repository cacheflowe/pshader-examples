# Writing Style Guide — Justin's Voice

Reference this when generating new tutorial text to match the existing article's tone, structure, and conventions.

---

## Tone & Voice

- **Approachable expert**: Knowledgeable but never condescending. Assumes the reader is smart but new to shaders specifically.
- **Conversational but precise**: Uses natural phrasing ("This is where the power of shaders becomes apparent") without being overly casual. No slang, no jokes, but occasional warm encouragement ("Try loading multiple shaders and applying them in sequence").
- **Teaching by building**: Each section layers on the previous one. New concepts are introduced through working code, then explained after. Show first, explain second.
- **Processing-centric framing**: GLSL concepts are always related back to Processing equivalents. "This is similar to Processing's `get()` function", "`clamp()` is like Processing's `constrain()`".

## Sentence Structure

- Favors **medium-length sentences** with clear subject-verb structure. Not overly short/punchy, not academic.
- Uses **em dashes sparingly** via hyphens: "Writing GLSL is a different experience - and has different goals - than writing Java"
- **Semicolons** used occasionally for closely-related clauses: "every time `filter()` is called, the output color is the same. However, shaders can be dynamic and interactive."
- **Italics for emphasis** on key conceptual phrases: "*sets the output color of the pixel*", "*every single pixel at the same time*", "*interpolation*"
- **Bold for introducing terminology**: "**fragment shader**", "**uniform**", "**rasterization**", "**swizzling**"

## Paragraph & Section Patterns

- **Section intros** bridge from the previous topic: "With the coordinate system established, the next step is to use a texture." / "So far, all examples have used the default vertex shader provided by Processing."
- **After code blocks**, explanation follows as bullet points starting with `*`. Each bullet explains one specific aspect of the code.
- **Bullet points are full sentences** (or multiple sentences), not sentence fragments. They begin with a code reference or concept name.
- **Transitions between examples** are brief and direct: "In the next example, the y coordinate is used to set the green color component..."
- **Sections end** with a forward-looking sentence or practical suggestion, not a summary.

## Code Presentation

- **File labels** in bold: **sketch.pde**, **shader.glsl**, **vert.glsl**, **frag.glsl**
- Processing code labeled as `java`, shader code as `glsl`
- The **Processing-side label** uses `**Processing Code:**` or `**sketch.pde**`
- The **shader-side label** uses `**Shader Code (`filename.glsl`):**` or `**shader.glsl**`
- Code comments use `//` style, are in sentence case, and explain *what the line does* rather than restating the code
- When showing multiple related shaders, the article labels them: `**Shader Code (`brightness.glsl`):**`

## Terminology Conventions

- "fragment shader" and "pixel shader" used interchangeably, with preference for "fragment shader" after the initial introduction
- "canvas" not "screen" when referring to the Processing drawing surface
- "sketch" for the Processing program
- "normalize" / "normalized" for 0-1 coordinate ranges
- "texture sampling" or "texture lookup" for `texture2D()` calls
- "the shader program" or "the GLSL program" (not "the shader code")
- Use "UV coordinates" consistently (capitalized)
- First mention of a Processing function includes a doc link: [`loadShader()`](https://processing.org/reference/loadShader_.html)

## Explanation Style

- **Concrete numbers**: "For a sketch of 640 x 480 pixels, there are a total of 307,200 pixels drawn to the screen"
- **Analogies to Processing**: Always relate GLSL concepts to familiar Processing equivalents before diving deeper
- **Acknowledge difficulty**: "This concept can be confusing, but it reveals the power and behavior of a GLSL program"
- **Practical warnings**: "Passing an `int` value into a `vec4` may cause the program to crash" / "Unexpected results may occur if `shader()` is called without resetting it"
- **Not overly detailed on first pass**: Introduces concepts lightly, then revisits them in more depth later. "This is not critical for now, but becomes important when working with vertex shaders."

## Formatting Conventions

- `>` blockquotes for important asides or version-specific notes
- `<!-- -->` HTML comments for editorial notes and 🚨 markers (not visible in rendered output)
- Image alt text is descriptive: "A cat photo with darkened edges creating a vignette effect"
- Image captions in italics when present: `_Normalized coordinate system diagram_`
- Tables used for comparison (Processing ↔ GLSL functions, uniform types)
- Links on first mention of external concepts: [UV coordinate](https://en.wikipedia.org/wiki/UV_mapping), [swizzling](https://www.khronos.org/opengl/wiki/Data_Type_(GLSL)#Swizzling)

## What NOT to Do

- Don't use "we" ("we can see that...") — use direct address or passive
- Don't use "simply" or "just" when describing something that may be non-trivial
- Don't over-explain obvious code — trust the reader to read the code alongside the prose
- Don't front-load theory — always lead with a working example, then explain
- Don't use exclamation marks
