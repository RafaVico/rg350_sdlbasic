//b2c.sdlbas:test.sdlbas->test.cpp
#include "lib/core.h"
#include "lib/SDLengine.h"


 void  stelle(){
    //dim n  as integer
 number i;
 setdisplay ( 640 , 480 , 32 , 1 ) ;
 autoback ( 0 ) ;
 //directscreen ( ) ;
 fps ( 1 ) ;
 //n = setvar( 1000);
 number x[(int)2500];
 number y[(int)2500];
 number v[(int)2500];
for(i =0 ;i <=2499;i ++){
 x[(int)i] = setvar( rnd ( 640 ) );
 y[(int)i] = setvar( rnd ( 480 ) );
 v[(int)i] = setvar( rnd ( 8 ) );
}

    while( key(27)==0){

for(i =0 ;i <=2499;i ++){
 ink ( 0 ) ;
 dot ( x[(int)i] , y[(int)i] ) ;
 x[(int)i] = setvar( x[(int)i]-v[(int)i]);
 if(  ( x[(int)i]  <0 ) ){  ;
 x[(int)i] = setvar( add(x[(int)i],640 ) );
}
 ink  ( 0xffffff-v[(int)i] ) ;
 dot ( x[(int)i] , y[(int)i] ) ;
}
 locate ( 0 , 0 ) ;
 prints ( strS ( fps ( -1 ) ) ) ;
 screenswap ( ) ;
}
}

 void  b2cmain(){

//test
//prova di subrutine



 randomize ( timer ( ) ) ;
 stelle ( ) ;

}



// main
int cmdArgc;
char *cmdArgv[32];
int main(int argc,char *argv[]){
int r;int r1;int audio;int socket;
audio=1;socket=1;
/* the command line param */
r1=0;
for (r=0;r<argc;r++){cmdArgv[r1]=setvar(argv[r]);
#ifdef UNIX
if (strcasecmp(cmdArgv[r1],"--nosound")==0)audio=0;
if (strcasecmp(cmdArgv[r1],"--nosocket")==0)socket=0;
#else
if (stricmp(cmdArgv[r1],"--nosound")==0)audio=0;
if (stricmp(cmdArgv[r1],"--nosocket")==0)socket=0;
#endif
if (cmdArgv[r1][0]!='-')r1++;
else free(cmdArgv[r1]);
}cmdArgc=r1;
initialize(audio,socket);
b2cmain();
terminate();}
