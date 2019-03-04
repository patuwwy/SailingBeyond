del /q temp\*
del music_wav.exe

tools\RenoiseConvert.exe music.xrns temp\music.asm
tools\nasmw -f win32 src\clinkster.asm -o temp\clinkster.obj
tools\nasmw -f win32 -dWRITE_WAV src\play.asm -o temp\play.obj
tools\crinkler20\crinkler temp\clinkster.obj temp\play.obj /OUT:music_wav.exe /ENTRY:main tools\kernel32.lib tools\user32.lib tools\winmm.lib tools\msvcrt_old.lib @crinkler_options.txt
