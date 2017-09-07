#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float gear(vec2 pos, float bumps, float radius) {
  float a = atan(pos.y, pos.x);
  return smoothstep(-0.50, 1.0, 1.2 * cos(a * bumps)) * (radius * 0.25) + radius;
}

mat2 rotate(float angle) {
  return mat2(cos(angle), -sin(angle),
              sin(angle),  cos(angle));
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  st -= vec2(0.5);
  st *= rotate(u_time * PI * 0.25);

  vec2 pos = st;

  float l = length(pos);
  float f = gear(pos, 14.0, 0.72);

  vec3 color = vec3(1.0 - smoothstep(f, f + 0.02, l * 2.2));

  gl_FragColor = vec4(color, 1.0);
}
