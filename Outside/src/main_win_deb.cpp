#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>

#include <mmsystem.h>

#include <GL/gl.h>
#include <string.h>
#include <stdio.h>

#include "intro.h"
#include "ext.h"
#include "config.h"

///#include "vendor/GL/glew.h"
//#include "wglext.h"


//#include "vendor/imgui/imgui.h"


#include "Outside/debug/bass.h"

#include <iostream>
#include <thread>

extern int font_list_base_2d;

//BASS
//==============================================================================================
HSTREAM hWav;
DWORD dwStreamLen;
DWORD dwStreamCurrentPos;
float fSeconds;
float fSecondsTotal;
int frameNumber = 0;

//==============================================================================================
long start_time = timeGetTime();
long current_time = start_time;

bool isIntroPaused = false;
bool forceFrame = false;

double getChannelTime() {
    
    return BASS_ChannelBytes2Seconds(
        hWav,
        BASS_ChannelGetPosition(hWav, BASS_POS_BYTE)
    );
}

void introRewind() 
{
    current_time -= 5000;
    if (current_time < 0) {
        current_time = 0;
    }

    BASS_ChannelSetPosition(hWav, BASS_ChannelSeconds2Bytes(hWav, current_time / 1000), BASS_POS_BYTE);
    start_time = timeGetTime() - current_time;
}

void introForwards()
{
    
    if (current_time - 5000 < fSecondsTotal * 1000) {
        current_time += 5000;
        BASS_ChannelSetPosition(hWav, BASS_ChannelSeconds2Bytes(hWav, current_time / 1000), BASS_POS_BYTE);
        start_time = timeGetTime() - current_time;
    }	
}

void introPause()
{
    if (isIntroPaused) {
        isIntroPaused = !BASS_Start();
    }
    else 
    {		 
        isIntroPaused = BASS_Pause();
    }
}

void introRestart() 
{
    isIntroPaused = false;
    frameNumber = 0;
    BASS_Start();
    hWav = BASS_Stop();
    start_time = timeGetTime();
    BASS_Init(-1, 44100, 0, 0, NULL);
    BASS_Start();
    hWav = BASS_StreamCreateFile(false, "D:/!!Scene/rw2018/Outside/clinkster/music.wav", 0, 0, BASS_MP3_SETPOS | BASS_SAMPLE_LOOP);
    BASS_ChannelPlay(hWav, true);
    dwStreamLen = BASS_ChannelGetLength(hWav, BASS_POS_BYTE);
    fSecondsTotal = BASS_ChannelBytes2Seconds(hWav, dwStreamLen);
};

typedef struct
{
    //---------------
    HINSTANCE   hInstance;
    HDC         hDC;
    HGLRC       hRC;
    HWND        hWnd;
    //---------------
    int         full;
    //---------------
    char        wndclass[4];	// window class and title :)
    //---------------
}WININFO;



static PIXELFORMATDESCRIPTOR pfd =
    {
    sizeof(PIXELFORMATDESCRIPTOR),
    1,
    PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER,
    PFD_TYPE_RGBA,
    32,
    0, 0, 0, 0, 0, 0, 8, 0,
    0, 0, 0, 0, 0,  // accum
    32,             // zbuffer
    0,              // stencil!
    0,              // aux
    PFD_MAIN_PLANE,
    0, 0, 0, 0
    };

static WININFO wininfo = {  0,0,0,0,0,
                            {'i','q','_',0}
                            };

//==============================================================================================

/*
    DOWN - restarts
    ESC - quits

*/


static LRESULT CALLBACK WndProc( HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam )
{
    // salvapantallas
    if( uMsg==WM_SYSCOMMAND && (wParam==SC_SCREENSAVE || wParam==SC_MONITORPOWER) )
        return( 0 );

    // boton x o pulsacion de escape
    if( uMsg==WM_CLOSE || uMsg==WM_DESTROY || (uMsg==WM_KEYDOWN && wParam==VK_ESCAPE) )
    {
        PostQuitMessage(0);
        return( 0 );
    }

    if( uMsg==WM_SIZE )
    {
        glViewport( 0, 0, lParam&65535, lParam>>16 );
    }

    if( uMsg == WM_CHAR || uMsg == WM_KEYDOWN)
    {
        if( wParam==VK_ESCAPE )
        {
            PostQuitMessage(0);
            return( 0 );
        }

        if (uMsg == WM_KEYDOWN) {

            if (wParam == VK_F5) {
                intro_init();
            }

            if (wParam == VK_UP) {
                introPause();
            }

            if (wParam == VK_DOWN) {
                introRestart();
            }

            if (wParam == VK_LEFT) {
                introRewind();
            }

            if (wParam == VK_RIGHT) {
                introForwards();
            }

        }
    }

    

    return( DefWindowProc(hWnd,uMsg,wParam,lParam) );
}


