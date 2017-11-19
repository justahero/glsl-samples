#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

float stroke(float x, float s, float w) {
  float d = step(s, x + w * 0.5) - step(s, x - w * 0.5);
  return clamp(d, 0.0, 1.0);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec3 color = vec3(0.0);
  color += stroke(st.x, 0.5, 0.15);

  gl_FragColor = vec4(color, 1.0);
}
