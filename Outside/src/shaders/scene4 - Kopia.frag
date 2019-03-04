vec3 fromRGB(int r, int g, int b) {
 	return vec3(float(r), float(g), float(b)) / 255.;   
}

vec3 
    light = vec3(0.0),
    p = vec3(0.),
    p2 = vec3(0.),
	lightDir = vec3(0.);


vec3 lightColour = normalize(vec3(1.8, 1.0, 0.3)); 

const int Iterations =9;
#define Scale 3.
const float FoldingLimit = 300.0;
#define MinRad2 .1525
/* Camera at z-16
const int Iterations = 8;
const float Scale = 2.0;
const float FoldingLimit = 10000.0;
const float MinRad2 = 0.25;
*/
vec4 scale = vec4(Scale) / MinRad2;
float AbsScalem1 = abs(Scale - 1.0);
float AbsScaleRaisedTo1mIters = pow(abs(Scale), float(1-Iterations) - .3);
geometry DE(vec3 pos, float c)
{
    pos *= .8;
    pos.y *= .6;
 	vec4 p = vec4(pos,1.0), p0 = p; // p.w is the distance estimate
    if (pattern >= 26.) {
        p *= 12.;
    }
    for (int i=0; i<Iterations; i++)
    {
        //p -= p * .1;
        
        p.xyz = clamp(p.xyz, -1.0, 1.0) * 2.0 - p.xyz;
        
        p.y -= 0.4;
        pR(p.xz, 5.1);
        
        float r2 = dot(p.xyz, p.xyz);
        
        p *= clamp(max(MinRad2/r2, MinRad2), 0.0, 1.0);
        p = p*scale + p0;
        if (r2>FoldingLimit) break;
    }
    
	
 	geometry obj;
    obj.d = fBox(p.rgb, vec3(4., .1, 4.)) / p.w - AbsScaleRaisedTo1mIters; 
	obj.sp = p.xyz;
    return obj;
}



geometry map(vec3 p) {
    geometry obj, cp, tri;
    vec3 bp = p, bp2;

    pR(p.xy, .2);
    bp2 = p;
    
    obj = DE(p, 2.);
    //obj.dist = FAR;
	p = bp;
    
    obj.mat = 6;
    obj.sp = p;
    
    float n = texture(B2, (bp.zx * .04 - vec2(keyTime.g * .015, 0.))).g * .3;
    p.y -= n;
    
    obj.d = smin(obj.d, p.y + .1 - texture(B2, (bp.zx * .046 - vec2(keyTime.g * .031, 0.))).g * 1., 2. - n * 4.);
    
    //pR(p.xy, .2);
    
    cp.d = length(bp2.xz) - .4;
    cp.mat = 5;
    
    cp.d = min(cp.d, length(bp2) - iTime);
    
    obj = geoU(obj, cp);

    
    tri.d = trits(bp);
    tri.mat = 0;
   
   

    obj = geoU(obj, tri);

   // obj.dist = length(bp) - 1.;
    return obj;
}

vec3 Sky(in vec3 rd, bool showSun, vec3 lightDir)
{

   float sunSize = 3.5;
   float sunAmount = max(dot(rd, lightDir), 0.4);
   float v = pow(max(0., 1.2 - max(rd.y, 0.0)), 1.1);
   vec3 sky = mix(fromRGB(100,136,254), vec3(.4, .5, 1.3) * 2., v);
   if (showSun == false) sunSize = .1;
   sky += lightColour * sunAmount * sunAmount * 1. + lightColour * min(pow(sunAmount, 222.0)* sunSize, 0.2 * sunSize);
  

   return clamp(sky, 0.0, 1.0);
}

void mainImage() {
CI 

    vec3 light = vec3(0.0, 1., 0.);     
    
uv *= 1.8;
    vec3 ro = texelFetch(B2, ivec2(0, 0), 0).rgb;

    vec3
        vrp = texelFetch(B2, ivec2(2, 0), 0).rgb,		
    	vpn = normalize(vrp - ro),
    	u = normalize(cross(vuv, vpn)),
    	v = cross(vpn, u),
    	vcv = (ro + vpn),
    	scrCoord = (vcv + uv.x * u * 16./9. + uv.y * v),
    	rd = normalize(scrCoord - ro);
    
    vec4 c = vec4(0.);

    geometry tr = trace(ro, rd);
    tr.hp = ro + rd * tr.d;
    
    vec3 sn = normals(tr.hp);	
    geometry otr = tr;
    

    vec3 sky = Sky(rd, true, normalize(light)) * 1.;
    vec3 skyNoSun = Sky(rd, false, normalize(light)) * 1.;
    
    float alpha = 0.;
    
    //vec3 clight = vec3(20., 30., 10.);
    
    vec2 sunuv =  2.7*vec2( dot( normalize(light), u ), dot( normalize(light), v ) );
	
    vec3 lens = vec3(1.4,1.2,1.0)*(lensflare(uv * 2., sunuv) * 1.);
        vec3 sceneColor = vec3(0.);
	
    //geometry tr = trace(ro, rd);    
    
    tr.hp = ro + rd * tr.d;
    
    
    
    
    
    
    

    
    if (tr.d < FAR) { 
        float sh = softShadow(tr.hp, light, 1.);
    
    float 
        ao = getAO(tr.hp, sn, 1.);

        vec3 col = (doColor(tr.hp, rd, sn, light, tr) * 1.).rgb * 1.;
        sceneColor = col;
        
        //if (tr.mat == 6) 
        {
            sceneColor *= ao; 
            sceneColor *= sh; 
            sceneColor += max(0., 1. - length(tr.hp.xz) * .3);
        }

        sceneColor += 1. / length(tr.hp.xz) / 1.;
        
        float fog = smoothstep(FAR * FOG, 0., tr.d * 2.);
    	if (tr.mat == 6.) sceneColor = mix(sceneColor, sky, 1. - fog);
    	alpha = clamp(1.-otr.d / FAR * 90. + length(uv) / 2.- length(lens), 0., 1.);
        
        //sceneColor += .5 - (min(.5, pow(length(trits(tr.hp)) * 2., 2.)));

    } else {
        sceneColor = sky;
        tr.d = FAR;
    }
    
    C1 = vec4(clamp(sceneColor * (1. - length(uv) / 2.5), 0.0, 1.0), 1.0);
    
	C1.rgb += lens * 1.;
    
    //sceneColor += lens * .3;
    //C1 = vec4(sceneColor, alpha);
    //C1 = vec4(clamp(sceneColor * (1. - length(uv) / 15.5), 0.0, 1.0), alpha);
}




void main() {    
    mainImage(); //C1 = vec4(1., 0., 1., 0.);
}
