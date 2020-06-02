//core.h

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define string char*
#define integer int
#define number double

// sdlBasic constant
#define k_space 32
#define k_up  	273
#define k_down  274
#define k_right 275
#define k_left  276

#define k_esc 27


//____________________________________________________________________________________________________________________

// base
//____________________________________________________________________________________________________________________


double setvar(double v){
    return v;
}
//____________________________________________________________________________________________________________________

double setvar(int v){
    return (double)v;
}
//____________________________________________________________________________________________________________________

char *setvar(char *v){
    char *var;
    var= (char *)malloc(strlen(v)+1);
    strcpy(var,v);
    strcat(var,"\0");
    return var;
}
//____________________________________________________________________________________________________________________

double add(double var,double v){
    return var+v;
}
//____________________________________________________________________________________________________________________


char *add(char *var,char *v){
    string tmp;
    tmp=(char *)malloc(strlen(var)+strlen(v)+1);
    strcpy(tmp,var);
    strcat(tmp,v);

    return tmp;
}
//____________________________________________________________________________________________________________________
void end(){
    exit(0);
}
//____________________________________________________________________________________________________________________



// string
//____________________________________________________________________________________________________________________



//asc(char)				: returns ascii value of first char in string
int asc(char *c)
{
    return (int)c[0];
}


/*
chr(v)					: return string corresponding to ascii key value
chr$(v)					: return string corresponding to ascii key value
*format()				: returns formatted string with embedded args
*format$()				: returns formatted string with embedded args
insert(source$,target$,position)	: insert source string to target at index
insert$(source$,target$,position)	: insert source string to target at index
instr(optional start,source$,target$)	: returns position in source that target was found
*/

//lcase(string$)				: convert string to lower case
//lcase$(string$)				: convert string to lower case
char *lcase(char *var){
    char *tmp;
    int i;
    tmp=(char *)malloc(strlen(var));
    for(i=0;i<strlen(var);i++)
	tmp[i]=tolower(var[i]);
    return tmp;
}
#define lcaseS lcase
//____________________________________________________________________________________________________________________

//left(string$,number)			: returns leftmost chars in string
//left$(string$,number)			: returns leftmost chars in string
char *left(char *var,int l){
    string tmp;
    tmp=(char *)malloc(l+1);

    strncpy(tmp,var,l);
    strcat(tmp,"\0");

    return tmp;
}
#define leftS left
//____________________________________________________________________________________________________________________

//len(string$)				: return length of string
//length(string$)				: return length of string
int len(string var)
{
    return strlen(var);
}
#define length len
//____________________________________________________________________________________________________________________
/*
ltrim(string$)				: returns string with left whitespace removed
ltrim$(string$)				: returns string with left whitespace removed
*/
//mid(string$,start,optional end)		: returns string with chars 1..n from source
//mid$(string$,start,optional end)	: returns string with chars 1..n from source
char *mid(char *var,int s,int l){
    string tmp;
    tmp=(char *)malloc(l+1);

    strncpy(&tmp[s],var,l);
    strcat(tmp,"\0");

    return tmp;
}

