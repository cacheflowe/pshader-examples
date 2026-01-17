
### **Basic shader examples**

Basic vert.glsl file:

uniform mat4 transformMatrix;
attribute vec4 position;
attribute vec4 color;
varying vec4 vertColor;

void main() {
  gl_Position = transformMatrix * position;
  vertColor = color;
}

Basic frag.glsl file:

varying vec4 vertColor;

void main() {
  gl_FragColor = vertColor;
}

Loading the files above in a sketch:

PShader shader;

void setup() {
  size(640, 360, P2D);
  shader = loadShader("frag.glsl", "vert.glsl");
}

void draw() {
  shader(shader);
  // ... do drawing ...
}

### **Vertex shader uniforms**

uniform mat4 modelviewMatrix;
uniform mat4 transformMatrix;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;
uniform int lightCount;
uniform vec4 lightPosition[8];
uniform vec3 lightNormal[8];
uniform vec3 lightAmbient[8];
uniform vec3 lightDiffuse[8];
uniform vec3 lightSpecular[8];  
uniform vec3 lightFalloff[8];
uniform vec2 lightSpot[8];

### **Vertex shader attributes**

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;
attribute vec4 ambient;
attribute vec4 specular;
attribute vec4 emissive;
attribute float shininess;

### **Fragment shader uniforms**

uniform sampler2D texture;
uniform vec2 texOffset;

### **Fragment shader built-in variables**

vec4 gl_FragColor
vec4 gl_FragCoord — screen space coordinates