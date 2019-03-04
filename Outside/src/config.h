#ifndef _CONFIG_H_

    #define _CONFIG_H_
    
    #define CLEANDESTROY          // destroy stuff (windows, glContext, ...)
    #ifdef DEBUG
        #define LOG_ERRORS
		#define XRES 1280
        #define YRES 720
        //#define XRES 1920
        //#define YRES 1080

    //#define SOUND_DISABLED
    #else
        //#define LOG_ERRORS
        //#define XRES 1280
        //#define YRES 720
        #define XRES 1920
        #define YRES 1080
    #endif

#endif