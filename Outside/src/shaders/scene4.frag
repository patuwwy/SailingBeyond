vec3 fromRGB(int r, int g, int b) {
 	return vec3(float(r), float(g), float(b)) / 255.;   
}

vec3 
    light = vec3(0.0),
    p = vec3(0.),
    p2 = vec3(0.),
	lightDir = vec3(0.);


vec3 lightColour = normalize(vec3(1.8, 1.0, 0.3)); 

geometry DE(vec3 np, float c)
{
    vec3 p = np;
    //p.x -=36.;
  //  p.y -=59.;
    
 	const float scale = 2.7;
	const float offset = 9.;
    const int FRACTALITERATIONS = 10;
    vec3 modifier = vec3(19.3, -3., 3.2);// vec3(sin(t), sin(t / 2.), 0.);
    //p += noiseShort(p * .1) * 4.5;
    //p += fbm(p * .4) * 5.;
    
	for(int n=0; n< FRACTALITERATIONS; n++)
	{
        
        p = abs(p);
        
		p.xy = (p.x - p.y < 0.0) ? p.yx : p.xy;
		//p.xz = (p.x - p.z < 0.0) ? p.zx : p.xz;
		p.zy = (p.y - p.z < 0.0) ? p.yz : p.zy;

        p.x += 80. ;//+ fbm(vec3(iTime)) * 10.;
        pR(p.xy, .725 );
        p.zy += 22.;//+ sin(t) * 3.1;
        
        p.xyz = scale* p.xyz - offset*(scale - .3) * modifier.xyz;
       
	}
 	geometry obj, obj2;
     
    obj.d = //fSphere(p, 172.)
        fBox(p, vec3(1e2 , 1e2, 1.)) 
* (pow(scale, -float(FRACTALITERATIONS))); 
	obj.mat = -1;
    
   // obj2.dist = length(p) - 30.;
    //obj2.material = vec2(2., 0.);
    obj.sp = p;
    return obj;
}

