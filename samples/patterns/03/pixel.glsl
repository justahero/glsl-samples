#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float opUnion(float d1, float d2) {
  return max(d1, d2);
}

float opSubtract(float d1, float d2) {
  return max(-d1, d2);
}

float opIntersect(float d1, float d2) {
  return min(d1, d2);
}

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

float circle(in vec2 st, in vec2 pos, float radius) {
  vec2 dist = st - pos;
  return 1.0 - smoothstep(radius - (radius * 0.01),
                          radius + (radius * 0.01),
                          dot(dist, dist) * 4.0);
}

float rings(in vec2 st, in vec2 offset, float radius) {
  return circle(st, offset, radius);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec2 zoom = vec2(6.0);
  st = tile(st, zoom);
  // st = rotate(st, PI * 0.25);

  float d;
  d = rings(st, vec2(0.4), 0.4);
  d = opUnion(d, rings(st, vec2(0.6), 0.4));

  vec3 color = vec3(d);

  gl_FragColor = vec4(color, 1.0);
}
