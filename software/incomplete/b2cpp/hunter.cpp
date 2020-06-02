//b2c.sdlbas:hunter.sdlbas->hunter.cpp
#include "lib/core.h"
#include "lib/SDLengine.h"

 number score;
 void  init(){
 integer i ;

 screenopen ( 7 , 32 , 32 , 0 , 0 , 0 , 0 , 0 ) ;
    //space ship
 cls ( ) ;
 ink ( 0xffffff ) ;
 line ( 16 , 0 , 8 , 32 ) ;
 line ( 16 , 0 , 24 , 32 ) ;
 line ( 8 , 32 , 16 , 24 ) ;
 line ( 24 , 32 , 16 , 24 ) ;
 ink ( 1 ) ;
 paint ( 16 , 16 ) ;

 grab ( 100 , 0 , 0 , 32 , 32 ) ;

 hotspot ( 100 , 1 , 1 ) ;
for(i =1 ;i <=35;i ++){
 copyimage ( 100 , add(100,i) ) ;
 rotateimage ( add(100,i) , 360- ( 10*i ) ) ;
 hotspot ( add(100,i) , 1 , 1 ) ;
}

    //enemy ship
 cls ( ) ;
 ink ( 0xffffff ) ;
 circle ( 16 , 16 , 8 ) ;
 ellipse ( 16 , 16 , 8 , 6 ) ;
 ink ( 1 ) ;
 paint ( 16 , 16 ) ;
 grab ( 200 , 0 , 0 , 32 , 32 ) ;
 hotspot ( 200 , 1 , 1 ) ;

    //fire shot
 cls ( ) ;
 ink ( 0xffffff ) ;
 circle ( 16 , 16 , 2 ) ;
 grab ( 300 , 0 , 0 , 32 , 32 ) ;
 hotspot ( 300 , 1 , 1 ) ;

 screenclose ( 7 ) ;

 score = setvar( 0);
}
 void  game(){
 number x;
 number y;
 number v;
 number vx;
 number vy;
 number fr;
 number ship;
 number fx;
 number fy;
 number fv;
 number fvx;
 number fvy;
 number ffr;
 number fire;
 number ex;
 number ey;
 number ev;
 number evx;
 number evy;
 number efr;
 number enemy;
 number efx;
 number efy;
 number efv;
 number efvx;
 number efvy;
 number effr;
 number efire;
 number ir;
 number ships;
 number k_left;
 number k_right;
 number k_up;
 number k_down;
 number k_space;

 k_left = setvar( 276);
 k_right = setvar( 275);
 k_up = setvar( 273);
 k_down = setvar( 274);
 k_space = setvar( 32);

 ships = setvar( 3);
 score = setvar( 0);
    //ship
 x = setvar( 320);
 y = setvar( 240);
 v = setvar( 0);
 vx = setvar( 0);
 vy = setvar( 0);
 fr = setvar( 0  );
 ship = setvar( 0);
    //fire
 fx = setvar( 50);
 fy = setvar( 240);
 fv = setvar( 0);
 fvx = setvar( 0);
 fvy = setvar( 0);
 ffr = setvar( 300  );
 fire = setvar( 0);

    //enemy
 ex = setvar( 50);
 ey = setvar( 240);
 ev = setvar( 0);
 evx = setvar( 0);
 evy = setvar( 0);
 efr = setvar( 200  );
 enemy = setvar( 0);
    //enemy fire
 efx = setvar( 50);
 efy = setvar( 240);
 efv = setvar( 0);
 efvx = setvar( 0);
 efvy = setvar( 0);
 effr = setvar( 300  );
 efire = setvar( 0);




    while( key(27)==0){

	//ship move
	if( key(k_left) ){
 fr = setvar( fr-1);
}
	if( fr<0 ){ 
 fr = setvar( add(fr,36 ) );
}

	if( key(k_right) ){
 fr = setvar( add(fr,1));
}
	if( fr>35 ){ 
 fr = setvar( fr-36  );
}

	if( key(k_up) ){
 ir = setvar( fr  * ( 3.14/18 ) );
 vx = setvar( add(vx ,(sin(ir) ) ) );
 vy = setvar( vy  - ( cos ( ir ) ) );
}

	if( key(k_space) ){
 fire = setvar( 50);
 ir = setvar( fr  * ( 3.14/18 ) );
 fvx = setvar( ( sin ( ir ) ) *10);
 fvy = setvar( - ( cos ( ir ) ) *10);
 fx = setvar( x);
 fy = setvar( y);
}

 x = setvar( add(x,vx));
	if( x>640 ){
 x = setvar( x-640  );
}
	if( x<0 ){
 x = setvar( add(x,640 ) );
}
 y = setvar( add(y,vy));
	if( y>480 ){
 y = setvar( y-480  );
}
	if( y<0 ){
 y = setvar( add(y,480 ) );
}
	if( ship<0 ){
 ship = setvar( add(ship,1));
 deletesprite ( 1 ) ;
}else{
 sprite  ( 1 , x , y , add(100,fr) ) ;
}
	//---------

	//fire move
	if( fire >0 ){
 fire  = setvar( fire-1);
 fx = setvar( add(fx,fvx));
 fy = setvar( add(fy,fvy));
 sprite ( 3 , fx , fy , ffr ) ;
	    if( fire==0 ){
 deletesprite ( 3 ) ;
}
}
	//---------

	//fire collision
	if( spritehit(2,3) ){
 score = setvar( add(score,100));
 ex = setvar( -rnd ( 640 ) );
 ey = setvar( rnd ( 480 ) );
 evx = setvar( 0);
 evy = setvar( 0);
 enemy = setvar( -50);
}
	//---------


	//enemy move
	if( rnd(10)>7 ){
 evx = setvar( add(evx,rnd(4) ) -2);
 evy = setvar( add(evy,rnd(4) ) -2);
}

	if( enemy==0 and efire==0 ){
	    if( abs(ex-y)<10 or abs(ey-x)<10 ){
 efire = setvar( 100);
 efvx = setvar( -sgn ( ex-x ) *5);
 efvy = setvar( -sgn ( ey-y ) *5);

 efx = setvar( ex);
 efy = setvar( ey);
}

	    if( abs(ex-x)<10 or abs(ey-y)<10 ){
 efire = setvar( 100);
 efvx = setvar( -sgn ( ex-x ) *5);
 efvy = setvar( -sgn ( ey-y ) *5);

 efx = setvar( ex);
 efy = setvar( ey);
}
}

 ex = setvar( add(ex,evx));
	if( ex>640 ){
 ex = setvar( ex-640  );
}
	if( ex<0 ){
 ex = setvar( add(ex,640 ) );
}
 ey = setvar( add(ey,evy));
	if( ey>480 ){
 ey = setvar( ey-480  );
}
	if( ey<0 ){
 ey = setvar( add(ey,480 ) );
}
	if( enemy <0 ){
 enemy = setvar( add(enemy,1));
 deletesprite ( 2 ) ;
}else{
 sprite ( 2 , ex , ey , 200 ) ;
}
	//---------

	//enemy fire move
	if( efire >0 ){
 efire  = setvar( efire-1);
 efx = setvar( add(efx,efvx));
 efy = setvar( add(efy,efvy));
 sprite ( 4 , efx , efy , effr ) ;
	    if( efire==0 ){
 deletesprite ( 4 ) ;
}
}
	//---------

	//enemy fire collision
	if( spritehit(1,4) ){
 ships = setvar( ships-1);
 x = setvar( 320);
 y = setvar( 240);
 vy = setvar( 0);
 vx = setvar( 0);
 ship = setvar( -25);
}
	//---------

	//enemy  collision
	if( spritehit(1,2) ){
 ships = setvar( ships-1);
 x = setvar( 320);
 y = setvar( 240);
 vy = setvar( 0);
 vx = setvar( 0);
 score = setvar( add(score,100));
 ex = setvar( rnd ( 640 ) );
 ey = setvar( rnd ( 480 ) );
 ship = setvar( -25);
 enemy = setvar( -50);
}
	//---------


 locate ( 0 , 0 ) ;
 fprints ( add("ships",strS(ships) ) ) ;
 prints ( add(" Score",strS(score) ) ) ;

	if( ships==0 ){
break;
}

 screenswap ( ) ;
}
if( ships==0 ){
return;
}
}
 void  titolo(){
 deletesprite ( 1 ) ;
 deletesprite ( 2 ) ;
 deletesprite ( 3 ) ;
 deletesprite ( 4 ) ;
 cls ( ) ;
 ink ( 0xffffff ) ;
 text ( 250 , 220 , 20 , "hunter" , -1 ) ;
 text ( 250 , 260 , 10 , "press return to start" , -1 ) ;
 text ( 280 , 280 , 10 , add("last score ",strS(score) ) , -1 ) ;
 screenswap ( ) ;
 waitkey ( 13 ) ;
 cls ( ) ;
}
 void  appmain(){
 init ( ) ;
    while( key(27)==0){
 titolo ( ) ;
 game ( ) ;
}

}

 void  b2cmain(){
//hunter


 //common score
 setdisplay ( 640 , 480 , 32 , 1 ) ;
 autoback ( -25 ) ;
 mousehide ( ) ;









 appmain ( ) ;
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
