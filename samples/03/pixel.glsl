// Author: Inigo Quiles
// Title: Expo

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float checkerBoard(vec2 st, int columns, int rows) {
  float x = step(0.5, fract(st.x * float(columns)));
  float y = step(0.5, fract(st.y * float(rows)));
  return mod(x + y, 2.0);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float pct = checkerBoard(st, 4, 4);
  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
