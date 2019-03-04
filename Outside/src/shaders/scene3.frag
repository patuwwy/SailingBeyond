vec3 lightColour = normalize(vec3(1.8, 1.0, 0.3)); 
vec3 fromRGB(int r, int g, int b) {
 	return vec3(float(r), float(g), float(b)) / 255.;   
}

bool inball = false;
vec3 
    light = vec3(0.0),
    p = vec3(0.),
    p2 = vec3(0.),
	lightDir = vec3(0.);

vec3 DE(vec3 op)
{
	vec3 p = op;
 	const float scale = 1.45;
	const float offset = 2.0;
    const int FRACTALITERATIONS = 15;
    vec3 modifier = vec3(-12.3 , -4.1, -4.1);
	p.y = -p.y;
	for(int n=0; n< FRACTALITERATIONS; n++)
	{
        p.xy = (p.x + p.y <= 0.0) ? -p.yx : p.xy;
		p.xz = (p.x + p.z <= 0.0) ? -p.zx : p.xz;
		p.zy = (p.z + p.y <= 0.0) ? -p.yz : p.zy;

        //pR(p.yz, -.003);
		p.y -= 4.1;
        pR(p.xz, 0.82915);
        
        p.yz = -p.zy * vec2(1., -1.);
        p.x -= 30.;
        pR(p.zx, -.46915);
        //p.zy = (p.z+p.y < 0.0) ? -p.yz : p.zy;
        
        //pModPolar(p.xy, 4.);
        //pR(p.xy, -.25);
        //pR(p.xz, 0.45);
		p = scale*p-offset*(scale-1.0) * modifier;
	}
 	vec3 obj;
    obj.x = length(p) * pow(scale, -float(FRACTALITERATIONS - 1)) * .2 - .001; 
	//obj.space = p;
    return obj;
}

geometry map(vec3 op) {
    vec3 p = op;
    vec3 bp = p;
   // p += 15.;
    
    vec3 r = pMod3(p, vec3(100.));
	p.x += noise_3(r.xzy) * 23.;//+ texture(B2, p.xz).r ;

    geometry obj, obj2;

    obj2.d = FAR;
    obj.d = FAR;
    obj.mat = 2;
    //for (float i = 0.; i < 6.;i += 1.) {
        //p.z += sin(i / 3. * 3.14) * 40.;
        if (inball) {
            obj.d = min(obj.d, DE(p).x);


            
           // obj2.x = min(obj2.x, fBox(p, vec3(4., 9., 1.) * 1.));
            obj2.mat = 3;


            obj = geoU(obj, obj2);
        } else {
            obj.d = min(obj.d, fSphere(p, 30. - noiseShort(p * .05 + iTime * .1) * 1.)); 
            p += 10.;
           // obj.d = min(obj.d, fSphere(p, 30.)); 
        //    obj.y = 1.;
        }
    ///}

    return obj;
}

vec3 Sky(in vec3 rd, bool showSun, vec3 lightDir)
{
/*   float v = pow(1. - max(rd.y, .0), 3.);
   vec3 sky = mix(fromRGB(0, 136, 254), vec3(.1, .2, .3), v);
   return clamp(sky + noiseShort(rd * 4.), 0.0, 1.0);
*/

    return noiseShort(rd * 2.) * vec3(1., .5, .3) * 2.;

}


void mainImage() {
CI 
    //lightColour = normalize(fromRGB(133,7,142)) * 2.; 
    
    uv = ouv * .5;
    
    /*
    if (abs(uv.y) > .35) {
     	fragColor *= 0.;
        return;
    }*/
    uv *= 1.;

    //uv.y *= 1.2;
    //vol = texture(iChannel0, vec2(.5, .25)).r  * 4.; 
    float t2 = keyTime.g - 35.;
    float 
        //sk = iTime + 13.,//- sin(-t2 * .01 + 1.3) * 66.0, 
        //ck = cos(t2 * .03 + 1.) * 162.0,
        
        mat = 0.;
    
    //uv.x *= 1. + abs(cos(uv.y)) / 2.; // fisheye
    
    light = vec3(0., 17., 100.);        
    lightDir = light;
    
    
    vec3 
        vuv = vec3(sin(keyTime.g / 10.) * .3, 1., sin(keyTime.g / 10.) * .3), // up
    	ro = texelFetch(B2, ivec2(0, 0), 0).rgb;
    //ro -= 120.;

    vec3
        vrp = texelFetch(B2, ivec2(2, 0), 0).rgb,
		
    	vpn = normalize(vrp - ro),
    	u = normalize(cross(vuv, vpn)),
    	v = cross(vpn, u),
    	vcv = (ro + vpn),
    	scrCoord = (vcv + uv.x * u * 16./9. + uv.y * v),
    	rd = normalize(scrCoord - ro);
	
    vec3 sceneColor = vec3(0.);
    
	
    geometry tr = trace(ro, rd), otr;    
    
    float fog = smoothstep(FAR * FOG, 0., tr.d);
    tr.hp = ro + rd * tr.d;
    
    otr = tr;

    

    vec3 sky = Sky(rd, true, normalize(light)) * 1.;
   // vec3 skyNoSun = Sky(rd, false, normalize(light)) * 1.;
    
    float alpha = 1.;
    if (tr.d < FAR) { 
        //alpha;
        vec3 sn = normals(tr.hp);	
    
        float sh = softShadow(tr.hp, tr.hp + light, 3.);
    
        //float ao = getAO(tr.hp, sn, 15.2);
        sceneColor += 0.2;
        

        vec3 bcol = vec3(0.);

        tr.hp += rd;
        inball = true;
        if (tr.d > 0.) {
            
            rd = refract(rd, sn, 1. - min(1., tr.d / 100.));            
            bcol = vec3(1., .5, .0) * pow(abs(fbm(sn * 1.)) * 2.3, 7.) *1.3;
            
            //3light.x += fbm(rd) * 10.;
            bcol += pow(max(0., dot(rd, normalize(light))) * 1.1, 23.) * .1;
            
            
            tr = trace(tr.hp, rd);
            tr.hp += tr.d * rd;
        } else {
            tr = trace(ro, rd);
            tr.hp = ro + tr.d * rd;
            alpha = tr.d / FAR;
        }
        
        if (tr.d < FAR) {
        	//sn = normals(tr.hp);
            sceneColor += vec3(1., .5,  .0) / abs(tr.d) * 15.;// * abs(sn);
            sceneColor += mix(sceneColor, sky, clamp(otr.d / FAR, 0., 1.));
        } else {
           // sceneColor += sky;
            sceneColor += mix(sceneColor, sky, clamp(otr.d / FAR, 0., 1.));
        }

        sceneColor += bcol;

    } else {
        //sky += fbm(rd * 2. + rd.zxy * 2.) * vec3(1., 0.5, 1.);// + fbm(rd * 12.);// * fract(iTime);
        sceneColor = sky;
    }

    sceneColor += pow((float(otr.i) / 120.), 1.3) ;
    //sceneColor = mix(sceneColor, sky, clamp(otr.d / 500., 0., 1.));
    //sceneColor *= vec3(1., 1.7, 2.4);
    C1.rgb = sceneColor;
    C1.a = alpha;
    C1.rgb *= .6;
}


void main() {    
    mainImage(); //C1 = vec4(1., 0., 1., 0.);

}
