#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec2 pos = vec2(0.5) - st;
  float d = 0.0;

  float r = length(pos) * 2.2;
  float a = atan(pos.y, pos.x);

  // determine value
  // d = cos(a * 3.0);
  d = abs(cos(a * 4.0));

  vec3 color = vec3(1.0 - smoothstep(d, d + 0.1, r));

  gl_FragColor = vec4(color, 1.0);
}
