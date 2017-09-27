#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

mat2 rotate(float angle) {
  return mat2(cos(angle), -sin(angle),
              sin(angle),  cos(angle));
}

void main() {
  vec2 st = (gl_FragCoord.xy / u_resolution);

  st -= vec2(0.5);
  st *= rotate(u_time * PI * 0.25);

  vec2 pos = st * rotate(12.0 * sin(u_time * 0.125) * cos(u_time * PI * 0.125) * length(st));

  float r = length(pos) * 2.2;
  float a = atan(pos.y, pos.x);

  // determine value
  float d = abs(cos(a * 4.0));

  vec3 color = vec3(1.0 - smoothstep(d, d + 0.1, r));

  gl_FragColor = vec4(color, 1.0);
}
