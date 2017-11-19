#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec3 color = vec3(0.0);
  color += step(0.5, (0.15 + 0.7 * st.x + st.y) * 0.5);

  gl_FragColor = vec4(color, 1.0);
}
