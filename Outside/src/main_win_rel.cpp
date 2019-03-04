#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>
#include <mmsystem.h>
//#include <mmreg.h>

#include "intro.h"
#include "clinkster.h"
#include "config.h"
#include <thread>

//extern float ClinksterTrigg;

static const PIXELFORMATDESCRIPTOR pfd = {
    sizeof(PIXELFORMATDESCRIPTOR), 1, PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER, PFD_TYPE_RGBA,
    32, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 32, 0, 0, PFD_MAIN_PLANE, 0, 0, 0, 0 };

static DEVMODE screenSettings = { {0},
    #if _MSC_VER < 1400
    0,0,148,0,0x001c0000,{0},0,0,0,0,0,0,0,0,0,{0},0,32,XRES,YRES,0,0,      // Visual C++ 6.0
    #else
    0,0,156,0,0x001c0000,{0},0,0,0,0,0,{0},0,32,XRES,YRES,{0}, 0,           // Visuatl Studio 2005
    #endif
    #if(WINVER >= 0x0400)
    0,0,0,0,0,0,
    #if (WINVER >= 0x0500) || (_WIN32_WINNT >= 0x0400)
    0,0
    #endif
    #endif
    };

#ifdef __cplusplus
extern "C" 
{
#endif
int  _fltused = 0;
#ifdef __cplusplus
}
#endif

void music()
{
    Clinkster_GenerateMusic();    
}

//----------------------------------------------------------------------------

void entrypoint( void )
{
    // full screen
    if( ChangeDisplaySettings(&screenSettings,CDS_FULLSCREEN)!=DISP_CHANGE_SUCCESSFUL) return;
    ShowCursor( 0 );
    // create window
    //HWND hWnd = CreateWindow( "static",0,WS_POPUP|WS_VISIBLE,0,0,XRES,YRES,0,0,0,0);
    HWND hWnd = CreateWindow( (LPCSTR)0xC018,0,WS_POPUP|WS_VISIBLE,0,0,XRES,YRES,0,0,0,0);
    if( !hWnd ) return;
    HDC hDC = GetDC(hWnd);
    // initalize opengl
    if( !SetPixelFormat(hDC,ChoosePixelFormat(hDC,&pfd),&pfd) ) return;
    wglMakeCurrent(hDC,wglCreateContext(hDC));
    //setFont(hDC);
    // init intro
    intro_pre_init();
    intro_init();

    //intro_do(0);
    //wglSwapLayerBuffers(hDC, WGL_SWAP_MAIN_PLANE); 
    //intro_do(0);
    //wglSwapLayerBuffers(hDC, WGL_SWAP_MAIN_PLANE);

    CreateThread(0, 0, (LPTHREAD_START_ROUTINE)music, 0, 0, 0);
   // music();
	//musicStarted = true;
	//Sleep(20000);
	//Clinkster_StartMusic();

    float t = 0;
	float start_time = timeGetTime();
	BYTE stage;
	float maxT = 1e9;
    do 
    {       
	    //maxT = Clinkster_MusicLength / Clinkster_TicksPerSecond;
		t = (timeGetTime() - start_time) / 1000.;// +5.485714 * 31.5;

		if (!musicStarted && t > 20) {
			Clinkster_StartMusic();
			maxT = Clinkster_MusicLength / Clinkster_TicksPerSecond;
			musicStarted = true;
		}

		if (musicStarted) 
		{
			t = Clinkster_GetPosition() / Clinkster_TicksPerSecond;// +5.485714 * 32.;
		}

        intro_do(t);
        wglSwapLayerBuffers(hDC, WGL_SWAP_MAIN_PLANE);        
    } while (!GetAsyncKeyState(VK_ESCAPE) && t < maxT);

    #ifdef CLEANDESTROY
    sndPlaySound(0,0);
    ChangeDisplaySettings( 0, 0 );
    ShowCursor(1);
    #endif

    ExitProcess(0);
}
