#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 rotate(in vec2 st, in float angle) {
  vec2 result = st - 0.5;
  result = mat2(cos(angle), -sin(angle),
                sin(angle),  cos(angle)) * result;
  result += 0.5;
  return result;
}

vec2 tile(in vec2 st, in vec2 zoom) {
  return fract(st * zoom);
}

vec2 grid(in vec2 st, in vec2 zoom) {
  return floor(st * zoom);
}

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

  vec2 zoom = vec2(6.0, 6.0);

  vec2 pos  = tile(st, zoom);
  vec2 grid = grid(st, zoom);

  pos = rotate(pos, u_time * PI * 0.1 * (grid.x + 1.0 + grid.y) / 4.0);
  pos = pos - 0.5;

  float l = length(pos);
  float f = gear(pos, 14.0 + grid.x, 0.72);

  float d = smoothstep(f, f + 0.02, l * 2.2);

  float t = (st.x + st.y) / 2.0;
  vec3 color = vec3(t / 2.0, (1.0 - d) - t / 4.0, pow(t, 1.2));

  gl_FragColor = vec4(color, 1.0);
}
