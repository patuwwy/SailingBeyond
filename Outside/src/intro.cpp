#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>
#include <GL/gl.h>
#include "config.h"
#include "ext.h"
#include "fp.h"
#include "intro.h"
//#include "clinkster.h" 

#include "shaders/shaders.h"
#include <string>

#define GLYPHS 'z'
static GLuint
calcShader,
shaderScene_1, // landscape
shaderScene_2, // hipertunel
shaderScene_3, // multiverse
shaderScene_4, // frakt
shaderScene_5, // planet
vertexShader,
postProcessingShader,

framebuffer,
texture0, texture1, texture2, postProcTexture,
calcPipeline,
renderPipeline1,
renderingPipeline2,
renderingPipeline3,
renderingPipeline4,
renderingPipeline5,
postProcessingPipeline;

int font_list_base_2d; // set the start of the display lists for the 2d font

#ifdef DEBUG
int intro_pre_init(void)
{
	if (!EXT_Init()) return 0;
	return 1;
}
#else
void intro_pre_init(void)
{
	EXT_Init();
}
#endif

#ifdef DEBUG
int intro_init(void)
{
#else
void intro_init()
{
#endif

#ifdef DEBUG

	static const unsigned long fileReadBufferSize = 1024 * 1024;
	static char fileReadBuffer[fileReadBufferSize];
	static char fileReadBuffer2[fileReadBufferSize];
	unsigned long bytes_read;
	char* commonInit_shaderText;
	char* buffer;
	char* bufferInit;
	HANDLE handle;

	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/common_init.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/common_init.frag", "/common_init.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer2, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);
	
	bufferInit = fileReadBuffer2;
	bufferInit[bytes_read] = 0;
	
	

	const char *shadersArray[2];
	shadersArray[0] = bufferInit;

	/// first shader

	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/calc.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/calc.frag", "/calc.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;
	shadersArray[1] = buffer;
	calcShader = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	//MessageBoxA()
	
	/// second shader
	
	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/scene1.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/scene1.frag", "/scene1.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;
	shadersArray[1] = buffer;
	shaderScene_1 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);



	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/scene2.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/scene2.frag", "/scene2.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;
	shadersArray[1] = buffer;
	shaderScene_2 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);



	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/scene3.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/scene3.frag", "/scene3.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;
	shadersArray[1] = buffer;
	shaderScene_3 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);


	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/scene4.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/scene4.frag", "/scene4.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;
	shadersArray[1] = buffer;
	shaderScene_4 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);

	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/scene5.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/scene5.frag", "/scene5.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;
	shadersArray[1] = buffer;
	shaderScene_5 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);

	/// vertex

	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/vertex.vert", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/vertex.vert", "/vertex.vert", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;

	vertexShader = glCreateShaderProgramv(GL_VERTEX_SHADER, 1, &buffer);
	
	/// postproc
	
	handle = CreateFile("D:/!!Scene/rw2018/Outside/src/shaders/post_processing_shader.glsl.frag", GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
	if (handle == INVALID_HANDLE_VALUE) {
		MessageBoxA(nullptr, "../src/shaders/post_processing_shader.glsl.frag", "/post_processing_shader.glsl.frag", MB_ICONERROR | MB_OK); return 0;
	}

	ReadFile(handle, fileReadBuffer, fileReadBufferSize, &bytes_read, nullptr);
	CloseHandle(handle);

	buffer = fileReadBuffer;
	buffer[bytes_read] = 0;

	postProcessingShader = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 1, &buffer);


#else
	const char *shadersArray[2];
	shadersArray[0] = common_init_frag;
	shadersArray[1] = calc_frag;
	calcShader = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	shadersArray[1] = scene1_frag;
	shaderScene_1 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	shadersArray[1] = scene2_frag;
	shaderScene_2 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	shadersArray[1] = scene3_frag;
	shaderScene_3 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	shadersArray[1] = scene4_frag;
	shaderScene_4 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	shadersArray[1] = scene5_frag;
	shaderScene_5 = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 2, shadersArray);
	vertexShader = glCreateShaderProgramv(GL_VERTEX_SHADER, 1, &vertex_vert);

	postProcessingShader = glCreateShaderProgramv(GL_FRAGMENT_SHADER, 1, &post_processing_shader_glsl_frag);

