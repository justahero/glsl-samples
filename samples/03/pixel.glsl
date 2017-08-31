// Author: Inigo Quiles
// Title: Expo

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float drawSmoothRect(vec2 st, float width, float radius) {
  vec2 bl = smoothstep(vec2(width), st, vec2(radius));
  vec2 tr = smoothstep(vec2(width), 1.0 - st, vec2(radius));
  return bl.x * bl.y * tr.x * tr.y;
}

float drawRect(vec2 st, float width) {
  vec2 bl = step(width, st);
  vec2 tr = step(width, 1.0 - st);
  return bl.x * bl.y * tr.x * tr.y;
}

float test(vec2 st, vec2 left, float width) {
  float bl = step(0.3, st.x - 0.3) + step(0.4, 1.0 - st.x - 0.4) + step(width, 1.0 - st.y);
  return bl;
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  // float pct = drawRect(st, 0.01);

  float pct = test(1.0 - st, vec2(0.3, 0.4), 0.05);
  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
