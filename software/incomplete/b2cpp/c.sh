#s=$1
#s=test
#s=beast
#s=hunter
#s=pong
s=arcanoid

rm $s
rm *.o
sdlpath=/usr/include/SDL
sdlBasic b2cpp.sdlbas $s.sdlbas
gcc -Wall -g -O2 -I/usr/include/SDL -D_REENTRAT -DPLAY_MOD -DUNIX -DLINUX  -c $s.cpp
gcc -Wall -g -O2 -I/usr/include/SDL -D_REENTRAT -DPLAY_MOD -DUNIX -DLINUX -c lib/SDLengine.c
gcc -Wall -g -O2 -I/usr/include/SDL -D_REENTRAT -DPLAY_MOD -DUNIX -DLINUX  -o $s $s.o SDLengine.o -lSDLmain -lSDL -lSDL_image  -lSDL_mixer -lSDL_ttf -lSDL_net -lsmpeg
strip $s
./$s
