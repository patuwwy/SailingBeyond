#version 430

layout (location=0) in vec2 i;
out vec2 p;
out gl_PerVertex
{
vec4 gl_Position;
};

void main()
{
    gl_Position=vec4(i,0.,1.);
    p=i;
}
