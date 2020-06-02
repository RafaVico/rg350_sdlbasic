//b2c.sdlbas:arcanoid.sdlbas->arcanoid.cpp
#include "lib/core.h"
#include "lib/SDLengine.h"


 void  renderbackground(){
 screenopen ( 7 , 33 , 17 , 0 , 0 , 0 , 0 , 0 ) ;
 ink ( rgb ( 40 , 192 , 80 ) ) ;
 bar ( 0 , 0 , 33 , 17 ) ;
 ink ( rgb ( 255 , 255 , 255 ) ) ;
 line ( 0 , 0 , 4 , 0 ) ;
 line ( 4 , 0 , 12 , 8 ) ;
 line ( 12 , 8 , 20 , 8 ) ;
 line ( 20 , 8 , 28 , 0 ) ;
 line ( 28 , 0 , 32 , 0 ) ;
 line ( 0 , 16 , 4 , 16 ) ;
 line ( 4 , 16 , 12 , 8 ) ;
 line ( 20 , 8 , 28 , 16 ) ;
 line ( 28 , 16 , 32 , 16 ) ;
 grab ( 10 , 1 , 1 , 32 , 16 ) ;
 screenclose ( 7 ) ;
}
 void  renderpallina(){
 number i;
 screenopen ( 7 , 32 , 32 , 0 , 0 , 0 , 0 , 0 ) ;
for(i=0 ;i<=5;i++){
 ink ( rgb ( add(64,(i*18) ) , add(64,(i*18) ) , add(64,(i*18) ) ) ) ;
 fillcircle ( 10-i , 10-i , 10-i*2 ) ;
}
 grab ( 1 , 0 , 0 , 20 , 20 ) ;
 hotspot ( 1 , 1 , 1 ) ;
 screenclose ( 7 ) ;
}
 void  renderracchetta(){
 screenopen ( 7 , 64 , 16 , 0 , 0 , 0 , 0 , 0 ) ;
 ink ( rgb ( 192 , 192 , 0 ) ) ;
 bar ( 0 , 1 , 64 , 15 ) ;
 ink ( rgb ( 255 , 255 , 0 ) ) ;
 bar ( 0 , 1 , 64 , 3 ) ;
 bar ( 0 , 1 , 4 , 15 ) ;
 ink ( rgb ( 128 , 128 , 0 ) ) ;
 bar ( 0 , 12 , 64 , 15 ) ;
 bar ( 60 , 2 , 64 , 15 ) ;
 grab ( 2 , 0 , 0 , 64 , 16 ) ;
 hotspot ( 2 , 1 , 0 ) ;
 screenclose ( 7 ) ;
}
 void  renderblocco  ( number  n , number  c ) {
//sub renderBlocco (n,c)
 screenopen ( 7 , 64 , 48 , 0 , 0 , 0 , 0 , 0 ) ;
 ink ( c ) ;
 bar ( 0 , 8 , 64 , 40 ) ;
 ink ( add(c,(c/4) ) ) ;
 bar ( 0 , 8 , 64 , 10 ) ;
 bar ( 0 , 8 , 2 , 40 ) ;
 ink ( c- ( c/4 ) ) ;
 bar ( 0 , 38 , 64 , 40 ) ;
 bar ( 62 , 8 , 64 , 40 ) ;
 grab ( n , 0 , 0 , 64 , 48 ) ;
 hotspot ( n , 1 , 1 ) ;
 screenclose ( 7 ) ;
}
 void  init(){
 renderbackground ( ) ;
 renderpallina ( ) ;
 renderracchetta ( ) ;
 renderblocco ( 3  , rgb ( 192 , 0 , 0 ) ) ;
 renderblocco ( 4  , rgb ( 0 , 192 , 0 ) ) ;
 renderblocco ( 5  , rgb ( 0 , 0 , 192 ) ) ;
 renderblocco ( 6  , rgb ( 192 , 192 , 0 ) ) ;
 renderblocco ( 7  , rgb ( 192 , 0 , 192 ) ) ;
}
 void  rendercampo(){
 number x;
 number y;
 number n;
 paper ( rgb ( 40 , 160 , 40 ) ) ;
 cls ( ) ;
for(y=0 ;y<=480 ;y+=16){
for(x=0 ;x<=500 ;x+=32){
 pasteicon ( x , y , 10 ) ;
}
}

 ink ( rgb ( 255 , 255 , 255 ) ) ;
 bar ( 0 , 0 , 640 , 2 ) ;
 bar ( 0 , 0 , 2 , 480 ) ;
 bar ( 514 , 0 , 516 , 480 ) ;


 n = setvar( 3);
for(x=0 ;x<=7;x++){
for(y=0 ;y<=3;y++){
 n = setvar( add(n,1));
 sprite ( n , add(x*64,add(2,32)) , add(y*32,24) , ( add(rnd ( 5 ) ,2) ) ) ;
}
}
}
 void  game(){
 number palline;
 number punti;
 number x;
 number y;
 number vx;
 number vy;
 number vivo;
 number i;

 palline = setvar( 3);
 punti = setvar( 0);
 rendercampo ( ) ;
	while( palline >0){
 x = setvar( 250);
 y = setvar( 460);
 vx = setvar( 0);
 vy = setvar( 0);

 sprite  ( 1 , 320 , 445 , 1 ) ;
 sprite  ( 2 , 320 , 460 , 2 ) ;

	while( ysprite(1)<460){
		if( key(k_esc)){
break;
}

		if( key(k_left)){
 x = setvar( x-4);
			if( x<34 ){
 x = setvar( 34);
}
}
		if( key(k_right)){
 x = setvar( add(x,4));
			if( x>482 ){
 x = setvar( 482);
}
}
		if( key(k_space) or key(k_up)){
			if( vx==0 and vy==0 ){
 vx = setvar( 2);
 vy = setvar( -2);
}
}

		if( vx==0 and vy==0 ){
 sprite ( 1 , x , ysprite ( 1 ) , 1 ) ;
}


		if( xsprite(1)<12 ){
 vx = setvar( abs ( vx ) );
}
		if( xsprite(1)>504 ){
 vx = setvar( -abs ( vx ) );
}

		if( ysprite(1)< 12 ){
 vy = setvar( abs ( vy ) );
}



		if( spritehit(1,2) ){
 vx = setvar( fix ( ( xsprite ( 1 ) -xsprite ( 2 ) ) /10 ) );
			  if( abs(vx)>3 ){ 
 vx = setvar( 3*sgn ( vx ) );
}
 vy = setvar( abs ( vx ) -4);
			//while key(k_space)=0
			//end while
}

 vivo = setvar( 0);
for(i =3 ;i <=35;i ++){
			if( spritehit(1,i) ){
				if( abs(xsprite(i))-abs(xsprite(1))<32 ){
				    if( ysprite(i)<ysprite(1) ){
 vy = setvar( abs ( vy ) );
}
				    if( ysprite(i)>ysprite(1) ){
 vy = setvar( -abs ( vy ) );
}
}else{
				    if( xsprite(i)<xsprite(1) ){
 vx = setvar( abs ( vx ) );
}
				    if( xsprite(i)>xsprite(1) ){
 vx = setvar( -abs ( vx ) );
}
}

 deletesprite ( i ) ;
 punti = setvar( add(punti ,100));
 i = setvar( 44);
}
}
for(i =3 ;i <=35;i ++){
			if( livesprite(i)){
 vivo = setvar( add(vivo,1));
}
}
		if( vivo==0 ){
 rendercampo ( ) ;
 x = setvar( 250);
 y = setvar( 460);
 vx = setvar( 0);
 vy = setvar( 0);
 sprite  ( 1 , 320 , 445 , 1 ) ;
 sprite  ( 2 , 320 , 460 , 2 ) ;
}

 sprite ( 1 , add(xsprite ( 1 ) ,vx) , add(ysprite ( 1 ) ,vy) , 1 ) ;
 sprite  ( 2 , x , y , 2 ) ;
 locate  ( 60 , 1 ) ;
 prints ( "balls" ) ;
 locate  ( 62 , 3 ) ;
 prints ( strS ( palline ) ) ;

 locate  ( 60 , 5 ) ;
 prints ( "score" ) ;
 locate  ( 62 , 6 ) ;
 prints ( strS ( punti ) ) ;



 locate  ( 60 , 8 ) ;
 fprints ( add("vx:",strS(vx) ) ) ;
 prints ( "  " ) ;
 locate  ( 60 , 9 ) ;
 fprints ( add("vy:",strS(vy) ) ) ;
 prints ( "  " ) ;

 screenswap ( ) ;
}
 palline = setvar( palline  -1);
}
}
 void  titolo(){
 integer i ;
 number y;
 number x;
for(i=1 ;i<=35;i++){
 deletesprite ( i ) ;
}
 //paper ( 0 ) ;
 screenopen ( 0 , add(640,32) , add(480,32) , 0 , 0 , 640 , 480 , 0 ) ;
 ink ( rgb ( 0 , 255 , 0 ) ) ;
 bar  ( 50 , 50 , 200 , 200 ) ;
for(y=0 ;y<=add(480,32 );y+=16){
for(x=0 ;x<=add(640,32 );x+=32){
 pasteicon ( x , y , 10 ) ;
}
}

 screenopen ( 1 , 640 , 480 , 0 , 0 , 640 , 480 , 2 ) ;
 ink ( rgb ( 255 , 0 , 0 ) ) ;
 text ( 50 , 210 , 64 , "Arcanoid" ) ;
 text ( 420 , 240 , 32 , "sdlBasic" ) ;
 text  ( 200 , 350 , 12 , "press enter to start" ) ;
 ink ( rgb ( 255 , 255 , 255 ) ) ;
 line ( 10 , 280 , 630 , 280 ) ;
 screen ( 0 ) ;

 i = setvar( 0);
	while( inkey()!=13){
 offset ( i , i ) ;
 screenswap ( ) ;
 i = setvar( ( add(i,1) ) );
		if( i>32 ){ 
 i = setvar( i-32  );
}
		if( key(k_esc) ){ 
 end ( ) ;
}
}
 screenclose ( 1 ) ;
 screenopen ( 0 , 640 , 480 , 0 , 0 , 640 , 480 , 0 ) ;
 cls ( ) ;
}
 void  mymain(){
 init ( ) ;
	while( inkey()!=27){

 titolo ( ) ;
 game ( ) ;
	//	score


}
}

 void  b2cmain(){
//#!/usr/local/bin/sdlBasic
//
// sdlBasic game: Arcanoid
//
//   Name:      arcanoid.sdlbas
//   Purpose:   simple clone of breakout
//  Author:     __vroby__    ( __vroby__@libero.it )
//  Licence:    LGPL
//
// Bugs:
//
// Todo:
//  audio part
//
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 setdisplay ( 640 , 480 , 16 , 0 ) ;
 autoback ( -15 ) ;
 mousehide ( ) ;
 cursoff ( ) ;

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 mymain ( ) ;
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
