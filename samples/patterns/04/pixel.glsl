#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  float color = 0.0;

  float quantity = 5.0;
  float t = 0.5 + 0.5 * sin(u_time); // between 0-1

  float factor = 1.0 / quantity;

  vec2 size   = vec2(t / quantity);
  vec2 offset = vec2(0.5 / quantity);

  if (mod(st.x + offset.x + size.x / 2.0, factor) < size.x &&
      mod(st.y - offset.y + size.y / 2.0, factor) < size.y) {
    color = 1.0;
  }

  gl_FragColor = vec4(vec3(color), 1.0);
}
