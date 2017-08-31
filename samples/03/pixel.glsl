// Author: Inigo Quiles
// Title: Expo

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float drawSmoothRect(vec2 st, float width, float radius) {
  vec2 bl = smoothstep(vec2(width), st, vec2(radius));
  vec2 tr = smoothstep(vec2(width), 1.0 - st, vec2(radius));
  return bl.x * bl.y * tr.x * tr.y;
}

float drawRect(vec2 st, float width) {
  vec2 bl = step(width, st);
  vec2 tr = step(width, 1.0 - st);
  return bl.x * bl.y * tr.x * tr.y;
}

float test(vec2 st) {
  float left   = 1.0;
  float right  = 1.0;
  float top    = 1.0;
  float bottom = 1.0;

  if (0.2 <= st.y && st.y <= 0.7) {
    if (0.2 <= st.x && st.x <= 0.3) {
      left = 0.0;
    }
    if (0.6 <= st.x && st.x <= 0.7) {
      right = 0.0;
    }
  }

  if (0.2 <= st.x && st.x <= 0.7) {
    if (0.2 <= st.y && st.y <= 0.3) {
      top = 0.0;
    }
    if (0.6 <= st.y && st.y <= 0.7) {
      bottom = 0.0;
    }
  }

  return (left * top) * (right * bottom);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  // float pct = drawRect(st, 0.01);

  float pct = test(st);
  vec3 color = vec3(pct);

  gl_FragColor = vec4(color, 1.0);
}
