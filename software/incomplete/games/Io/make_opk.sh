#!/bin/sh

OPK_NAME=io.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=Io example
Comment=SDLBasic example
Exec=sdlbrt io.sdlbas
Terminal=false
Type=Application
StartupNotify=true
Icon=io
Categories=games;
Name[es]=Io ejemplo
Comment[es]=Ejemplo SDLBasic
EOF

# create opk
FLIST="media"
FLIST="${FLIST} sdlbrt"
FLIST="${FLIST} io.sdlbas"
FLIST="${FLIST} io.sh"
FLIST="${FLIST} io.png"
FLIST="${FLIST} default.gcw0.desktop"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop

