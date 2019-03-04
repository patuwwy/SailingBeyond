#version 430

layout (location=3) uniform vec4 U[4];
layout (location=0) out vec4 C0;
layout (location=1) out vec4 C1;
layout (location=2) out vec4 C2;
layout (binding=0) uniform sampler2D B0;
layout (binding=1) uniform sampler2D B1;
layout (binding=2) uniform sampler2D B2;

in vec2 ouv;

#define iTime (U[0].x)
#define FOV 110.0
#define FOG .06

#define PI 3.14159265
#define TAU (2*PI)
#define PHI (1.618033988749895)
#define FAR 350
#define INFINITY 1e32

precision highp float;

vec2 uv;
vec3 vuv = vec3(0., 1., 0. ), keyTime, s1_ob ;
float pattern;

vec4 gt;
void gT() {
    gt = texelFetch(B2, ivec2(4,0),0);
}
#define PATTERN_TIME 5.485714
#define CI keyTime = texelFetch(B2, ivec2(4, 0), 0).rgb; pattern = iTime / PATTERN_TIME; uv = ouv * .5; if (abs(uv.y) > .4) discard;
    

struct geometry {
    float d;
    int mat;
    float specular;
    float diffuse;
    vec4 color;  
    vec3 sp;
    vec3 hp;
    float mirror;
    float i;
    float glow;
};

// helpers

float saturate(float a) { return clamp(a, 0.0, 1.0); }

// sdf operations

geometry geoU(geometry g1, geometry g2) {
    if (g1.d < g2.d) return g1;
    return g2;
}

float smin( float a, float b, float k )
{
    float res = exp( -k*a ) + exp( -k*b );
    return -log( res )/k ;
}

// sdf helpers

float vmax(vec2 v) {
	return max(v.x, v.y);
}

float vmax(vec3 v) {
	return max(max(v.x, v.y), v.z);
}

float vmax(vec4 v) {
	return max(max(v.x, v.y), max(v.z, v.w));
}

/// space manipulations

float pMod1(inout float p, float size) {
	float halfsize = size*0.5;
	float c = floor((p + halfsize)/size);
	p = mod(p + halfsize, size) - halfsize;
	return c;
}

vec3 pMod3(inout vec3 p, vec3 size) {
	vec3 c = floor((p + size*0.5)/size);
	p = mod(p + size*0.5, size) - size*0.5;
	return c;
}
// Mirror at an axis-aligned plane which is at a specified distance <dist> from the origin.
float pMirror (inout float p, float dist) {
	float s = sign(p);
	p = abs(p)-dist;
	return s;
}

// Mirror in both dimensions and at the diagonal, yielding one eighth of the space.
// translate by dist before mirroring.
vec2 pMirrorOctant (inout vec2 p, vec2 dist) {
	vec2 s = sign(p);
	pMirror(p.x, dist.x);
	pMirror(p.y, dist.y);
	if (p.y > p.x)
		p.xy = p.yx;
	return s;
}
float pModInterval1(inout float p, float size, float start, float stop) {
	float halfsize = size*0.5;
	float c = floor((p + halfsize)/size);
	p = mod(p+halfsize, size) - halfsize;
	if (c > stop) { //yes, this might not be the best thing numerically.
		p += size*(c - stop);
		c = stop;
	}
	if (c <start) {
		p += size*(c - start);
		c = start;
	}
	return c;
}

float pModPolar(inout vec2 p, float repetitions) {
	float angle = 2.*PI/repetitions;
	float a = atan(p.y, p.x) + angle/2.;
	float r = length(p);
	float c = floor(a/angle);
	a = mod(a,angle) - angle/2.;
	p = vec2(cos(a), sin(a))*r;
	// For an odd number of repetitions, fix cell index of the cell in -x direction
	// (cell index would be e.g. -5 and 5 in the two halves of the cell):
	if (abs(c) >= (repetitions/2.)) c = abs(c);
	return c;
}

void pR(inout vec2 p, float a) {
	p = cos(a)*p + sin(a)*vec2(p.y, -p.x);
}

// Shortcut for 45-degrees rotation
void pR45(inout vec2 p) {
	p = (p + vec2(p.y, -p.x))*sqrt(0.5);
}

float fOpUnionStairs(float a, float b, float r, float n) {
	float d = min(a, b);
	vec2 p = vec2(a, b);
	pR45(p);
	p = p.yx - vec2((r-r/n)*0.5*sqrt(2.));
	p.x += 0.5*sqrt(2.)*r/n;
	float x = r*sqrt(2.)/n;
	pMod1(p.x, x);
	d = min(d, p.y);
	pR45(p);
	return min(d, vmax(p -vec2(0.5*r/n)));
}

