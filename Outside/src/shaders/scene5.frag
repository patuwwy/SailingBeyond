
geometry map(vec3 p) {
    
    vec3 bp = p, p2 = p;
    float n = noiseFF(p.zx * .001 - .21) * 20.;//+ noiseFF(p.xz * .004) * 3.;
    
    geometry o, obj, obj2, ship;
    o.d = FAR;
    o.mirror = 0.;

    obj2 = obj = o;
   
    //n -= texture(B1, bp.xz * .01).r * 10.;
    n -= noiseFF(p.xz * 0.01) * 3.3;
    n -= pow(max(0., sin(noiseFF(p.zx * 0.04))) * 1.5, 2.);
    n -= noiseFF(p.xz * 0.01 / n ) * 3.3;
    p.y += pow(abs(sin(n) + n) - 3., 2.5) * .1 - 20.;
    
    obj.d = fBox2Cheap(p.xy, vec2(1e9, 4.)) * 1.;
    
    obj.color = vec4(1., .5, .5, 0.);

    obj.sp = bp;
    //obj.d *= .5;
    bp -= vec3(137., 23. , iTime + 1150.);
    //bp.y -= 40.;
    //pMod1(bp.x, 1.);
//bp.x *=-1.;
bp.y -= 1.5;
    bp.x += 6.;
    obj.d = min(obj.d, trits(bp));
    //s1_ob -= p2;
    
    vec3 sh = (s1_ob - p2).zyx;
    ship = fShip(sh);
ship.d *= .7;
    obj = geoU(obj, ship);
    return obj;
}




float ss(vec3 ro, vec3 lp, float k) {
    const int maxIterationsShad = 18;
    vec3 rd = lp;// - ro); // Unnormalized direction ray.

    float shade = 1.;
    float dist = 2.01;
    float end = max(length(rd), 0.01);
    float stepDist = end / float(maxIterationsShad);

    rd /= end;
    for (int i = 0; i < maxIterationsShad; i++) {
        float h = map(ro + rd * dist).d;
        //shade = min(shade, k*h/dist);
        shade = min(shade, smoothstep(0.0, 1.0, k * h / dist)); 
        dist += min(h, stepDist * 2.); 
        if (h < 0.001 || dist > end) break;
    }
    return min(max(shade, 0.0), 1.0);
}

vec4 Sky(in vec3 rd, bool showSun, vec3 lightDir, vec3 ro)
{
   
    float sunSize = .0;
    float sunAmount = max(dot(rd, normalize(lightDir)), 0.1);
    float v = pow(1. - max(rd.y, 0.0), 2.);
    vec4 cl = vec4(0.2, .0, 0., 1.) * 1.;//fromRGB(0,136,254);
    //cl.b *= sin(p.z * 0.3);
    vec4 sky = mix(cl, vec4(0.6, .5, 0.5, 1.), v);
 	
    vec4 lightColour = vec4(1., .5, 0.0 ,0.);
    
    sky += 1. * cl * sunAmount * sunAmount + lightColour * min(pow(sunAmount, 1222.0) * sunSize, sunSize);
    //sky += vec3(0., 0., 0.) * max(0.,rd.y);
    return clamp(sky, 0.0, 1.0) ;//+ clouds(rd, ro).rgba * 2.;
}

vec4 doColor2( in vec3 sp, in vec3 rd, in vec3 sn, in vec3 lp, geometry obj) {
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
    float spec = pow(max(dot(reflect(-ld, sn), -rd), 1.), 5.5);

    // Coloring the object. You could set it to a single color, to
    // make things simpler, if you wanted.
    vec4 objCol = getObjectColor(sp, sn, obj);
    //spec *= abs(noiseF(obj.s.xz * .1));
    // Combining the above terms to produce the final scene color.
    sceneCol += obj.color * (diff + .15) + spec * .05;// * atten;
	sceneCol.a = objCol.a;
    // Return the color. Done once every pass... of which there are
    // only two, in this particular instance.
    
    return sceneCol;
}

void mainImage() {
CI 
s1_ob = texelFetch(B2, ivec2(3, 0), 0).rgb;
    //uv *= 1.8;
    vec3 ro = texelFetch(B2, ivec2(0, 0), 0).rgb;

    float t2 = iTime - 35.;
    
    float 
        sk = sin(-t2 * .4) * 32.0, 
        ck = cos(-t2 * .4) * 32.0;
    
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
    	rd = normalize(scrCoord - ro);        
	
    vec3 gr1 = vec3(44., 76., 124.) / 255.;
    vec3 gr2 = vec3(190., 90., 40.) / 255.;
    
    geometry tr = trace(ro, rd), otr = tr;;
    
    
    float fog = smoothstep(FAR * FOG, 0., tr.d / 6.);
    tr.hp = ro + rd * tr.d;
    
    vec3 lp = (vec3(100., 170., 100.)) + ro;
    vec3 sky = Sky(rd, true, lp, ro).rgb;
    vec3 sceneColor = sky;

    float alpha = 0.;
    
    if (tr.d < FAR) {
        vec3 sn = normals(tr.hp);	
    
    	float sh = ss(tr.hp, lp, 6.);
    	//float ao = getAO(tr.hit, tr.sn, 20.1);
        
        vec4 col = doColor2(tr.hp, rd, sn, lp * 1. + ro, tr) * 1.;
        
        sceneColor = col.rgb;
        sceneColor = mix(sceneColor * .3, sceneColor, smoothstep(0., 1., sh * .5)); 

        if (tr.mirror > 0.) {
            rd = reflect(rd, sn);
            tr = trace(ro, rd);
            tr.hp = ro + rd * tr.d;
            vec3 refl;
            if (tr.d < FAR) {
                sn = normals(tr.hp);	
                sh = softShadow(tr.hp, ro + lp, 13.);    
                
                refl = doColor2(tr.hp, rd, sn, lp, tr).rgb * sh;
            } else {
                refl = mix(vec3(.5, .5, .5) * 2.5, vec3(.7, .9, 1.), max(0., rd.y * 2. + .5));
            }
            sceneColor = mix(sceneColor, refl, otr.mirror);  
        }
        //sceneColor = mix(sceneColor * .0, sceneColor, smoothstep(0., 1., ao * 1.)); 
        sceneColor += noiseFF(reflect(rd, sn).xz * .001) * 13.;
        sceneColor = mix(sceneColor, sky, tr.d/FAR);       
    } else {
        vec3 rd2 = rd;
//pR(rd2.xz, fbm(rd * 10.));
        //sceneColor += pow(max(0., fbm(rd2.xzy * 2.) + .5) * 1., 1.) * .8;
        sceneColor += pow(stars(rd), vec3(1.)) * 1.;

         
    	//tr.d = FAR;
    }
    
    vec3 clight = lp ;
    vec2 sunuv =  2.7*vec2( dot( normalize(clight), u ), dot( normalize(clight), v ) );
	vec3 lens = vec3(2.0) * max(vec3(0.), (lensflare(uv * 4., sunuv) * 1.));
    
    sceneColor += lens;

    C1 = vec4(sceneColor, 1.);
    //C1 = pow(C1, vec4(1.2));
    //C1.a = 0.;//alpha;
}


void main() {    
    mainImage(); 
//C1 = vec4(1., 0., 1., 0.);
}
