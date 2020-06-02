//b2c.sdlbas:beast.sdlbas->beast.cpp
#include "lib/core.h"
#include "lib/SDLengine.h"

 number mk_1;

 void  b2cmain(){
//
// beast demo scrolling
//
 //common mk_1

 mk_1 = setvar( 49);
 integer i ;
 fps ( 1 ) ;
 setdisplay ( 640 , 480 , 32 , 0 ) ;
 dualplayfield ( 1 ) ;
 screenopen ( 1 , 100 , 40 , 0 , 0 , 100 , 20 , 3 ) ;
 autoback ( 0 ) ;
 autoupdatebob ( 0 ) ;
 mousehide ( ) ;
 soundchannels ( 0 ) ;
 screen ( 0 ) ;

 number x[(int)21];
 number y[(int)21];
 number v[(int)21];
 number l[(int)21];

 loadmusic  ( "media/b-title.mod" ) ;

 //setcolorkey ( rgb ( 255 , 0 , 255 ) ) ;

 loadimage ( "media/background.png" , 0 ) ;
 x[(int)0] = setvar( 0);
 y[(int)0] = setvar( 0);
 v[(int)0] = setvar( 0);
 l[(int)0] = setvar( 640);
 loadimage  ( "media/beast01.png" , 1 ) ;
 x[(int)1] = setvar( 0);
 y[(int)1] = setvar( 0);
 v[(int)1] = setvar( 0.1);
 l[(int)1] = setvar( 640);

 loadimage ( "media/blimp.png" , 2 ) ;
 x[(int)2] = setvar( displaywidth ( ) );
 y[(int)2] = setvar( 160);
 v[(int)2] = setvar( 0-0.5);
 l[(int)2] = setvar( 640);
 loadimage ( "media/blimp_small.png" , 3 ) ;
 x[(int)3] = setvar( 0);
 y[(int)3] = setvar( 100);
 v[(int)3] = setvar( 0.1);
 l[(int)3] = setvar( 640);

 loadimage ( "media/clouds5.png" , 4 ) ;
 x[(int)4] = setvar( 0);
 y[(int)4] = setvar( 200);
 v[(int)4] = setvar( 0.5);
 l[(int)4] = setvar( 640);
 loadimage ( "media/clouds4.png" , 5 ) ;
 x[(int)5] = setvar( 0);
 y[(int)5] = setvar( 180);
 v[(int)5] = setvar( 1);
 l[(int)5] = setvar( 640);
 loadimage ( "media/clouds3.png" , 6 ) ;
 x[(int)6] = setvar( 0);
 y[(int)6] = setvar( 140);
 v[(int)6] = setvar( 2);
 l[(int)6] = setvar( 640);
 loadimage ( "media/clouds2.png" , 7 ) ;
 x[(int)7] = setvar( 0);
 y[(int)7] = setvar( 60);
 v[(int)7] = setvar( 3);
 l[(int)7] = setvar( 640);
 loadimage ( "media/clouds1.png" , 8 ) ;
 x[(int)8] = setvar( 0);
 y[(int)8] = setvar( 0);
 v[(int)8] = setvar( 8);
 l[(int)8] = setvar( 640);

 loadimage ( "media/mountains.png" , 9 ) ;
 x[(int)9] = setvar( 0);
 y[(int)9] = setvar( 270);
 v[(int)9] = setvar( 1);
 l[(int)9] = setvar( 640);
 loadimage ( "media/grassall.png" , 10 ) ;
 x[(int)10] = setvar( 0  );
 y[(int)10] = setvar( 430  );
 v[(int)10] = setvar( 2  );
 l[(int)10] = setvar( 640);
 loadimage ( "media/grass4.png" , 11 ) ;
 x[(int)11] = setvar( 0);
 y[(int)11] = setvar( 460);
 v[(int)11] = setvar( 32);
 l[(int)11] = setvar( 640);
 loadimage ( "media/grass3.png" , 12 ) ;
 x[(int)12] = setvar( 0);
 y[(int)12] = setvar( 445);
 v[(int)12] = setvar( 16  );
 l[(int)12] = setvar( 640);
 loadimage ( "media/grass2.png" , 13 ) ;
 x[(int)13] = setvar( 0);
 y[(int)13] = setvar( 435);
 v[(int)13] = setvar( 8  );
 l[(int)13] = setvar( 640);
 loadimage ( "media/grass1.png" , 14 ) ;
 x[(int)14] = setvar( 0  );
 y[(int)14] = setvar( 430  );
 v[(int)14] = setvar( 4  );
 l[(int)14] = setvar( 640);

 loadimage ( "media/tree.png" , 15 ) ;
 x[(int)15] = setvar( 0);
 y[(int)15] = setvar( 160);
 v[(int)15] = setvar( 8);
 l[(int)15] = setvar( 640);
 loadimage ( "media/wall.png" , 16 ) ;
 x[(int)16] = setvar( 0);
 y[(int)16] = setvar( 440);
 v[(int)16] = setvar( 32);
 l[(int)16] = setvar( 640);

 loadimage ( "media/moon.png" , 17 ) ;
 x[(int)17] = setvar( 500);
 y[(int)17] = setvar( 40);
 v[(int)17] = setvar( 0);
 l[(int)17] = setvar( 64);

 loadimage ( "media/splash.png" , 18 ) ;
 x[(int)18] = setvar( displaywidth ( ) );
 y[(int)18] = setvar( 0);
 v[(int)18] = setvar( 1.5);
 l[(int)18] = setvar( 640);
 loadimage ( "media/splash2.png" , 19 ) ;

//start

while( y[(int)1]<480){
 sprite ( 1 , x[(int)1] , y[(int)1] , 1 ) ;
 y[(int)1] = setvar( add(y[(int)1],v[(int)1]));
 v[(int)1] = setvar( add(v[(int)1],0.01));
 screenswap ( ) ;
}
 pasteicon ( 0 , 0 , 0 ) ;
 pastebob ( x[(int)17] , y[(int)17] , 17 ) ;

 playmusic ( -1 ) ;


while( inkey()!=27){

 i = setvar( 2);
 x[(int)i] = setvar( x[(int)i]-v[(int)i]);
if( x[(int)i]<-l[(int)i] ){ 
 x[(int)i] = setvar( displaywidth ( ) );
}
 sprite ( ( i*2 ) , x[(int)i] , y[(int)i] , i ) ;


for(i=3 ;i<=14;i++){
 x[(int)i] = setvar( x[(int)i]  -  v[(int)i]);
if( x[(int)i]<-l[(int)i] ){ 
 x[(int)i] = setvar( 0);
}
 sprite ( ( i*2 ) , x[(int)i] , y[(int)i] , i ) ;
 sprite ( add(i*2,1) , add(x[(int)i],displaywidth() ) , y[(int)i] , i ) ;
}

for(i=15 ;i<=16;i++){
 x[(int)i] = setvar( x[(int)i]-v[(int)i]);
if( x[(int)i]<-l[(int)i] ){ 
 x[(int)i] = setvar( displaywidth ( ) );
}
 sprite ( ( i*2 ) , x[(int)i] , y[(int)i] , i ) ;
}


 x[(int)18] = setvar( x[(int)18]-v[(int)18]);
		if( x[(int)18]< -l[(int)18]*2 ){
 v[(int)18] = setvar( -v[(int)18]);
}
		if( x[(int)18]>l[(int)18] ){
 v[(int)18] = setvar( -v[(int)18]);
}


 sprite ( ( 18*2 ) , x[(int)18] , y[(int)18] , 18 ) ;
 sprite ( add(18*2 ,1) , add(x[(int)18],displaywidth() ) , y[(int)18] , 19 ) ;


	if( key(mk_1) ){
 loadmusic  ( "media/b-title.mod" ) ;
 playmusic ( -1 ) ;
}

	if( key(50) ){
 loadmusic  ( "media/Beast1_2.mod" ) ;
 playmusic ( -1 ) ;
}

	if( key(51) ){
 loadmusic  ( "media/Beast1_3.mod" ) ;
 playmusic ( -1 ) ;
}

	if( key(52) ){
 loadmusic  ( "media/Beast1_4.mod" ) ;
 playmusic ( -1 ) ;
}

	if( key(53) ){
 loadmusic  ( "media/Beast1_5.mod" ) ;
 playmusic ( -1 ) ;
}

 waitvbl ( ) ;
 screenswap ( ) ;
 screen  ( 1 ) ;
 locate ( 0 , 0 ) ;
 prints ( add("fps: ",strS(fps(-1) ) ) ) ;
 screen ( 0 ) ;
}

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