// sdfs



float fBox(vec3 p, vec3 b) {
	vec3 d = abs(p) - b;
	return length(max(d, vec3(0))) + vmax(min(d, vec3(0)));
}

float fBox2Cheap(vec2 p, vec2 b) {
	return vmax(abs(p)-b);
}

float fSphere(vec3 p, float r) {
	return length(p) - r;
}
float fCylinder(vec3 p, float r, float h) {
	float d = length(p.xz) - r;
	d = max(d, abs(p.y) - h);
	return d;
}

float ring(vec3 p, vec4 s) {
    return max(
        fCylinder(p, s.x, s.y),
        -fCylinder(p, s.x - s.z, s.y * 2.)
    );
}

// A circular disc with no thickness (i.e. a cylinder with no height).
// Subtract some value to make a flat disc with rounded edge.
float fDisc(vec3 p, float r) {
	float l = length(p.xz) - r;
	return l < 0 ? abs(p.y) : length(vec2(p.y, l));
}

// Distance to line segment between <a> and <b>, used for fCapsule() version 2below
float fLineSegment(vec3 p, vec3 a, vec3 b) {
	vec3 ab = b - a;
	float t = saturate(dot(p - a, ab) / dot(ab, ab));
	return length((ab*t + a) - p);
}

// Capsule: A Cylinder with round caps on both sides
float fCapsule(vec3 p, float r, float c) {
	return mix(length(p.xz) - r, length(vec3(p.x, abs(p.y) - c, p.z)) - r, step(c, abs(p.y)));
}

// Torus in the XZ-plane
float fTorus(vec3 p, float smallRadius, float largeRadius) {
	return length(vec2(length(p.xz) - largeRadius, p.y)) - smallRadius;
}


geometry fShip(vec3 bp)
{
    geometry ship, shield, homes, pipe, engine, tail;
    
    if (length(bp) > 2.) {
     	ship.d = length(bp) -.5;
        return ship;   
    }
        

    pR(bp.zy, keyTime.r * 10.);  
    shield.diffuse = 1.;
    shield.specular = 1.;
    shield.mirror = 1.;
    shield.mat = -1;
    shield.color = vec4(.0);
    shield.d = 1e9;
    homes = pipe = engine = shield;
    
    shield.d = fBox(bp, vec3(2.5));
    //return shield;
	shield.mirror = .7;
    vec3 p = bp.zyx,  p2 = bp;;
    
    vec3 pp = p;
    float d1, d2;
    
    pModPolar(p.xy, 12.);
    
    pMirrorOctant(p.xz, vec2(.055, .01));
      
    engine.d = fBox(pp + vec3(0. ,0., .1), vec3(.02, .02, .05 ) * vec2(.4 - length(pp) * 17.3, .1).xxy);
    
   	pR45(p.xy);//, PI / 4.);
    
    d2 = fBox(p, vec3(.2, .2, .2) * .1);
    d2 = min(d2, engine.d);
    engine.d = fOpUnionStairs(d2, engine.d, .1, 7. );
    if (length(pp.xyz) < .04) engine.color = vec4(1., .5, 0., 0.) * 5.;
    engine.sp = p;
    engine.mirror = 0.;
    vec3 c = bp + vec3(.2, 0., 0.);
    shield.d = max(length(c) - 0.2, -(length(c - vec3(.13, 0., 0.)) - .32)) - .01;
    shield.sp = c;
    
    pipe.d = fCapsule(c.yxz, .01, .1);
    pipe.sp = c.yxz;
    pipe.mirror = 0.;

    pipe.color = vec4(0.);
    //pModPolar(bp.yx, 12.);
    //bp.zx -= .1;
    //bp.x = abs(bp.x);
    bp.x += .2;
      
    pModPolar(bp.yz, 6.);    //bp = -abs(bp);//bp.y -= .24;
    
    //pR(bp.xy, 1.);
    homes.d = fBox(bp, vec3(.03, .07, .01));
    homes.sp = bp;
    homes.mirror = 0.;
    homes.color = vec4(1.);
    //d1 = min(d1, tritun(p2));//return d2;
    //return min(d3, min(d1, d2));  
    return geoU(engine, geoU(shield, geoU(pipe, homes)));
    vec3 pp2=pp;
    pp.z -= fract(iTime * 5.) * .03;
    float a = pModInterval1(pp.z, .03, 1., 6.);
    ;
    //tail.dist = fTorus(pp.yzx, .004, .075 - a * .015);
    tail.d = fTorus(pp.yzx, .004, .05 - pp2.z * .2);
    tail.color = vec4(1., 0.5, 0., 0.);

    return geoU(tail, geoU(engine, geoU(shield, geoU(pipe, homes))));
}