static void window_end( WININFO *info )
{
    if( info->hRC )
    {
        wglMakeCurrent( 0, 0 );
        wglDeleteContext( info->hRC );
    }

    if( info->hDC  ) ReleaseDC( info->hWnd, info->hDC );
    if( info->hWnd ) DestroyWindow( info->hWnd );

    UnregisterClass( info->wndclass, info->hInstance );

    if( info->full )
    {
        ChangeDisplaySettings( 0, 0 );
        while( ShowCursor( 1 )<0 ); // show cursor
    }
}

HWND gHWND;


	

static int window_init(WININFO *info)
{
	unsigned int	PixelFormat;
	DWORD			dwExStyle, dwStyle;
	DEVMODE			dmScreenSettings;
	RECT			rec;

	WNDCLASS		wc;

	ZeroMemory(&wc, sizeof(WNDCLASS));
	wc.style = CS_OWNDC | CS_HREDRAW | CS_VREDRAW;
	wc.lpfnWndProc = WndProc;
	wc.hInstance = info->hInstance;
	wc.lpszClassName = info->wndclass;
	wc.hbrBackground = (HBRUSH)CreateSolidBrush(0x00102030);

	if (!RegisterClass(&wc))
		return(0);

	if (info->full)
	{
		dmScreenSettings.dmSize = sizeof(DEVMODE);
		dmScreenSettings.dmFields = DM_BITSPERPEL | DM_PELSWIDTH | DM_PELSHEIGHT;
		dmScreenSettings.dmBitsPerPel = 32;
		dmScreenSettings.dmPelsWidth = XRES;
		dmScreenSettings.dmPelsHeight = YRES;

		if (ChangeDisplaySettings(&dmScreenSettings, CDS_FULLSCREEN) != DISP_CHANGE_SUCCESSFUL)
			return(0);

		dwExStyle = WS_EX_APPWINDOW;
		dwStyle = WS_VISIBLE | WS_POPUP;

		while (ShowCursor(0) >= 0);	// hide cursor
	}
	else
	{
		dwExStyle = 0;
		dwStyle = WS_VISIBLE | WS_CAPTION | WS_SYSMENU | WS_MAXIMIZEBOX | WS_OVERLAPPED;
		dwStyle = WS_VISIBLE | WS_OVERLAPPEDWINDOW | WS_POPUP;

	}

	rec.left = 0;
	rec.top = 0;
	rec.right = XRES;
	rec.bottom = YRES;

	AdjustWindowRect(&rec, dwStyle, 0);

	info->hWnd = CreateWindowEx(dwExStyle, wc.lpszClassName, "I", dwStyle,
		(GetSystemMetrics(SM_CXSCREEN) - rec.right + rec.left) >> 1,
		(GetSystemMetrics(SM_CYSCREEN) - rec.bottom + rec.top) >> 1,
		rec.right - rec.left, rec.bottom - rec.top, 0, 0, info->hInstance, 0);

	if (!info->hWnd)
		return(0);

	if (!(info->hDC = GetDC(info->hWnd)))
		return(0);

	if (!(PixelFormat = ChoosePixelFormat(info->hDC, &pfd)))
		return(0);

	if (!SetPixelFormat(info->hDC, PixelFormat, &pfd))
		return(0);

	if (!(info->hRC = wglCreateContext(info->hDC)))
		return(0);

	if (!wglMakeCurrent(info->hDC, info->hRC))
		return(0);

	//setFont(info->hDC);
	return 1;
}



//==============================================================================================

LPCSTR DIRECTORY_TO_WATCH = LPCSTR("../src/shaders");

int counter = 0;
bool shadersChanged = false;

void onFilesChanged() 
{
    if (counter++ % 2 == 1) {		
        //MessageBox(0, "Changed", "error", MB_OK | MB_ICONEXCLAMATION);
        shadersChanged = true;
    }

}

