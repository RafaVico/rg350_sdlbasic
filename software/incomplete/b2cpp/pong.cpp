//b2c.sdlbas:pong.sdlbas->pong.cpp
#include "lib/core.h"
#include "lib/SDLengine.h"



 void  b2cmain(){
//
// sdlBasic game: Pong
//
//   Name:      pong.sdlbas
//   Purpose:   very simple clone of pong atari (1977)
//  Author:     __vroby__    ( __vroby__@libero.it )
//  Licence:    LGPL
//
// Bugs:
//
// Todo:
// ball bouncing
//  audio part
//
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 setdisplay ( 640 , 480 , 32 , 1 ) ;
 autoback ( 0 ) ;
 mousehide ( ) ;

 screenopen ( 7 , 80 , 80 , 0 , 0 , 0 , 0 , 0 ) ;
 number i;
for(i=0 ;i<=5;i++){
 ink ( rgb ( add(64,(i*18) ) , add(64,(i*18) ) , add(64,(i*18) ) ) ) ;
 fillcircle ( 10-i , 10-i , 10-i*2 ) ;
}
 grab ( 1 , 0 , 0 , 20 , 20 ) ;
 screen ( 0 ) ;
 printf ( 0 ) ;
 screenclose ( 7 ) ;


 screenopen ( 7 , 80 , 80 , 0 , 0 , 0 , 0 , 0 ) ;
 ink ( rgb ( 192 , 0 , 0 ) ) ;
 bar ( 10 , 10 , 30 , 60 ) ;
 ink ( rgb ( 128 , 0 , 0 ) ) ;
 bar ( 28 , 10 , 30 , 60 ) ;
 bar ( 10 , 58 , 30 , 60 ) ;
 ink ( rgb ( 255 , 0 , 0 ) ) ;
 bar ( 10 , 10 , 30 , 12 ) ;
 bar ( 10 , 10 , 12 , 60 ) ;
 grab ( 2 , 0 , 0 , 50 , 80 ) ;
 screen ( 0 ) ;
 screenclose ( 7 ) ;

 hotspot ( 1 , 1 , 1 ) ;
 hotspot ( 2 , 1 , 1 ) ;

while( key(27) == 0){
 cls ( ) ;
 text ( 50 , 220 , 30 , "Pong" , 0 ) ;

 screenswap ( ) ;

	while( key(k_space)==0 ){
}
 wait ( 5000 ) ;
 number punti1  ;
 punti1 = setvar( 0);
 number punti2  ;
 punti2 = setvar( 0);
 number tocca  ;
 tocca = setvar( 0);
	while( key(27) == 0){
 number v  ;
 v = setvar( 2);
 number x;
		if( tocca == 0 ){
 x = setvar( 65);
}else{
 x = setvar( 610-35);
}


 number dx;
 dx = setvar( 0);
 number dy;
 dy = setvar( 0);

 number y;
 y = setvar( 240);
 number y1;
 y1 = setvar( 240);
 number y2;
 y2 = setvar( 240);

 cls ( ) ;
		//crea la grafica di partenza
 ink ( rgb ( 255 , 255 , 255 ) ) ;
 bar ( 317 , 0 , 323 , 480 ) ;
 bar ( 0 , 0 , 640 , 5 ) ;
 bar ( 0 , 475 , 640 , 480 ) ;

 text ( 300 , 20 , 20 , strS ( punti1 ) , 0 ) ;
 text ( 350 , 20 , 20 , strS ( punti2 ) , 0 ) ;

		while( key(k_space)!=0 ){
}

		while( 0==0){

 //locate  ( 1 , 1 ) ;

 //  prints ( ( strS ( add(ysprite ( 3 ) ) ) ,add(" ",(strS(add(ysprite(1)) ) ) ) ,add(" ",(strS(ysprite(02)) ) 0 ) 0 ) 0 ) 0;

 x = setvar( add(x,dx));
 y = setvar( add(y,dy));

			//alto basso
			if( y<5 ){ 
 dy = setvar( -dy);
}
			if( y>455 ){ 
 dy = setvar( -dy);
}



			//rimbalzo fisso
			if(  spritehit(3,1) ){
 dx = setvar( v);
 //dy = setvar( -dy);
 // ( ysprite ( 0 ) -ysprite ( 1 ) /4000 ) ;
}

			if(  spritehit(3,2) ){
 dx = setvar( -v);
 //dy = setvar( -dy);
 // ( ysprite ( 2 ) -ysprite ( 0 ) ) ;
}

			//punto
			if( x>610 ){
 punti1 = setvar( add(punti1,1));
 tocca = setvar( 1);
break;
}

			if( x<10 ){
 punti2 = setvar( add(punti2,1));
 tocca = setvar( 0);
break;
}


			if( key(k_space) ){
				if( tocca ==0 ){
 dx = setvar( v);
}else{
 dx = setvar( -v);
}
 dy = setvar( v);
}

			if( key(27) ){ 
break;
}

			if( key(asc("a")) ){
 y1 = setvar( y1-2);
}
			if( key(asc("z")) ){
 y1 = setvar( add(y1,2));
}

			if( key(k_up) ){
 y2 = setvar( y2-2);
}
			if( key(k_down) ){
 y2 = setvar( add(y2,2));
}

			//tracciamento

 sprite ( 3 , x , y , 1 ) ;
 sprite ( 1 , 30 , y1 , 2 ) ;
 sprite ( 2 , 610 , y2 , 2 ) ;

 screenswap ( ) ;
}

		//fine partita?
		 if( punti1>15 ){
break;
}

		if( punti1>15 ){
break;
}


}
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