float tritun(vec3 p)
{       
    pModPolar(p.yz, 3.);
    p.y -= .2;
    p.z -= 1.2; 
    return fBox(p, vec3(.01, .01, 5.));     
}

float trits(vec3 bp)
{
    
    bp.x -= 7.;
    float i = pModInterval1(bp.z, 2., -20., 26. );
   // bp.y -= min(2., keyTime.r  * 9. + i * .3 - 2.) - .5;
    return tritun(bp.zyx);
    
 

}


// noise

vec3 hash33_(vec3 p){     
    float n = sin(dot(p, vec3(7, 157, 113)));    
    return fract(vec3(2097152, 262144, 32768)*n); 
}
#define M0 1597334673U
#define M1 3812015801U
#define M2 uvec2(M0, M1)
#define M3 uvec3(M0, M1, 2798796413U)

float hash11( float q )
{
    uvec2 n = int(q) * M2;
    return float((n.x ^ n.y) * M0) * (1.0/float(0xffffffffU));
}
float hash12( vec2 p ) { uvec2 q = uvec2(ivec2(p)) * M2; uint n = (q.x ^ q.y) * M0; return float(n) * (1./float(0xffffffffU)); }
vec3 hash33(vec3 p) { uvec3 q = uvec3(ivec3(p)) * M3; q = (q.x ^ q.y ^ q.z)*M3; return vec3(q) * (1.0/float(0xffffffffU)); }

float voronoi(vec3 p){
	vec3 b, r, g = floor(p);
	p = fract(p); 
	float d = 1.;      
    for(int j = -1; j <= 1; j++) {
	    for(int i = -1; i <= 1; i++) {    		
		    b = vec3(i, j, -1); r = b - p + hash33(g+b); d = min(d, dot(r,r));    		
		    b.z = 0.0; r = b - p + hash33(g+b); d = min(d, dot(r,r)); 
            b.z = 1.; r = b - p + hash33(g+b); d = min(d, dot(r,r));    			
	    }
	}	
	return d;
}

float noiseLayers(in vec3 p) {
    vec3 t = vec3(0., 0., p.z);    
    float tot = 0., sum = 0., amp = 1.;
    for (int i = 0; i < 2; i++) { tot += voronoi(p + t) * amp; p *= 2.0; t *= 1.5; sum += amp; amp *= 0.5; }    
    return tot / sum;
}

float noiseF( in vec2 p )
{
    vec2 i = floor( p ), f = fract( p ), u = f*f*f*(3.-2.*f);

    return mix( mix( hash12( i + vec2(0.,0.) ), 
                     hash12( i + vec2(1.,0.) ), u.x),
                mix( hash12( i + vec2(0.,1.) ), 
                     hash12( i + vec2(1.,1.) ), u.x), u.y);
}

float noiseFF(in vec2 uv) {
    uv *= 2.;
    
 	mat2 m = mat2( 1.6,  1.2, -1.2,  1.6 ) * 1.25;
    
    float f  = .5*noiseF( uv ); uv = m*uv;
    f += .2500*noiseF( uv ); uv = m*uv;
    f += .1250*noiseF( uv ); uv = m*uv;
    f += .0625*noiseF( uv ); uv = m*uv;   
    
    return f;
}

// 3d noise
float noise_3(in vec3 p) {
    vec3 i = floor(p);
    vec3 f = fract(p);	
	vec3 u = 1.-(--f)*f*f*f*-f;
    
    vec2 ii = i.xy + i.z * vec2(5.0);
    float a = hash12( ii + vec2(0.0,0.0) );
	float b = hash12( ii + vec2(1.0,0.0) );    
    float c = hash12( ii + vec2(0.0,1.0) );
	float d = hash12( ii + vec2(1.0,1.0) ); 
    float v1 = mix(mix(a,b,u.x), mix(c,d,u.x), u.y);
    
    ii += vec2(5.0);
    a = hash12( ii + vec2(0.0,0.0) );
	b = hash12( ii + vec2(1.0,0.0) );    
    c = hash12( ii + vec2(0.0,1.0) );
	d = hash12( ii + vec2(1.0,1.0) );
    float v2 = mix(mix(a,b,u.x), mix(c,d,u.x), u.y);
        
    return max(mix(v1,v2,u.z),0.);
}


