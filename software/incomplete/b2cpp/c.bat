rem WARNING!!! verify the correct path of mingGw
rem set s=beast
rem set s=test
rem set s=hunter
set s=hunter

del %s%.exe
del *.o

set MINGWPATH=c:\devel\c-cpp\mingw

@path %MINGWPATH%\bin;%PATH%

sdlBasic b2cpp.sdlbas %s%.sdlbas
gcc -I%MINGWPATH%/include -c %s%.cpp
rem gcc -g -O2 -I%MINGWPATH%/include -c lib/SDLengine.c
gcc -I%MINGWPATH%/include -o %s%.exe %s%.o lib/SDLengine.a -lmingw32 -lSDLmain -lSDL -lSDL_image  -lSDL_mixer -lSDL_ttf -lSDL_net -lsmpeg
strip %s%.exe
%s%.exe


