# PShader Tutorial — Claude Code Context

This repo is an in-progress **Processing.org tutorial on PShader (GLSL shaders in Processing)**, written by Justin (cacheflowe).

## Key files

| File / Dir | Purpose |
|-----------|---------|
| `README_SRC.md` | Tutorial source — edit this, not `README.md` |
| `README.md` | Generated output — rebuild with `npm run build:readme` |
| `examples/01_solid_color/` … `20_vertex_displacement/` | Numbered example sketches; code is imported into the tutorial via `<!-- @import -->` directives |
| `docs/project-tracker/STATUS.md` | Overall progress and section completion |
| `docs/project-tracker/TODO.md` | Phased todo list (Phases 1–8) |
| `docs/project-tracker/WRITING_STYLE.md` | Justin's voice and style — consult before writing any tutorial prose |
| `docs/project-tracker/REFERENCES.md` | All source material and external links |
| `_assets/processing-default-shaders/` | Actual source of Processing's built-in shaders — ground truth for built-in uniforms |
| `docs/other-articles/Processing-Android-Chapter-15-GLSL-shaders.md` | Andres Colubri's shader chapter — reference for shader types and pipeline |

## Processing4 source (local)

`D:\workspace\processing4\core\src\processing\` — use this for factual verification:
- `opengl/PShader.java` — shader type constants, built-in uniform binding, `set()` overloads
- `opengl/PGraphicsOpenGL.java` — how Processing activates shaders and manages draw state
- `opengl/shaders/` — default GLSL source files

## Build

After every edit to `README_SRC.md`, run:
```
npm run build:readme
```
Verify all imports resolve with ✓.

## Writing new tutorial content

1. Read `docs/project-tracker/WRITING_STYLE.md` first
2. Check `docs/project-tracker/TODO.md` for what's next
3. Write in `README_SRC.md`, run the build, verify output
4. Update `docs/project-tracker/STATUS.md` and check off items in `TODO.md`

Key style rules (full guide in WRITING_STYLE.md):
- Show code first, explain after
- Relate GLSL concepts back to Processing equivalents
- Bold for new terminology, italics for emphasis
- No "we", no "simply", no exclamation marks
- Sections end with a forward-looking sentence, not a summary

## AI skills (`.claude/commands/`)

Invoke these slash commands for focused shader assistance:
- `/pshader-fragment` — fragment shader templates, built-ins, patterns
- `/pshader-vertex` — vertex shader templates, built-ins, displacement patterns
- `/pshader-types` — shader type selection, `#define` markers, per-type variable list
- `/pshader-debug` — systematic debugging checklist
