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

float box(vec2 st, vec2 size, float smoothEdges) {
  size = vec2(0.5) - size * 0.5;
  vec2 aa = vec2(smoothEdges * 0.5);
  vec2 uv = smoothstep(size, size + aa, st);
  uv *= smoothstep(size, size + aa, vec2(1.0) - st);
  return uv.x * uv.y;
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  vec2 zoom = vec2(8.0);
  st = tile(st, zoom);
  // st = rotate(st, PI * 0.25);

  vec3 color = vec3(1.0);
  vec3 background = vec3(0.34, 0.25, 0.21);
  vec3 maincolor = vec3(0.50, 0.50, 0.32);

  // basic background pattern
  color -= vec3(box(st, vec2(0.4, 2.0), 0.01)) / 4.5 * background;
  color -= vec3(box(st + vec2(0.3, 0.0), vec2(0.4, 2.0), 0.01)) / 4.5 * background;
  color -= vec3(box(st, vec2(2.0, 0.4), 0.01)) / 4.5 * background;
  color -= vec3(box(st + vec2(0.0, 0.3), vec2(2.0, 0.4), 0.01)) / 4.5 * background;

  // colored layers
  color -= vec3(box(st, vec2(0.2, 2.0), 0.01)) / 1.5 * maincolor;
  color -= vec3(box(st + vec2(0.4, 0.0), vec2(0.2, 2.0), 0.01)) / 1.5 * maincolor;
  color -= vec3(box(st, vec2(2.0, 0.2), 0.01)) / 1.5 * maincolor;
  color -= vec3(box(st + vec2(0.0, 0.4), vec2(2.0, 0.2), 0.01)) / 1.5 * maincolor;

  gl_FragColor = vec4(color, 1.0);
}
