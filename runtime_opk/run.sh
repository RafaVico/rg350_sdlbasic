#!/bin/sh
FILE=$1
SDLBASIC=$PWD/sdlbrt
GAMEDIR=$(dirname "${FILE}")
cd $GAMEDIR
echo "Executing:" $SDLBASIC $FILE
$SDLBASIC $FILE
