
CROSS=mipsel-linux-

SDK    = /opt/gcw0-toolchain/usr
PREFIX = $(SDK)/mipsel-gcw0-linux-uclibc/sysroot/usr

OPATH := $(PATH)
PATH  := $(OPATH):$(SDK)/bin

exec_prefix=$(PREFIX)/bin
font_prefix=/media/home/.sdlbasic/share/fonts/ttf

stripped=yes
compress=no

CC= $(CROSS)gcc
CPP= $(CROSS)g++
LD= $(CROSS)ld
NM= $(CROSS)nm
STRIP= $(CROSS)strip
AS= $(CROSS)as

#INSTALL=../install
RM=rm

CFLAGS = -O3 -ffast-math -fomit-frame-pointer
CFLAGS += -I$(PREFIX)/include -D_REENTRAT -DPLAY_MOD -DUNIX -DRG350 -DBOBHIT_ISO

LIBS   = -L$(PREFIX)/lib -lSDL_mixer -lSDL_image -lSDL_ttf -lfreetype -lSDL_net -lSDL -lpng -lz -ljpeg -lm -lpthread -lsqlite3

#DEFINES= -DSDLENGINE_SUPPORT -DSOCKET_SUPPORT -DVIDEOMPEG_SUPPORT -DSQLITE_SUPPORT -DMEMORYBANK_SUPPORT
DEFINES= -DSDLENGINE_SUPPORT -DSOCKET_SUPPORT -DSQLITE_SUPPORT -DMEMORYBANK_SUPPORT
