// Author: Inigo Quiles
// Title: Expo

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float rectangle(vec2 st, float width, float radius) {
  vec2 bl = smoothstep(vec2(width), st, vec2(radius));
  vec2 tr = smoothstep(vec2(width), 1.0 - st, vec2(radius));
  return bl.x * bl.y * tr.x * tr.y;
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float pct = rectangle(st, 0.02, 0.5);
  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
