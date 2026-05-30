#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

// The primary texture, automatically bound by Processing
uniform sampler2D texture;

// A second texture, set manually via myShader.set("uTexture2", img2)
uniform sampler2D uTexture2;

// Controls the blend between the two textures (0.0 = texture 1, 1.0 = texture 2)
uniform float uMix;

// UV coordinates from the vertex shader
varying vec4 vertTexCoord;

void main() {
  // Sample both textures at the same UV coordinate
  vec4 color1 = texture2D(texture, vertTexCoord.st);
  vec4 color2 = texture2D(uTexture2, vertTexCoord.st);

  // Blend between the two textures based on the mix value
  gl_FragColor = mix(color1, color2, uMix);
}
