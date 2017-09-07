#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

mat2 rotate(float angle) {
  return mat2(cos(angle), -sin(angle),
              sin(angle),  cos(angle));
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  st -= vec2(0.5);
  st = rotate(u_time * PI * 0.2) * st;

  vec2 pos = st;

  float r = length(pos) * 2.2;
  float a = atan(pos.y, pos.x);

  float f = 0.0;
  f = smoothstep(-0.75, 1.0, cos(a * 10.0)) * 0.15 + 0.60;

  vec3 color = vec3(1.0 - smoothstep(f, f + 0.02, r));

  gl_FragColor = vec4(color, 1.0);
}
