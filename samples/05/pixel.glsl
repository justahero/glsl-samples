#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float distance(in vec2 st, in vec2 pos, float radius) {
  vec2 dist = st - pos;
  return 1.0 - smoothstep(radius - (radius * 0.01),
                          radius + (radius * 0.01),
                          dot(dist, dist) * 4.0);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  // adjust for aspect ratio
  st.x *= u_resolution.x / u_resolution.y;
  st = st * 2.0 - 1.0;

  float d = 0.0;
  d = length(abs(st) - (0.25 + 0.05 * sin(u_time * 4.0) + 0.10 * cos(u_time * 2.0)));
  // d = distance(st, vec2(0.6, 0.50), 0.5) * distance(st, vec2(0.4, 0.75), 0.4);
  // d = min(distance(st, vec2(0.6, 0.50), 0.5), distance(st, vec2(0.4, 0.75), 0.4));
  // d = max(distance(st, vec2(0.6, 0.50), 0.5), distance(st, vec2(0.4, 0.75), 0.4));
  // d = pow(distance(st, vec2(0.50, 0.50), 0.45), distance(st, vec2(0.40, 0.60), 0.4));

  vec3 color = vec3(fract(15.0 * d), 0.0, 0.4 + 0.25 * tan(u_time));

  gl_FragColor = vec4(color, 1.0);
}