char *mid(char *var,int s){
    int l;
    string tmp;
    l=strlen(var)-s;
    tmp=(char *)malloc(l+1);

    strncpy(&tmp[s],var,l);
    strcat(tmp,"\0");

    return tmp;
}
#define midS mid
//____________________________________________________________________________________________________________________
/*
replace(opt index,source$,replace$)	: replace string from source with replace starting at index
replace$(opt index,source$,replace$)	: replace string from source with replace starting at index
replacesubstr(source$,rep$)		: replace substring in source with withstring return the new string
replacesubstr$(source$,rep$)		: replace substring in source with withstring return the new string
reverse(string$)			: reverse a string return the new string
reverse$(string$)			: reverse a string return the new string
*/
//right(string$,number)			: returns rightmost chars in string
//right$(string$,number)			: returns rightmost chars in string
char *right(char *var,int l){
    string tmp;
    tmp=(char *)malloc(l+1);

    strncpy(&tmp[strlen(var)-l],var,l);
    strcat(tmp,"\0");

    return tmp;
}
#define rightS right
//____________________________________________________________________________________________________________________
/*
rinstr(optional start,source$,target$)	: reverse Instr function, search from end to start
rtrim(string$)				: right trim string
rtrim$(string$)				: right trim string
space(n)				: return string with n spaces in it
space$(n)				: return string with n spaces in it
*/
//str(value)				: return string representation of numeric expression
//str$(value)				: return string representation of numeric expression
//strf(value)				: converts a floating point or number value to a string
//strf$(value)				: converts a floating point or number value to a string
char *str(int i)
{
    char *txt;
    txt=(char *)malloc(16);
    sprintf(txt,"%d",i);
    return txt;

}
#define strS str
#define strf str
#define strfS str
//____________________________________________________________________________________________________________________
/*
string(n,string$)			: returns string m chars wide with n in it
string$(n,string$)			: returns string m chars wide with n in it
tally(src$,sub$)			: returns number of occurances of matchstring
trim(string$)				: trim string
trim$(string$)				: trim string
typeof(variable)			: returns string with datatype
typeof$(variable)			: returns string with datatype
*/

//ucase(string$)				: convert string to upper case
//ucase$(string$)				: convert string to upper case
string ucase(string var)
{
    char *tmp;
    int i;
    tmp=(char *)malloc(strlen(var));
    for(i=0;i<strlen(var);i++)
	tmp[i]=toupper(var[i]);
    return tmp;
}
#define ucaseS ucase
//____________________________________________________________________________________________________________________



//val(string$)				: returns closest numeric representation of number
int val(string var)
{
    return atof(var);
}
//____________________________________________________________________________________________________________________

// maths
//____________________________________________________________________________________________________________________

/*
abs(value)				: returns absolute value of number
acos(value)				: returns arccos of number
asin(value)				: returns arcsin of number
atan(value)				: returns arctan of number
bin(value)				: returns binary representation of number
bin$(value)				: returns binary representation of number
cos(value)				: returns cos of number
exp(value)				: returns exponential function
*/

//fix(value)				: truncate fractional number, rounding down towards zero
int fix(number value)
{
    return (int) value;
}
/*
floor(value)				: truncate fractional number, rounding down towards zero
frac(value)				: return fractional portion of number
hex(value)				: returns hexidecimal representation of number
hex$(value)				: returns hexidecimal representation of number
int(value)				: convert to 32 bit integer, truncating decimals
log(value)				: returns natural log of expression
*/

//randomize(value)			: reseed the random number generator
int randomize( int seed)
{
    srand(seed);
    return 0;
}
//____________________________________________________________________________________________________________________

//rnd(optional upper)			: return an random number
int rnd(int upper)
{
    return (rand() % (upper-1))+1;
}
number rnd()
{
    return ((rand() % (1000-1))+1)/1000;
}
//____________________________________________________________________________________________________________________
/*
round(value)				: round to nearest integer
*/

//sgn(value)				: returns sign of numeric expression
int sgn( number n)
{
    if (n>=0) return 1;
    else return -1;
}
//____________________________________________________________________________________________________________________

/*
sin(value)				: returns sine of given angle in radians
sqr(value)				: return square root - make sure it's non-negative
tan(value)				: return tanget of given angle in radians
min(value1,value2)			: return min number of the operands
max(value1,value2)			: return max number of the operands
bitwiseand(value1,value2)		: return the logic and of the operands
andbit(value1,value2)			: return the logic and of the operands
bitwiseor(value1,value2)		: return the logic or of the operands
orbit(value1,value2)			: return the logic or of the operands
bitwisexor(value1,value2)		: return the logic xor of the operands
xorbit(value1,value2)			: return the logic xor of the operands
*/




