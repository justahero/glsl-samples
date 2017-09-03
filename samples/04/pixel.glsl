#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec2 toCenter = vec2(0.5) - st;
  float pct = smoothstep(0.5, length(toCenter) * 2.0, 0.50 + 0.10 * sin(u_time * 4.0));
  vec3 color = vec3(1.0 - pct, 0.0, 0.0);

  gl_FragColor = vec4(color, 1.0);
}
