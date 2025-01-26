#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

const float RADIUS   = 0.75;
const float SOFTNESS = 0.25;
const float ALPHA    = 0.45;

const vec3 COLOR1 = vec3(1.0);
const vec3 COLOR2 = vec3(0.95, 0.95, 0.95);

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec2 center = st - vec2(0.5);
  center.x *= u_resolution.x / u_resolution.y;

  float length = length(center);
  float vignette = smoothstep(RADIUS, RADIUS * RADIUS - SOFTNESS, length);

  vec3 color = mix(COLOR1, COLOR2 * vignette, ALPHA);

  gl_FragColor = vec4(color, 1.0);
}
