#version 330 core
// layout (location = 0) in vec3 aPos;
// layout (location = 1) in vec3 aColor;
// layout (location = 2) in vec2 aTexCoord;

layout (location = 0) in vec2 uv;

uniform float offset;
uniform mat4 transform;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform float time;

out vec3 ourColor;
out vec2 TexCoord;

void main()
{
    float u = uv.x + time;
    float v = uv.y;
    float R = 1;

    vec3 pos;
    pos.x = (R + v * cos(u * 0.5)) * cos(u);
    pos.y = (R + v * cos(u * 0.5)) * sin(u);
    pos.z = v * sin(u * 0.5);

    gl_Position = projection * view * model * vec4(pos, 1.0f);

    vec3 normal = normalize(vec3(
        cos(u),
        sin(u),
        sin(u * 0.5)
    ));

    ourColor = normal * 0.5 + 0.5;

    // TexCoord = aTexCoord;
}