void setWatcher(LPCSTR filename) 
{
    HANDLE hDir = CreateFile(
        filename, /* pointer to the file name */
        FILE_LIST_DIRECTORY,                /* (this is important to be FILE_LIST_DIRECTORY!) access (read-write) mode */
        FILE_SHARE_WRITE | FILE_SHARE_DELETE,  /* (file share write is needed, or else user is not able to rename file while you hold it) share mode */
        NULL, /* security descriptor */
        OPEN_EXISTING, /* how to create */
        FILE_FLAG_BACKUP_SEMANTICS, /* file attributes */
        NULL /* file with attributes to copy */
    );

    FILE_NOTIFY_INFORMATION buffer[1024];
    DWORD BytesReturned;
    while (ReadDirectoryChangesW(
            hDir, /* handle to directory */
            &buffer, /* read results buffer */
            sizeof(buffer), /* length of buffer */
            TRUE, /* monitoring option */
            FILE_NOTIFY_CHANGE_LAST_WRITE, /* filter conditions */
            &BytesReturned, /* bytes returned */
            NULL, /* overlapped buffer */
            NULL)
        ) 
        {
            onFilesChanged();
        }

    //return 0;
}




//==============================================================================================

int WINAPI WinMain(HINSTANCE instance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    MSG         msg;
    int         done = 0;
    WININFO     *info = &wininfo;

    info->hInstance = GetModuleHandle(0);

    ///@todo if( MessageBox( 0, "fullscreen?", info->wndclass, MB_YESNO|MB_ICONQUESTION)==IDYES ) info->full++;

    if (!window_init(info))
    {
        window_end(info);
        MessageBox(0, "window_init()!", "error", MB_OK | MB_ICONEXCLAMATION);
        return(0);
    }

    if (!intro_pre_init()) {
        window_end(info);
        MessageBox(0, "intro_pre_init()!", "error", MB_OK | MB_ICONEXCLAMATION);
        return(0);
    }

    if (!intro_init()) {
        window_end(info);
        MessageBox(0, "intro_init()!", "error", MB_OK | MB_ICONEXCLAMATION);
        return(0);
    }

    char caption[256];


    float pos;

 //   std::thread t1(setWatcher, DIRECTORY_TO_WATCH);

    introRestart();
    double long framesTime = timeGetTime();
    double long lastFrameCounted = 0;
    double long last_load = timeGetTime();
    float fps = 0;
    //float frameNumber = 0;
    int frames = 0;
    int framesSec = 0;
    int fpsCount = 0;
	musicStarted = true;
	while (!done)
    {
		
		
        current_time = timeGetTime() - start_time;
        
        while(PeekMessage(&msg, 0, 0, 0, PM_REMOVE) )
        {
            if( msg.message==WM_QUIT ) done=1;
            TranslateMessage( &msg );
            DispatchMessage( &msg );
        }
        
		if (GetAsyncKeyState('1')) forceFrame = true;
		if (GetAsyncKeyState('2')) forceFrame = true;
		if (GetAsyncKeyState('3')) forceFrame = true;
		if (GetAsyncKeyState('4')) forceFrame = true;
		
        if (current_time > fSecondsTotal * 1000) 
        {
            current_time = fSecondsTotal;
        }
        
        if (!isIntroPaused || forceFrame) {
			intro_do(getChannelTime());
			
			//intro_do(((double)timeGetTime() - last_load) / 1000.0); // ROWS per SECOND
            forceFrame = false;
            sprintf_s(
                caption,
                "SongTime=%.3lf, Pattern Row:%.3lf, FPS:%i, Total Frames=%i, PATTERN=%i",
                getChannelTime(), getChannelTime() * 17.325, fpsCount, frameNumber, int(getChannelTime() / 5.485714)
            );
			//intro_do(getChannelTime()); // ROWS per SECOND
            SetWindowText(info->hWnd, caption);
            frames++;
            //totalFrames++;
			frameNumber++;
			SwapBuffers(info->hDC);
			
        }
        Sleep( 1 ); // give other processes some chance to do something
        
        if (GetAsyncKeyState(VK_CONTROL) && GetAsyncKeyState('S'))
        {
            // Wait for a while to let the file system finish the file write.
            if (timeGetTime() - last_load > 200) {
                Sleep(100);
                //shadersChanged = true;
                intro_init();
                forceFrame = true;
            }
            last_load = timeGetTime();
        }

		

        /*
        if (shadersChanged) 
        {
            shadersChanged = false;
            intro_init();
            forceFrame = true;
        }*/

        if (timeGetTime() - 1000 > lastFrameCounted + 56000) {

            lastFrameCounted = timeGetTime();
            fps = frames;
            frames = 0;			
        }

        framesSec++;
        if (timeGetTime() > framesTime + 1000) {
            fpsCount = framesSec;
            framesSec = 0;            
            framesTime = timeGetTime();
        };
		
		
    }
	


    BASS_Free();

    window_end( info );	
    std::terminate();
    return( 0 );
    
}