float fbm(vec3 x)
{
    float r = 0.0;
    float w = 1.0, s = 1.0;
    for (int i=0; i<4; i++)
    {
        w *= 0.25;
        s *= 3.;
        r += w * noise_3(s * x);
    }
    return r;
}

// 	3D noise function (IQ)
float noiseShort(vec3 p)
{
	vec3 ip=floor(p);
    p-=ip; 
    vec3 s=vec3(7,157,113);
    vec4 h=vec4(0.,s.yz,s.y+s.z)+dot(ip,s);
    p=p*p*(3.-2.*p); 
    h=mix(fract(sin(h)*43758.5),fract(sin(h+s.x)*43758.5),p.x);
    h.xy=mix(h.xz,h.yw,p.y);
    return mix(h.x,h.y,p.z); 
}

geometry map(vec3 ro);

geometry trace(in vec3 ro, in vec3 rd)
{
    geometry r;
    float d = 0.;
    
    for (int i = 0; i < 149; i++)
    {
        r = map(ro + rd * d);
        d += r.d *(.6 + i / 1e2);
        r.i = i;
        if (abs(r.d) < 0.001 || d > FAR) break;                
    }

    r.d = d;
    return r;
}
vec3 stars(in vec3 p)
{
    vec3 c = vec3(0.);
    float res = 21100.;
    
	for (float i=0.;i<3.;i++)
    {
        vec3 q = fract(p*(.15*res))-0.5;
        vec3 id = floor(p*(.15*res));
        vec2 rn = hash33(id).xy / 14.;
        float c2 = 1.-smoothstep(0.,.6,length(q));
        c2 *= step(rn.x,.0005+i*i*0.001);
        c += c2*(mix(vec3(1.0,0.49,0.1),vec3(0.75,0.9,1.),rn.y)*0.25+0.75);
        p *= 1.4;
    }
    return c*c*.7;
}

vec3 normals(vec3 p) {float d = map(p).d; return normalize(vec3(map(p+vec3(.001,0,0)).d-d, map(p+vec3(0,.001,0)).d-d, map(p+vec3(0,0,.001)).d-d));}

float softShadow(vec3 ro, vec3 lp, float k) {
    const int maxIterationsShad = 18;
    vec3 rd = (lp - ro); // Unnormalized direction ray.

    float shade = 1.;
    float dist = 1.;
    float end = max(length(rd), 0.1);
    float stepDist = end / float(maxIterationsShad);

    rd /= end;
    for (int i = 0; i < maxIterationsShad; i++) {
        float h = map(ro + rd * dist).d;
        //shade = min(shade, k*h/dist);
        shade = min(shade, smoothstep(0.0, 1.0, k * h / dist)); 
        dist += min(h, stepDist * 2.); 
        if (h < 0.001 || dist > end) break;
    }
    return min(max(shade, 0.4), 1.0);
}

float getAO(vec3 hitp, vec3 normal, float dist)
{
    vec3 spos = hitp + normal * dist;
    float sdist = map(spos).d;
    return clamp(sdist / dist, 0.4, 1.0);
}

vec4 getObjectColor(vec3 p, vec3 n, geometry obj) {
    vec4 col = vec4(.0);
    
    if (obj.mat == -1) { 
        return vec4(0.5);// + sin(iTime * 2.) * 5.;
    };
    if (obj.mat == 0) { 
        return vec4(2.);// + sin(iTime * 2.) * 5.;
    };
    
    // scene 1 ground
    if (obj.mat == 2) { 
        return vec4(1., .6, 0.3, 1.) + texture(B2, obj.hp.xy * 0.22).rrrr; 
    };
        
    if (obj.mat == 3) { 
        return vec4(1., 1., 0.3, 1.) * .3;
    }

    if (obj.mat == 4) {
        return vec4(1.);
    }

    if (obj.mat == 5) { // glow column scene4
        return vec4(5.);
    }

    if (obj.mat == 6) { // glow column scene4
        return vec4(1., .5, .5, 0.);
    }

    if (obj.mat == 51) { // glow column scene4 NOT USED
        return vec4(1., .5, .5, 0.);
    }
    
    return col ;//* noiseFF(obj.sp.xz);//* fract(p.y / 10.) * 10.;

}

