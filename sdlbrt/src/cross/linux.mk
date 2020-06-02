TARGET= ../bin/sdlbrt

ifndef prefix
    prefix=/usr
endif

exec_prefix=$(prefix)/bin
font_prefix=$(prefix)/share/fonts/truetype

stripped=yes
compress=no

CC= gcc
CPP=g++
INSTALL=/usr/bin/install
RM=rm

SDL_FLAGS=$(shell sdl-config --cflags)

SDL_LIBS=$(shell sdl-config --libs)

CFLAGS = -Wall -g -pg -O3 $(SDL_FLAGS) -DPLAY_MOD -DUNIX  


LIBS = $(SDL_LIBS) -lSDL_mixer -lSDL_image -lSDL_ttf -lSDL_net -lsqlite3

DEFINES= -DSDLENGINE_SUPPORT -DCD_SUPPORT -DSOCKET_SUPPORT -DSQLITE_SUPPORT -DMEMORYBANK_SUPPORT
#DEFINES= -DSDLENGINE_SUPPORT -DCD_SUPPORT -DVIDEOMPEG_SUPPORT  -DSOCKET_SUPPORT -DSQLITE_SUPPORT -DMEMORYBANK_SUPPORT

