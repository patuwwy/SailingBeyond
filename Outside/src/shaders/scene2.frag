float yC(float x) {
 	return cos(x * -.0134) * 2. * sin(x * .13) * 15. ;//+ fbm(vec3(x * .1, 0., 0.) * 55.4);
}
geometry map(vec3 p) {
    p.x -= yC(p.y * .1) * 3.;
    p.z += yC(p.y * .01) * 4.;
    
    float n = pow(abs(fbm(p * .06 + vec3(0., iTime * 0.14, 0.))) * 12., 1.3);
    float s = fbm(p * 0.01 + vec3(0., iTime * 0.14, 0.)) * 128.;
    
    geometry obj;
  
    obj.d = 0.;
    obj.d = max(obj.d, -fCylinder(p, s + 18. -n, 1e9));
    p.x -= sin(p.y * .02) * 34. + cos(p.z * 0.01) * 62.;
    obj.d = max(obj.d, -fCylinder(p, s + 28. + n * 2. , 1e9)) * .8;
    
    //obj.material = vec2(2., 0.);
    //obj.space = p;
    
    return obj;
}


void mainImage() {
CI    
    uv = ouv * .5; 


    uv *=2.;
    
    vec3 
        vuv = normalize(vec3(cos(iTime * .4), sin(iTime * .4), sin(iTime * .4)));

   	vec3 ro  = vec3(0., 30. + iTime * 40., -.1);

    ro.x += yC(ro.y * .1) * 3.;
    ro.z -= yC(ro.y * .01) * 4.;
    
    vec3 vrp =  vec3(0., 50. + iTime * 100., 2.);
    
    vrp.x += yC(vrp.y * .1) * 3.;
    vrp.z -= yC(vrp.y * .01) * 4.;
    
    vec3
		vpn = normalize(vrp - ro),
    	u = normalize(cross(vuv, vpn)),
    	v = cross(vpn, u),
    	vcv = (ro + vpn),
    	scrCoord = (vcv + uv.x * u * 16./9. + uv.y * v),
    	rd = normalize(scrCoord - ro),
        oro = ro;
	
    vec3 sceneColor = vec3(0.);

    geometry tr = trace(ro, rd);
    
    tr.hp = ro + rd * tr.d;
    
    vec3 col = vec3(1., 0.5, .4) * fbm(tr.hp.xzy * .01) * 20.;
    col.b *= fbm(tr.hp * .01) * 10.;  
    float alpha = tr.d/FAR;
    
    sceneColor *= 1. + .9 * (abs(fbm(tr.hp * .002 + 3.) * 10.) * (fbm(vec3(0., 0., iTime * .05) * 2.)) * 1.);
    sceneColor = pow(sceneColor, vec3(1.));
    
    vec3 steamColor1 = vec3(.0, .4, .5);
	vec3 rro = oro;
    
    ro = tr.hp;
    //sceneColor *= 0.;
    float distC = tr.d, f = 0., st = .9;
    
    for (float i = 0.; i < 24.; i++) {       
        rro = ro - rd * distC;
        f += fbm(rro * vec3(.1, .1, .1) * .3) * .1;
        distC -= 3.;
        if (distC < 3.) break;
    }
 sceneColor += min(.8, float(tr.i) / 130.) * col + col * .01;
    sceneColor += steamColor1 * pow(abs(f * 1.5), 3.) * 5.;
    sceneColor = pow(sceneColor, 1. / vec3(1.4)) * .6;//steamColor1 * pow(abs(f * 1.5), 3.) * 5.;
    C1 = vec4(clamp(sceneColor, 0.0, 1.0), alpha) * 1.2;
    //C1 = pow(abs(C1 + tr.d * 0.001), vec4(.8)) * .4;
    
}

void main() {
    mainImage();
    //C1 = texelFetch(B2, ivec2(gl_FragCoord.xy), 0).gggg;
    //C0 = vec4(1., 1., 0., 1.);
}
