#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float amplitude = 1.5;
uniform float freq = 1.5; // EM Htz
uniform float time;

const float PI = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(vec3(N.z), 1);
    float d = amplitude * sin(2 * PI * freq * time);

    gl_Position = modelViewProjectionMatrix * vec4(vertex + normal * d,1);
}
