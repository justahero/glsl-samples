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
  vec2 bl = step(vec2(0.1), st);
  float pct = bl.x * bl.y;

  // top right
  vec2 tr = step(vec2(0.1), 1.0 - st);
  pct *= tr.x * tr.y;

  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
