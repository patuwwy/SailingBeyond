geometry map(vec3 p) {    
    vec3 bp = p; vec3 op = p; vec3 wp = p;
    vec4 tex = texture(B2, (bp.xz / 628. - .32));     
    float n;
    
    geometry o1, o2, o3, o4, o5, o6;
    
    o1.d = FAR;
    o2 = o3 = o4 = o5 = o6 = o1;
    
    if (bp.y < 26.) {        
        
        n = tex.r * 13.;
        //if (pattern > 12.) n *= 0.;
        //pR(p.xz, n * .1);
        p.y -= pow(abs(n), 1.4);
        o1.d = fBox2Cheap(p.xy, vec2(1e32, 3.));
        o1.mat = 2;
        o1.sp = p;

        if (o1.d < 1.) {

            float n2 = smoothstep(.02, 1., .3 + texture(B2, p.zx * .01 + p.xz * .15).g) * .7;
            p.y -= pow(n2, 2.) * 2.5 - 2.2 + tex.g * 6.9;

            //p.y -= texture(B2, p.zx * .001 + p.xz * .00211).g * .24;

            o2.d = fBox2Cheap(p.xy, vec2(1e32, 2.9)) * .2;
            o2.mat = 3;
            o2.sp = p;
        }
   } else {
        o1.d = bp.y + 1.;//- 120.;
        o2.d = o1.d;//bp.y - 20.;
   }
    
    p = bp;
    
    p.y -= 20.;
    p.z -= 92.;
    
    wp = p;
    
    if (length(wp.yz) - 1. > 1.1) {
    	o3.d = length(wp.yz) - 1.;
    } else {        
        vec3 ap = p;
        
        float i = pModInterval1(p.x, 2., -20., 26. );

        o3.d = tritun(p);
        o3.mat = 0;        
        
        p = ap;
        
        vec3 shp = s1_ob-op;

        o4 = fShip(shp);

        shp = s1_ob - op;
       
        vec3 shpX = shp;
        vec3 r1 = wp; 
        r1.x -= 59.;

        if (s1_ob.x > 59.) {
            r1.x = shp.x;
            pR(r1.xy, pow(s1_ob.x - 59., 1.4));   
        }

        o6.d = ring(r1.zxy, vec4(.5, .05, .01, .01));

        r1 = wp; 
        r1.x -= 65.;
        if (s1_ob.x > 65.) {
            r1.x = shp.x;         
            pR(r1.xy, pow(s1_ob.x - 65., 1.5)); 
pR(r1.xz, pow((s1_ob.x - 65.) * .8, 1.5)); 
        }
        
        o6.d = min(o6.d, ring(r1.zxy, vec4(.55, .05, .01, .01)));

        r1 = wp; 
        r1.x -= 70.;
        if (s1_ob.x > 70.) {
            r1.x = shp.x;     
            pR(r1.xy, pow(s1_ob.x - 70., 1.6));        
        }
        
        o6.d = min(o6.d, ring(r1.zxy, vec4(.6, .05, .01, .01)));
        o6.mat = 4;
        geometry port = o1;
        port.d = fDisc(wp.zxy + vec3(0., -86., 0.), 2.);
        port.color = vec4(0.);
        port.mirror = 1.;
        port.d = smin(port.d, o4.d + .1, .7 + noiseShort(wp * .1) * .2);
        o3 = geoU(o3, port);
        o6.d = min(o6.d, fDisc(wp.zxy + vec3(0., -86., 0.), 3.));
        o3 = geoU(o6, geoU(o3, o4)); 

        p = wp;
    }
    
    p = bp;
    //p.y -= 20.;
    p.x -= 120.;
    o5.d = FAR;// length(p) - 10.;
    o5.mat = 1;
    

    return geoU(geoU(geoU(o1, o2), o3), o5);
}

void mainImage() {
CI
    s1_ob = texelFetch(B2, ivec2(3, 0), 0).rgb;
    
    
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

    geometry tr = trace(ro, rd), otr = tr;
    
    vec3 
        sky = mix(vec3(.5, .5, .5) * 2.5, vec3(.7, .9, 1.), max(0., rd.y * 2. + .5)), 
        sceneColor = sky;
    
    vec3 light = vec3(100., 40., 100.);        
    
    vec3 sn;
           
    float alpha = 1.;

    if (tr.d < FAR) {   
        float fog = smoothstep(FAR * FOG, 0., tr.d / 6.);
        tr.hp = ro + rd * tr.d;
        alpha = tr.d / FAR * 4.;
        sn = normals(tr.hp);	

        float sh = softShadow(tr.hp, ro + light, 13.);    
        float ao = getAO(tr.hp, sn, 2.6);
      
        vec4 col = doColor(tr.hp, rd, sn, light, tr);   
     
        sceneColor = col.rgb;
        sceneColor *= sh * ao;
        
        sceneColor += texture(B2, tr.sp.xz * .025 + iTime * .04).g * .3;
        sceneColor += texture(B2, tr.sp.xz * .015 + iTime * .01).g * .6;
        sceneColor = applyFog(sceneColor, tr.d, ro, rd, sky);
        
        if (tr.mirror > 0.) {
            rd = reflect(rd, sn);
            tr.hp += rd * .02;
            tr = trace(tr.hp, rd);
            tr.hp = tr.hp + rd * tr.d;
            vec3 refl;
            if (tr.d < FAR) {
                sn = normals(tr.hp);	
                sh = softShadow(tr.hp, tr.hp + light, 13.);    
                ao = getAO(tr.hp, sn, 2.6);
                refl = doColor(tr.hp, rd, sn, light, tr).rgb * ao * sh * 2.;
            } else {
                refl = mix(vec3(.5, .5, .5) * 2.5, vec3(.7, .9, 1.), max(0., rd.y * 2. + .5));
            }
            sceneColor = mix(sceneColor, refl, otr.mirror * .75);  
        }
        //sceneColor += min(.4, noiseFF(vec2(tr.hp.yx +tr.hp.xz) * .001));
        sceneColor = mix(sceneColor, sky, otr.d / FAR);
    } else {
    	tr.d = FAR;
    }

    vec2 sunuv =  2.7*vec2( dot( normalize(light), u ), dot( normalize(light), v ) );
    vec3 lens = vec3(1.4,1.2,1.0)*(lensflare(uv *2.7, sunuv) * 1.);
    
    sceneColor *= .5;
    sceneColor += lens * .31;    


    
    C1 =  vec4(sceneColor, alpha);
        // max(vec4(0.), min(vec4(1.), c));
    
}

void loader() {
    uv = ouv; 
    //pR(uv, noiseF(uv * 40.));
    C1 = vec4(0.);
    if (abs(uv.y) < .01) {
        if (abs(uv.x) < (U[0].x / 20.)) {
            C1 = vec4(.3) - max(.0, (U[0].x - 17.)) / 3.;
        }
    }
}

void main() {
    if (U[1].y < 1.) {
        mainImage();
    } else {
        loader();
    }
    C0 = texelFetch(B0, ivec2(gl_FragCoord.xy), 0);
    C2 = texelFetch(B2, ivec2(gl_FragCoord.xy), 0);
    //C0 = vec4(1., 1., 0., 1.);
    
}
