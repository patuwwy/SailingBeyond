#version 430

layout (location=0) out vec4 C0;
layout (location=1) out vec4 C1;
layout (location=2) out vec4 C2;
layout (location=3) uniform vec4 p[3];

layout (binding=0) uniform sampler2D B0;
layout (binding=1) uniform sampler2D B1;
layout (binding=2) uniform sampler2D B2; // font

in vec2 uv;

vec2 ouv;
float alpha;

#define M0 1597334673U
#define M1 3812015801U
#define M2 uvec2(M0, M1)
float hash12( vec2 p ) { uvec2 q = uvec2(ivec2(p)) * M2; uint n = (q.x ^ q.y) * M0; return float(n) * (1./float(0xffffffffU)); }

vec4
     bloom = vec4(0),
     blur = vec4(0), 
     ftex;

#define GA 2.399
mat2 rot = mat2(cos(GA),sin(GA),-sin(GA),cos(GA));
vec3 pixel;

vec3 pixels[] = vec3[](
	vec3(.0006,.0006, 1.),
	vec3(.0003,.0003, 1.),
	vec3(.0005, .0005, 1.),
	vec3(.002,.0005, .6)
);

float intensity(vec4 col) {
	return dot(col.rgb, vec3(0.2126, 0.7152, 0.0722));
}

void dof(sampler2D tex, vec2 uv, float rad, vec4 org)
{
	vec2 angle = vec2(0,rad);
    vec4 col = texture(tex,uv);

	
	for (int j=0;j<48;j++)
    {  
        rad += 1./rad;
	    angle *=rot;
        
        col=texture(tex,uv+pixel.xy*(rad-1.)*angle);
        
        if (intensity(col) > .9) {            
			bloom += col;              
        }
        
        blur += col;
	}

	blur /= 48.;

//    org = mix(org * 2., bloom / 90., .4);
    //return org * 1.;
	
}

//-------------------------------------------------------------------------------------------
void mainImage()
{
	//pixel = pixels[1];
	vec2 res = 1./ p[0].yz;

	vec4 orgColor = 
        texture(B1,ouv) 
    	+ texture(B1,ouv + res.xy) * .5
        + texture(B1,ouv + res.yx) * .5
        + texture(B1,ouv - res.xy) * .5
        + texture(B1,ouv - res.yx) * .5;
    
    orgColor /= 5.;

    dof(B1, ouv, pixel.z, orgColor);
	
    orgColor = mix(
        orgColor, 
        blur, 
        clamp(
        	//min(1., 1. - pow(abs(texture(B0,ouv).w - .5) * 2., 2.)),
			abs(alpha + pow(length(uv), 3.)),
            0.,
            1.
        ) * ftex.b
    );// 

    orgColor = mix(
        orgColor, 
        orgColor.rrga, 
        clamp(
        	//min(1., 1. - pow(abs(texture(B0,ouv).w - .5) * 2., 2.)),
			pow(max(0., length(uv) - .1), 4.),
            0.,
            1.
        ) * ftex.a
    );// 
	
	
    //orgColor += max(vec4(0.), bloom / 96. - alpha);//, .5);
 	orgColor += abs(bloom / 96) * ftex.g;
    C0 = orgColor * 1.2;    
}


void main()
{		
    ftex = texelFetch(B2, ivec2(6, 0), 0);
    pixel = pixels[int(ftex.b)]; 
    ouv = (uv + 1.) / 2.;    
    alpha = texture(B1, ouv).a;// * ftex.g;
    mainImage();      
    if (p[1].y < 1.) {  
        vec4 f = texelFetch(B2, ivec2(5, 0), 0);
        C0 = mix(C0, vec4(f.y), f.z); 
    }
    
//C0 = vec4(alpha);
    //C0 = bloom;    
//C0 += vec4(0.) + hash12((uv + p[0].x) * 1000.) * .1 ;
//C0 = vec4(1.) * gl_FragCoord.x / p[0].y;
        //C0.rgb = texture(B2, ).rgb;//pow(C1.rgb, vec3(1.2));
  //C0 = texelFetch(B2, ivec2(4,0),0);
 // C0 = texelFetch(B1, ivec2(gl_FragCoord.xy), 0).aaaa;
//C0 = vec4(alpha);
}   