#endif

	glGenProgramPipelines(1, &calcPipeline);
	glBindProgramPipeline(calcPipeline);
	glUseProgramStages(calcPipeline, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(calcPipeline, GL_FRAGMENT_SHADER_BIT, calcShader);

	glGenProgramPipelines(1, &renderPipeline1);
	glBindProgramPipeline(renderPipeline1);
	glUseProgramStages(renderPipeline1, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(renderPipeline1, GL_FRAGMENT_SHADER_BIT, shaderScene_1);

	glGenProgramPipelines(1, &renderingPipeline2);
	glBindProgramPipeline(renderingPipeline2);
	glUseProgramStages(renderingPipeline2, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(renderingPipeline2, GL_FRAGMENT_SHADER_BIT, shaderScene_2);

	glGenProgramPipelines(1, &renderingPipeline3);
	glBindProgramPipeline(renderingPipeline3);
	glUseProgramStages(renderingPipeline3, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(renderingPipeline3, GL_FRAGMENT_SHADER_BIT, shaderScene_3);

	glGenProgramPipelines(1, &renderingPipeline4);
	glBindProgramPipeline(renderingPipeline4);
	glUseProgramStages(renderingPipeline4, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(renderingPipeline4, GL_FRAGMENT_SHADER_BIT, shaderScene_4);


	glGenProgramPipelines(1, &renderingPipeline5);
	glBindProgramPipeline(renderingPipeline5);
	glUseProgramStages(renderingPipeline5, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(renderingPipeline5, GL_FRAGMENT_SHADER_BIT, shaderScene_5);

	glGenProgramPipelines(1, &postProcessingPipeline);
	glBindProgramPipeline(postProcessingPipeline);
	glUseProgramStages(postProcessingPipeline, GL_VERTEX_SHADER_BIT, vertexShader);
	glUseProgramStages(postProcessingPipeline, GL_FRAGMENT_SHADER_BIT, postProcessingShader);


#ifdef LOG_ERRORS
	int result;
	char info[1536];
	glGetProgramiv(vertexShader, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(vertexShader, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! vertexShader", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(calcShader, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(calcShader, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! calcShader", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(shaderScene_1, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(shaderScene_1, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! shaderScene_1", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(shaderScene_2, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(shaderScene_2, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! shaderScene_2", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(shaderScene_3, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(shaderScene_3, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! shaderScene_3", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(shaderScene_4, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(shaderScene_4, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! shaderScene_4", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(shaderScene_5, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(shaderScene_5, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! shaderScene_4", MB_OK | MB_ICONEXCLAMATION);
	}

	glGetProgramiv(postProcessingShader, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(postProcessingShader, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error! postProcessingShader", MB_OK | MB_ICONEXCLAMATION);
	}

	/*
	glGetProgramiv(postProcessingShader2, GL_LINK_STATUS, &result);
	glGetProgramInfoLog(postProcessingShader2, 1024, NULL, (char *)info);
	if (!result) {
		MessageBox(0, info, "Error!", MB_OK | MB_ICONEXCLAMATION);
	}
	*/
#endif

	glGenFramebuffers(4, &framebuffer);
	glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);

	// render
	glGenTextures(1, &texture0);
	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texture0);
	glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA32F, XRES, YRES);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);

	//glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_TRUE);
	//glGenerateMipmap(GL_TEXTURE_2D);

	// main draw
	glGenTextures(1, &texture1);
	glActiveTexture(GL_TEXTURE1);
	glBindTexture(GL_TEXTURE_2D, texture1);
	glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA32F, XRES, YRES);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);
	//glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_TRUE);

	// calc texture
	glGenTextures(1, &texture2);
	glActiveTexture(GL_TEXTURE2);
	glBindTexture(GL_TEXTURE_2D, texture2);
	glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA32F, XRES, YRES);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);

	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, texture0, 0);
	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT1, texture1, 0);
	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT2, texture2, 0);

	static const GLenum drawBuffers[] = { GL_COLOR_ATTACHMENT0, GL_COLOR_ATTACHMENT1, GL_COLOR_ATTACHMENT2 };
	//
	glDrawBuffers(3, drawBuffers);

#ifdef DEBUG
	return 1;
#endif // DEBUG

}



float fparams[] = { 
	0, XRES, YRES, 0, 
	0, 0, 0, 0,
	0, 0, 0, 0
};

/*
void setFont(HDC hDC) { //74 HD
	char info[1536];
	font_list_base_2d = glGenLists(GLYPHS);
	HFONT font = CreateFont(111, 0, 0, 0,
		FW_MEDIUM, FALSE, FALSE, FALSE,
		ANSI_CHARSET, OUT_TT_PRECIS,
		CLIP_DEFAULT_PRECIS,
		ANTIALIASED_QUALITY, FF_DONTCARE | DEFAULT_PITCH,
		"Impact");

	SelectObject(hDC, font);
	//if (!wglUseFontBitmaps(hDC, 1, 127, font_list_base_2d)) /// that make all text to be move by 1 character, so A become B, B become C, and so on.
	if (!wglUseFontBitmaps(hDC, 0, 127, font_list_base_2d))
	{
		//MessageBox(0, info, "wglUseFontBitmaps error!", MB_OK | MB_ICONEXCLAMATION);
	}
}
*/
int currentKeyframe = 0;
int currentScene = 0;
GLuint currentPipeline;

struct keyframe {
	float time;
	int pipelineIndex;
	int sceneParam;
};

// 1 landscape
// 2 hipertunel
// 3 multiverse
// 4 frakt
// 5 planet1
// 

#define PATTERN_TIME 5.485714f

const keyframe timeline[] = {

	{					0,	1,	0 }, //landscape
	//{	PATTERN_TIME * 16,	1,	0 }, 
	{	PATTERN_TIME * 12,	4,	0 }, // tunel 1 fraktal
	{   PATTERN_TIME * 20,	5,	0 }, // mars
	{   PATTERN_TIME * 28,	2,	0 }, // tunel 2 hiper
	{   PATTERN_TIME * 32,	3,	0 }, // multi
	{	512,				1,	1 },

};


float currentFrame = 0;
bool musicStarted; 
void intro_do(float time)
{
	currentFrame++;

	float flashIntensity = 0;
	float fade = 1;
	int sceneParam = 0;
	float sceneTime = 1;

	GLuint pipelines[] = { 0, renderPipeline1, renderingPipeline2, renderingPipeline3, renderingPipeline4, renderingPipeline5 };

	for (int i = 0; i < sizeof(timeline) / sizeof(timeline[0]); i++)
	{
		if (timeline[i].time < time && timeline[i + 1].time > time)
		{
			currentKeyframe = i;
			currentPipeline = pipelines[timeline[i].pipelineIndex];
			currentScene = timeline[i].pipelineIndex;
			sceneParam = timeline[i].sceneParam;
			sceneTime = time - timeline[i].time;
			break;
		}
	}
	if (!musicStarted) {
		currentPipeline = pipelines[1];
	}
#ifdef DEBUG
	if (GetAsyncKeyState('1') || GetAsyncKeyState(VK_CONTROL) && GetAsyncKeyState('S'))
	{
		currentPipeline = pipelines[1];
		currentFrame = 0;
	}

	if (GetAsyncKeyState('2'))
	{
		currentPipeline = pipelines[2];
		
	}

	if (GetAsyncKeyState('3'))
	{
		currentPipeline = pipelines[3];
	}

	if (GetAsyncKeyState('4'))
	{
		currentPipeline = pipelines[4];
	}

	if (GetAsyncKeyState('5'))
	{
		currentPipeline = pipelines[5];
	}
//currentPipeline = pipelines[0];

#endif
	//currentPipeline = pipelines[1];

	/// setup framebufer for rendering to fontTexture
	/// important!

	// TEXT
	/// clean up and draw font to texture
	/*
	{
	glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, fontTexture, 0);
	glBindProgramPipeline(NULL);
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3d(1.0, 1.0, 1.0);
	
		const char texts[9][57] = {
			"                                                        ",
			"                                                        ",
			"          YOU!                          Agenda  Altair  ",
			"   Amnesty    Anadune    Arise    Artstate    Appendix  ",
			"     CrapTeam      Darklite        DMA     Mawi  ",
			"    Elude   EXclusive ON   Floppy   Futuris   Ghostown  ",
			" Lamers   DRRM    Samar    MultiStyle Labs     Plastic  ",
			" Speccy.pl                                              ",
			"                                                        "
		};
		const char texts2[9][57] = {
			"                                                        ",
			"                                                        ",
			"                                     at DECRUNCH 2048   ",
			"                                                        ",
			"     AberrationCreations    +    Eclectique             ",
			"                                                        ",
			"          Digiverse                                     ",
			"                                                        ",
			"                                                        "

		};
		
		int t = 0;
		for (float i = -1; i < .7; i += .2) {
			glListBase(font_list_base_2d); //start of our font display list numbers

			if (sceneParam == 24) {
				glRasterPos2f(-.8, i); // set start position
				glCallLists(54, GL_BYTE, &texts2[t++]);
			}
			else {
				glRasterPos2f(-1, i); // set start position
				glCallLists(54, GL_BYTE, &texts[t++]);
			}
			glFlush();
		}
		

	}
	*/
	///
	/// setup shader arguments
	///
	fparams[0] = time;
	fparams[1] = XRES;
	fparams[2] = YRES;
	fparams[3] = currentScene;
	fparams[4] = currentFrame;
	fparams[5] = 0.;

	if (!musicStarted) {
		fparams[5] = 1.;
	}

#ifdef DEBUG 

#else
	//fparams[4] = Oidos_GetInstrumentTrigger(1, Oidos_GetPosition());
#endif

	/// reset framebufer
	// BindFramebuffer(GL_FRAMEBUFFER, 0);

	/// render
	glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, texture0, 0);
	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT1, texture1, 0);
	glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT2, texture2, 0);

	//glGenerateMipmap(GL_TEXTURE_2D);

	glProgramUniform4fv(calcShader, 3, 2, fparams);
	glProgramUniform4fv(shaderScene_1, 3, 2, fparams);
	glProgramUniform4fv(shaderScene_2, 3, 2, fparams);
	glProgramUniform4fv(shaderScene_3, 3, 2, fparams);
	glProgramUniform4fv(postProcessingShader, 3, 2, fparams);

	glBindProgramPipeline(calcPipeline);
	//glActiveTexture(GL_TEXTURE0);
	//glBindTexture(GL_TEXTURE_2D, texture);
	//glEnable(GL_TEXTURE_2D);
	glRects(-1, -1, 1, 1);

	glBindProgramPipeline(currentPipeline);	
	//glActiveTexture(GL_TEXTURE0);
	//glBindTexture(GL_TEXTURE_2D, texture);
	//glEnable(GL_TEXTURE_2D);
	//glGenerateMipmap(GL_TEXTURE_2D);
	glRects(-1, -1, 1, 1);
	//glGenerateMipmap(GL_TEXTURE_2D);

	///
	/// postprocessing
	///
	glBindFramebuffer(GL_FRAMEBUFFER, 0);
	glBindProgramPipeline(postProcessingPipeline);
	glRects(-1, -1, 1, 1);


#ifdef DEBUG 
	
	
#endif
}