vec4 doColor( in vec3 sp, in vec3 rd, in vec3 sn, in vec3 lp, geometry obj) {
	vec4 sceneCol = vec4(0.0);
    lp = sp + lp;
    vec3 ld = lp - sp; // Light direction vector.
    float lDist = max(length(ld / 2.), 0.001); // Light to surface distance.
    ld /= lDist; // Normalizing the light vector.

    // Attenuating the light, based on distance.
    float atten = 1. / (1.0 + lDist * 0.025 + lDist * lDist * 0.2);

    // Standard diffuse term.
    float diff = max(dot(sn, ld), .9) * 1.;
    // Standard specualr term.
    float spec = pow(max(dot(reflect(-ld, sn), -rd), .2), .05);

    // Coloring the object. You could set it to a single color, to
    // make things simpler, if you wanted.
    vec4 objCol = getObjectColor(sp, sn, obj);
	
    // Combining the above terms to produce the final scene color.
    sceneCol.rgb += (objCol.rgb * (diff + .0015) + spec * .1 );// * atten;
	//sceneCol.a = objCol.a;
    // Return the color. Done once every pass... of which there are
    // only two, in this particular instance.
    
    return sceneCol;
}

vec3 applyFog( in vec3  rgb,      // original color of the pixel
               in float distance, // camera to point distance
               in vec3  rayOri,   // camera position
               in vec3  rayDir,
               in vec3  fogCol
             ) {  // camera to point vector
    rayOri.y += 21.;
    float c = 2.;
    float b = 0.0045;
    //rayOri.y -=50.;
    //rayOri.y -= 14.;
    float fogAmount = c * exp(-rayOri.y * b) * (1.0-exp( -distance*rayDir.y*b ))/rayDir.y;
    fogAmount = saturate(fogAmount);
    
    return mix( rgb, fogCol, fogAmount );
}

vec4 texture3d (sampler2D t, vec3 p, vec3 n, float scale) {
	
    return 
		texture(t, p.yz * scale) * abs (n.x) +
		texture(t, p.zx * scale) * abs (n.y) +
		texture(t, p.xy * scale) * abs (n.z);
}

// mu6k's flare
vec3 lensflare(vec2 uv,vec2 pos) {
	vec2 main = uv-pos;
	vec2 uvd = uv*(length(uv));
	
	float ang = atan(main.x,main.y);
	float dist=length(main); dist = pow(dist,.1);
	float n = hash12(vec2(ang*16.0,dist*32.0));
	
	float f0 = 1.0/(length(uv-pos)*16.0+1.0);
	
	f0 = f0+f0*(sin(hash11((pos.x+pos.y)*2.2+ang*4.0+5.954)*16.0)*.1+dist*.1+.8);
	
	float f1 = max(0.01-pow(length(uv+1.2*pos),1.9),.0)*7.0;

	float f2 = max(1.0/(1.0+32.0*pow(length(uvd+0.8*pos),2.0)),.0)*00.25;
	float f22 = max(1.0/(1.0+32.0*pow(length(uvd+0.85*pos),2.0)),.0)*00.23;
	float f23 = max(1.0/(1.0+32.0*pow(length(uvd+0.9*pos),2.0)),.0)*00.21;
	
	vec2 uvx = mix(uv,uvd,-0.5);
	
	float f4 = max(0.01-pow(length(uvx+0.4*pos),2.4),.0)*6.0;
	float f42 = max(0.01-pow(length(uvx+0.45*pos),2.4),.0)*5.0;
	float f43 = max(0.01-pow(length(uvx+0.5*pos),2.4),.0)*3.0;
	
	uvx = mix(uv,uvd,-.4);
	
	float f5 = max(0.01-pow(length(uvx+0.2*pos),5.5),.0)*2.0;
	float f52 = max(0.01-pow(length(uvx+0.4*pos),5.5),.0)*2.0;
	float f53 = max(0.01-pow(length(uvx+0.6*pos),5.5),.0)*2.0;
	
	uvx = mix(uv,uvd,-0.5);
	
	float f6 = max(0.01-pow(length(uvx-0.3*pos),1.6),.0)*6.0;
	float f62 = max(0.01-pow(length(uvx-0.325*pos),1.6),.0)*3.0;
	float f63 = max(0.01-pow(length(uvx-0.35*pos),1.6),.0)*5.0;
	
	vec3 c = vec3(.0);
	
	c.r+=f2+f4+f5+f6; c.g+=f22+f42+f52+f62; c.b+=f23+f43+f53+f63;
	c = c*1.3 - vec3(length(uvd)*.05);
	c+=vec3(f0);
	
	return c;
}