#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float distance(vec2 st, int sides) {
  float a = 2.5 * atan(-0.3 /  st.x, 1.0 - st.y) + PI * 2.0;
  float r = TWO_PI / float(sides);
  return cos(floor(0.5 + a / r) * r - a) * length(st);
}

void main(){
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  st.x *= u_resolution.x/u_resolution.y;
  st = st * 2.0 - 1.0;

  vec3 color = vec3(0.0);

  // Angle and radius from the current pixel
  float d = distance(st, 4);

  color = vec3(1.1 - smoothstep(0.39, 0.41, d * d));

  gl_FragColor = vec4(color, 1.0);
}