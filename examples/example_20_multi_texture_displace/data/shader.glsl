#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// Built-in texture from filter() — contains the rendered canvas
uniform sampler2D texture;

// Displacement map passed via set()
uniform sampler2D uDisplaceMap;

// Controls displacement intensity (0.0 = no displacement, 1.0 = full)
uniform float uDisplaceAmt;

// UV coordinates from the vertex shader
varying vec4 vertTexCoord;

void main() {
  vec2 st = vertTexCoord.st;

  // Flip Y for the displacement map (set() textures are right-side-up,
  // but vertTexCoord is Y-flipped by texMatrix for the built-in texture)
  vec2 stFlipped = vec2(st.s, 1.0 - st.t);

  // Sample the displacement map to get offset values
  vec2 displace = texture2D(uDisplaceMap, st).rg;

  // Shift UV coordinates based on displacement brightness
  // Subtracting 0.5 centers the displacement around zero (push and pull)
  vec2 uv = st + (displace - 0.5) * uDisplaceAmt * 0.4;

  // Sample the canvas texture at the displaced coordinates
  gl_FragColor = texture2D(texture, uv);
}
