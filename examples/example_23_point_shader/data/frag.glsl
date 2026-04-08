varying vec4 vertColor;

void main() {
  gl_FragColor = vertColor;

  // try making points circular instead of square by discarding corners
  // offset is in the range -1 to 1 within each point quad
  // gl_FragColor = length(/* offset varying */) > 1.0 ? vec4(0.0) : vertColor;
}
