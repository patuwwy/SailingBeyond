#ifndef _INTRO_H_
#define _INTRO_H_

//void setFont(HDC);  
extern bool musicStarted;
#ifdef DEBUG
	
	int intro_init(void);
	int intro_pre_init(void);
	//void gui();
#else

	void intro_init();
	void intro_pre_init();

#endif

	void intro_do(float time);
	//bool fromF5;
	
	//extern float frameNumber;
#endif
