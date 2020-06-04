#!/bin/sh

if [ ! -f "/media/home/.sdlbasic/share/fonts/ttf/pfcb.ttf" ]; then
	mkdir /media/home/.sdlbasic
	mkdir /media/home/.sdlbasic/share
	mkdir /media/home/.sdlbasic/share/fonts
	mkdir /media/home/.sdlbasic/share/fonts/ttf
	cp pfcb.ttf /media/home/.sdlbasic/share/fonts/ttf
fi

FILE=$1
SDLBASIC=$PWD/sdlbrt
GAMEDIR=$(dirname "${FILE}")
cd $GAMEDIR
echo "Executing:" $SDLBASIC $FILE
$SDLBASIC $FILE
