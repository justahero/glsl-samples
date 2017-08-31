// Author: Inigo Quiles
// Title: Expo

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  // bottom left
  float width = 0.02;
  vec2 bl = smoothstep(vec2(width), st, vec2(0.5));
  float pct = bl.x * bl.y;

  // top right
  vec2 tr = smoothstep(vec2(width), 1.0 - st, vec2(0.5));
  pct *= tr.x * tr.y;

  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
