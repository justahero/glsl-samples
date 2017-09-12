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

vec2 opRepetition(vec2 p, vec2 c) {
  return mod(p, c) - 0.5 * c;
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

float circle(in vec2 st, float radius) {
  vec2 dist = st - vec2(0.5);
  return 1.0 - smoothstep(radius - (radius * 0.01),
                          radius + (radius * 0.01),
                          dot(st, st) * 4.0);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  st = st * vec2(12.0);

  float d = 0.0;
  d = circle(opRepetition(st + vec2(2.0), vec2(4.0)), 2.5);
  d = opUnion(d, circle(opRepetition(st + vec2(0.0), vec2(4.0)), 2.5));

  d = opUnion(d, circle(opRepetition(st + vec2(0.75), vec2(1.5)), 0.25));
  d = opUnion(d, circle(opRepetition(st + vec2(1.50), vec2(1.5)), 0.25));

  vec3 color = vec3(d);

  gl_FragColor = vec4(color, 1.0);
}
