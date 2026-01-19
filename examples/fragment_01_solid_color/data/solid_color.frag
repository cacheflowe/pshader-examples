// The ifdef section in the fragment shader is required to make the shader 
// compatible with OpenGL ES and WebGL. It sets the precision of the float 
// and integer numbers to medium, which should be fine for most devices. 
// These precision statements are optional on desktop computers.
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif


// The code in main() will be executed for every fragment (pixel)
void main(void)
{
  // The output of the fragment shader is a color
	// It is written as a 4 parameters vector in the
	// form vec4( red, green, blue, alpha ) where values
	// go from 0.0 to 1.0 instead of 0 to 255 like your
	// usual Processing color object. 

	// This is red
	// gl_FragColor = vec4 (1.0,0.0,0.0,1.0);

	// This is green
	gl_FragColor = vec4 (0.0,1.0,0.0,1.0);

	// This is a shade of cyan
	// gl_FragColor = vec4 (0.3,1.0,0.9,1.0);
	
}