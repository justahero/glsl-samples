#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float circle(vec2 size, vec2 pos, float radius, float smooth) {
  float pct = smoothstep(radius, length(pos - size), radius + smooth * sin(u_time * 2.5));
  return pct;
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float pct = 0.0;
  pct  = circle(st, vec2(0.75 + 0.1 * sin(u_time), 0.75 + 0.1 * sin(u_time * 2.0)), 0.5, 0.025);
  pct += circle(st, vec2(0.25 + 0.1 * cos(u_time), 0.25 + 0.1 * sin(u_time * 2.0)), 0.4, 0.05);

  vec3 color = vec3(1.0 - pct, 0.0, 0.0);

  gl_FragColor = vec4(color, 1.0);
}
