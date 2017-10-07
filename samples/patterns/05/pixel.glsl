#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

float random(vec2 st) {
    return fract(sin(dot(st, vec2(12.9898, 78.233)))) * 43758.543123;
}

vec2 truchetPattern(vec2 st, float index) {
    index = fract((index - 0.5) * 2.0);
    if (index > 0.75) {
      st = vec2(1.0) - st;
    } else if (index > 0.5) {
      st = vec2(1.0 - st.x, st.y);
    } else if (index > 0.25) {
      st = 1.0 - vec2(1.0 - st.x, st.y);
    }
    return st;
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution;

  st *= vec2(20.0, 20.0);

  vec2 ipos = floor(st);
  vec2 fpos = fract(st);

  vec2 tile = truchetPattern(fpos, random(ipos));

  float color = smoothstep(tile.x - 0.3, tile.x, tile.y) -
                smoothstep(tile.x, tile.x + 0.3, tile.y);

  gl_FragColor = vec4(vec3(color), 1.0);
}
