#!/bin/sh

OPK_NAME=sdlbasic_engine.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=SDLBasic
Comment=Play SDLBasic games
Exec=run.sh %f
Terminal=false
Type=Application
StartupNotify=true
Icon=sdlbrt
MimeType=custom/sdlbas,bas;
Categories=games;
Comment[es]=Ejecuta juegos SDLBasic
EOF

# create opk
FLIST="sdlbrt"
FLIST="${FLIST} run.sh"
FLIST="${FLIST} pfcb.ttf"
FLIST="${FLIST} sdlbrt.png"
FLIST="${FLIST} share"
FLIST="${FLIST} default.gcw0.desktop"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop

