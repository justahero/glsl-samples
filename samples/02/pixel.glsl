#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float drawRect(vec2 st, float left, float top, float right, float bottom, float width) {
  float l = 1.0;
  float r = 1.0;
  float t = 1.0;
  float b = 1.0;

  if (top <= st.y && st.y <= bottom) {
    if (left <= st.x && st.x <= left + width) {
      l = 0.0;
    }
    if (right - width <= st.x && st.x <= right) {
      r = 0.0;
    }
  }

  if (left <= st.x && st.x <= right) {
    if (top - width <= st.y && st.y <= top) {
      t = 0.0;
    }
    if (bottom - width <= st.y && st.y <= bottom) {
      b = 0.0;
    }
  }

  return (l * t) * (r * b);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float pct = drawRect(st, 0.20, 0.25, 0.60, 0.90, 0.01);
  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
