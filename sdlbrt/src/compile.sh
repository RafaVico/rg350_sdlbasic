#echo "--- compile linux ----------------------------------------------"
#make -f cross/makefile os=linux clean >/dev/null
make -f cross/makefile os=linux
#echo "----------------------------------------------------------------"

#echo "--- compile win32 ----------------------------------------------"
#make -f cross/makefile os=win32 clean >/dev/null
#make -f cross/makefile os=win32 >/dev/null
#echo "----------------------------------------------------------------"

#echo "--- compile open2x ---------------------------------------------"
#make -f cross/makefile os=open2x clean >/dev/null
#make -f cross/makefile os=open2x
#echo "----------------------------------------------------------------"

echo "--- compile rg350 ---------------------------------------------"
#make -f cross/makefile os=open2x clean >/dev/null
make -f cross/makefile os=rg350
echo "----------------------------------------------------------------"

