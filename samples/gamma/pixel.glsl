#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;
  st.x *= u_resolution.x / u_resolution.y;
  // st = st * 2.0 - 1.0;

  vec3 color = vec3(0.15, 0.28, 0.65) * (1.0 - st.x);
  float gamma = 1.0 + 0.4 * ceil(12.0 * st.y);

  //  color = pow(color, vec3(1.0 / gamma));


  // float gamma = 1.1;
  color = pow(clamp(color, 0.0, 1.0), vec3(1.0 / gamma));

  gl_FragColor = vec4(clamp(color, 0.0, 1.0), 1.0);
}
