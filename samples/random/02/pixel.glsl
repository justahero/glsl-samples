#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_mouse;
uniform vec2 u_resolution;
uniform float u_time;

float randomf(float v) {
    return fract(sin(dot(vec2(v, 0.0),
                         vec2(12.9898, 78.233))) * 43758.5453123);
}

float random(vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898, 78.233))) * 43758.5453123);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;

  float x = randomf(st.x);

  vec3 color = vec3(x);

  gl_FragColor = vec4(color, 1.0);
}
