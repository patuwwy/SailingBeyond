int X;

#define PATTERN_TIME 5.485714


void main() {
    
    ivec2 store = ivec2(gl_FragCoord.xy);
	uv = gl_FragCoord.xy / U[0].yz;   
    
    C2 = vec4(0.0);

    float ck = cos(iTime * .1) * .1;
    int index = 0;

    if (store.y != 0 || store.x > 10) {        
        if (U[1].x < 10.) {
            C2.r = noiseLayers(vec3(uv * 10., 2.));
            C2.g = noiseFF(uv * 6.);
        } else {
            discard;
        }
    } else {
            
        // calculate time in following timeline

        // R = normalize time
        // G = scene time

        vec3 keyTime = vec3(0.);

        vec2 T[] = vec2[](
            vec2(0., 0.),
            vec2(PATTERN_TIME, 1.),
            vec2(PATTERN_TIME * 8., 1.),
            vec2(PATTERN_TIME * 9., 1.),
            vec2(PATTERN_TIME * 10., 1.),
            //vec2(PATTERN_TIME * 12., 1.),
            vec2(PATTERN_TIME * 12., 1.),
            //vec2(PATTERN_TIME * 13., 1.),
            //vec2(PATTERN_TIME * 20., 1.),
            //vec2(PATTERN_TIME * 22., 1.),
            vec2(PATTERN_TIME * 22., 1.), 
            vec2(PATTERN_TIME * 28., 1.),
            vec2(PATTERN_TIME * 32., 1.),
            vec2(PATTERN_TIME * 230., 1.)
        );

        for (int i = 0; i < T.length() - 1; i++) {
            if (T[i + 1].x > iTime) {
                float st = iTime - T[i].x;
                keyTime.g = st;
                keyTime.r = (st / (T[i + 1].x - T[i].x)) * T[i].y;
                keyTime.b = mod(iTime, PATTERN_TIME);
                break;
            }
        }

        vec3 s1_ob = vec3(iTime * 2. - 40., 20., 92.);// + vec3(0., + (iTime - 50) * .1, 0.);    
        if (iTime > PATTERN_TIME * 12.) s1_ob = vec3(- keyTime.g * 28., 0., 0.);    
        if (iTime > PATTERN_TIME * 22.) s1_ob = vec3(138., 24.5 , iTime + 1020 + keyTime.r * 3.);

        
        switch(store.x) {
            case 0:
                vec4[] CAMS = vec4[](
                    vec4(0., iTime - 15., 20., 91.2),
                    vec4(PATTERN_TIME * 3., iTime - 15., 22., 91.2),
                    vec4(PATTERN_TIME * 7., iTime * 2. - 38., 19.9, 91.3),

                    vec4(PATTERN_TIME * 8., iTime * 2. - 38., 19.9, 91.3),

                    vec4(PATTERN_TIME * 10., iTime * 2. - 38. - keyTime.g, 19.9 , 91.3),
                  
                    vec4(PATTERN_TIME * 12., -1. - keyTime.g * 27., 2.,-1.),
                    vec4(PATTERN_TIME * 13., 6. - keyTime.g * 28, 4., 5.),                    
                    //vec4(PATTERN_TIME * 13., -3. - keyTime.g * 27 - 3., 1., -4.),                    
                    vec4(PATTERN_TIME * 14., -3. - keyTime.g * 27 - 13., 20., -10.),    
                    vec4(PATTERN_TIME * 15., 21. - keyTime.g * 29. ,  3., 11.),
                    vec4(PATTERN_TIME * 16, 21. - keyTime.g * 29. , 4., 1.),
                    vec4(PATTERN_TIME * 18., -33.  - keyTime.g * 27., 4., -4.),
                    vec4(PATTERN_TIME * 20., -iTime * 2., 53., 1200.),
                    vec4(PATTERN_TIME * 21., -iTime * 1., 33., 1200.),
                    vec4(PATTERN_TIME * 22., 149., 38.5 , iTime + 1020.),
                    vec4(PATTERN_TIME * 24., 139., 24.5 , iTime + 1020.),
                    vec4(PATTERN_TIME * 32., keyTime.g * .25 - 30., 0., keyTime.g * 1.2),
                    //vec4(PATTERN_TIME * 22., 139., 27.5 , iTime + 1020.),
                    vec4(1e9)
                );
                
                for (int i = 0; i < (CAMS.length() - 1); i++) {
                    if (CAMS[i + 1].x > iTime) {
                        C2.rgb = CAMS[i].yzw;     
                   
                        break;
                    }
                }
                
                break;
            case 2:
                vec4[] LAT = vec4[](
                    vec4(0., iTime + 30., 20., 91.2),
                    vec4(PATTERN_TIME * 3., iTime + 30., 10., 91.2),
                    vec4(PATTERN_TIME * 7., s1_ob),
                    //vec4(PATTERN_TIME * 7., s1_ob),
                     vec4(PATTERN_TIME * 12., s1_ob),
                     //vec4(PATTERN_TIME * 18., vec3(-iTime * 2., 43., 1300.) + vec3(-80., -40., 40.)),
                    vec4(PATTERN_TIME * 20., vec3(-iTime * 2., 43., 1300.) + vec3(80., -40., 40.)),
                vec4(PATTERN_TIME * 21., vec3(-iTime * 2., 43., 2100.) - vec3(-20., 190., 0.)),
                    //vec4(PATTERN_TIME * 22., 137., 25. , iTime + 1040.),
                    vec4(PATTERN_TIME * 22., 137., 25. , iTime + 1040.),
                    vec4(PATTERN_TIME * 24., 137., 25. , iTime + 1040.),
                    vec4(PATTERN_TIME * 32., keyTime.g * .2, 0., keyTime.g - 10.),
                    vec4(1e9)
                );

                for (int i = 0; i < (LAT.length() - 1); i++) {
                    if (LAT[i + 1].x > iTime) {
                        C2.rgb = LAT[i].yzw;
                        break;
                    }
                }
                
                break;

// object position scene 1            

            case 3:
                C2.rgb = s1_ob;
                break;

// time

            case 4:

                C2.rgb = keyTime;
                break;
// fade 
            case 5:
                
                vec4 K[] = vec4[](
                    
                    vec4(0., 0., 1., 0.01),
                    vec4(0.02, 0., 0., 0.9),
                    //vec4(1., 1., 0., 1.),
                    //vec4(2., 1., 0., 1.),
                    //vec4(4., 0, 1., 1.),
                    //vec4(6., 0., 0., 1.),
                    vec4(PATTERN_TIME * 3 - 2., 0., 1., 2.),
                    vec4(PATTERN_TIME * 3., 0., 0., 1.),
                    vec4(PATTERN_TIME * 12 - 2., 1., 1., 2.),
                    vec4(PATTERN_TIME * 12, 1., 0., .5),
vec4(PATTERN_TIME * 13 - .5, 0., 1., .5),
vec4(PATTERN_TIME * 13, 0., 0., .5),
                    vec4(PATTERN_TIME * 14 - .5, 0., 1., .5),
                    vec4(PATTERN_TIME * 14, 0., 0., .5),
vec4(PATTERN_TIME * 15 - .5, 0., 1., .5),
vec4(PATTERN_TIME * 15, 0., 0., .5),
                    vec4(PATTERN_TIME * 16 - .5, 1., 1., .5),
                    vec4(PATTERN_TIME * 16, 1., 0., .5),
                    vec4(PATTERN_TIME * 18 - .5, 0., 1., .5),
                    vec4(PATTERN_TIME * 18, 0., 0., 5.),
                    vec4(PATTERN_TIME * 20 - 2., 0., 1., 2.),
                    vec4(PATTERN_TIME * 20, 0., 0., .5),
                    vec4(PATTERN_TIME * 21 - .5, 0., 1., .5),
                    vec4(PATTERN_TIME * 21, 0., 0., .5),
                    vec4(PATTERN_TIME * 22 - .5, 0., 1., .5),
                    vec4(PATTERN_TIME * 22, 0., 0., .5),
 vec4(PATTERN_TIME * 24 - .5, 0., 1., .5),
                    vec4(PATTERN_TIME * 24, 0., 0., .5),
                    vec4(PATTERN_TIME * 28 - 4., 1., 1., 4.),
                    vec4(PATTERN_TIME * 28, 1., 0., 1.),
                    vec4(PATTERN_TIME * 32 - 4., 1., 1., 4.),
                    vec4(PATTERN_TIME * 32, 1., 0., 1.),
                    vec4(PATTERN_TIME * 40 - 8., 0., 1., 8.),
                    vec4(PATTERN_TIME * 44 - 4, 1., 1., 4.),
                    vec4(PATTERN_TIME * 99, 0., 1., 1.),
                    //vec4(PATTERN_TIME * 32 + 3., 1., 0., 4.5),
                    vec4(120, 0., 0., 1.)
                );

                for (int i = 1; i < K.length() - 1; i++) {
                    if (K[i + 1].x > iTime) {
                        vec4 WB = K[i];
                        WB.z = mix(K[i - 1].z, K[i].z, min(1., (iTime - K[i].x) / K[i].w));
                        C2 = WB;
                        break;
                    }
                }
                break;
// postproc
            case 6:
                vec4 PP[] = vec4[](
                    // time, g - alpha factor, r - bloom. b - pixel index;
                    
                    vec4(0., 1., 1., 1.),
                    //vec4(PATTERN_TIME * 12, 1., 1., 1.),
                    vec4(PATTERN_TIME * 12, 3., 1., 2.),
                    vec4(PATTERN_TIME * 20., 0., 0., .0),
                    vec4(PATTERN_TIME * 28, 1., 1.0, 1.0),
                    vec4(PATTERN_TIME * 32, 0., 0., 0.0),       
                    vec4(1e2, 0., 0., .0)
                );
                for (int i = 0; i < (PP.length() - 1); i++) {
                    if (PP[i + 1].x > iTime) {
                        C2.rgb = PP[i].yzw;
                        break;
                    }
                }
                C2.a = 1.;
                if (iTime > PATTERN_TIME * 12. && iTime < PATTERN_TIME * 28.) C2.a = 0.;

                break;
            default:
                discard;
                break;
        }

    }

    
        
    
    
    
//    C0.a = fract(iTime);
}