// Repeat in two dimensions
float intube = 0.;
geometry map(vec3 p) {
    //p.y += sin(p.x * 0.02) * 13.;
    vec3 bp = p;
    bp.zyx = mod(bp.zyx, vec3(150., 150., 50.)) - vec3(75., 75., 25.);
    //pMod3(bp.zyx, vec3(75., 75., 25.));
    geometry obj, sh, tub;

   // bp.yz *= 1. + abs(fbm(p.xxx * .01) * 12.);
/*
    tub.d = length(p.zy) - 7. + noiseShort(p * .2);
    if (tub.d < 0.) intube = max(intube, -tub.d * .4);
*/
    //bp += 1.;
//pR(bp.zx, noiseShort(p * .2 + 10.) * .2);
//bp.y += noiseShort(bp * .1) * 10.;
    obj = DE(bp, 2.3);
    obj.d = max(obj.d, -length(p.zy) + 8.);
    obj.color = vec4(1., .5, .0, 1.);
        
    obj.mirror = 0.;
    obj.sp = bp;
    
    sh = fShip((s1_ob - p) * vec3(-1., 1., 1.) * .1) ;
    sh.d *= 10.;
    //sh.d = length(p - s1_ob) - 30.;//fShip(p - s1_ob);
    
    return geoU(obj, sh);
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
s1_ob = texelFetch(B2, ivec2(3, 0), 0).rgb;
    uv = ouv * .5;
    if (abs(uv.y) > .4) {
        discard;
        return;
    }
    
    uv *= 3.;
    //uv *= tan(radians (FOV) / 2.0) * 1.1;

    float t2 = iTime - 35.,
        sk = sin(-t2 * .4) * 6.0, 
        ck = cos(-t2 * .4) * 2.0,
        
        mat = 0.;
    
    vec3 ro = texelFetch(B2, ivec2(0, 0), 0).rgb, oro = ro;

    vec3 lp = vec3(.0, 0., ro);        

    light =+ro;
        vec3 
        vuv = vec3(0., 1., 0.);//, // up
    	//ro = vec3(140. - iTime * 2., 49., 510.); // pos
    
    vec3
        vrp =  texelFetch(B2, ivec2(2, 0), 0).rgb, // lookat    */
		
    	vpn = normalize(vrp - ro),
    	u = normalize(cross(vuv, vpn)),
    	v = cross(vpn, u),
    	vcv = (ro + vpn),
    	scrCoord = (vcv + uv.x * u * 16./9. + uv.y * v),
    	rd = normalize(scrCoord - ro), ord = rd;
	
    vec4 sceneColor = vec4(0.);
    
    
	
    geometry tr = trace(ro, rd), otr = tr;    
    
    
    
    //
    
    float 
        ao = 1.,  alpha = 1., sh = 0.;
    tr.hp = ro + rd * tr.d;
    otr = tr;
    if (tr.d < FAR) { 
        
        
    
        vec3 sn = normals(tr.hp), osn = sn;
        otr = tr;

        
        sceneColor += doColor(tr.hp, rd, sn, lp, tr) / length(tr.hp.zy) * .1;
        sh = softShadow(tr.hp, s1_ob + vec3(10., 0.,10.), 12.5);
       // sceneColor *= sh;

        //sceneColor = mix(sceneColor, vec4(0.), saturate(tr.d * 1. / FAR));
        
        ao = getAO(tr.hp, sn, 3.1);
        alpha = distance(s1_ob, tr.hp) * .02;
        sceneColor *= ao * sh;
        if (tr.mirror > 0.) {
            rd = reflect(rd, sn);
            tr = trace(ro, rd);
            tr.hp = ro + rd * tr.d;
            vec3 refl;
            if (tr.d < FAR) {
                sn = normals(tr.hp);	
                sh = softShadow(tr.hp, ro + lp, 13.);    
                
                refl = doColor(tr.hp, rd, sn, lp, tr).rgb * ao * sh;
                refl = mix(sceneColor, vec4(.1), clamp(otr.d / 210., 0. ,1.)).rgb;
            } else {
                refl = mix(vec3(.5, .5, .5) * 2.5, vec3(.7, .9, 1.), max(0., rd.y * 2. + .5));
            }
            sceneColor.rgb = mix(sceneColor.rgb, refl, otr.mirror);  
            sceneColor.rgb *= cross(ord, -osn);       
        }

        

         
    } else {
    	tr.d = FAR;
        alpha = 1.;
    }


    float flareDist = 1e9, camFlareDist= 1e9;
    vec3 flareCol = vec3(0.), flareCol_B = vec3(0.);
    float ti = keyTime.g;
    for (float k = 0.; k < 128.; k++) {
        vec3 flarePos = 
            vec3(
                 sin(k / 32.) * 60. + s1_ob.x - 30.,
                -cos(k / 6. - ti / 2.) * sin(k - k * 0.1 + sin(ti / 13.) * 2.) * 15.,
                cos( ti /  3. + k / 12.) * (sin(ti * .2+ k) / 2. + .8) * 15.
            );
		
        flareDist = min(distance(tr.hp, flarePos), flareDist); 
        camFlareDist = min(distance(ro, flarePos), camFlareDist);
        if (tr.d > distance(flarePos, ro)) {
            flareCol_B += abs(vec3(1., 0.2, 0.) * pow(max(0., dot(normalize(-ro + flarePos) * 0.99, rd) * 1.01), 1e3) * .04);
            flareCol += abs(vec3(1., .2, 0.) * pow(pow(max(0., dot(normalize(-ro + flarePos), rd)), 1e5 - distance(ro, flarePos) * 140.) / distance(ro, flarePos) * 100., 3.));// * abs(sin(iTime + k)) * 13.;
            alpha = tr.d / FAR;// > distance(flarePos, ro);
        }
        
    }
    if (flareCol.r < .0) {
        tr.d = camFlareDist;//.7 * 210.;
        //alpha = 0.;
    }
    
    flareCol += flareCol_B;
    //sceneColor  += noiseShort(rd);
    sceneColor += pow(vec4(1., 0.2, 0., 0.) / (flareDist / 4.), vec4(1.3)) * 1.;
    sceneColor *= ao; 
    sceneColor = mix(sceneColor, vec4(.1), clamp(otr.d / 210., 0. ,1.)); 
        vec3 clight = vec3( s1_ob ) - vec3(24., 0., 0.);
        //clight.x -= 4.;
    /*
    
    if (distance(oro, otr.hp) > distance(clight, otr.hp)) {

        vec2 sunuv =  vec2( dot( normalize(clight), u ), dot( normalize(clight), v ) );
	    vec3 lens = max(vec3(0.), (lensflare(uv * 4., sunuv * vec2(.1, 1.1)) * 1.));
    
            sceneColor.rgb += lens;
    }*/
    //sceneColor += pow(intube * .3, 4.);
    sceneColor.rgb = pow(sceneColor.rgb, 1./vec3(1.4));
    C1 = vec4(clamp(sceneColor.rgb * (1. - length(uv) / 2.5), 0.0, 1.0), alpha);
	C1.rgb += pow(flareCol * 2., vec3(0.5)) * 0.4;
    
	//C1 = vec4(sh);
}




void main() {    
    mainImage(); //C1 = vec4(1., 0., 1., 0.);
}
