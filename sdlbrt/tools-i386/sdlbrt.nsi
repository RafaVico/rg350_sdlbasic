; Script generated by the HM NIS Edit Script Wizard.

RequestExecutionLevel admin

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "sdlbrt"
!define PRODUCT_VERSION "Alcor"
!define PRODUCT_PUBLISHER "vroby"
!define PRODUCT_WEB_SITE "http://sdlbasic.sourceforge.net"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\makensis.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "z:\home\sdlbasic\source\sdlbasic2013\sdlBasic\win32\share\doc\sdlBasic\english\lgpl.txt"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "sdlBasic"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "sdlbrt-setup.exe"
InstallDir "$PROGRAMFILES\sdlBasic"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "runtime" SEC01
  SetOutPath "$INSTDIR\bin"
  File "${NSISDIR}\COPYING"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\win32\bin\sdlbrt.exe"
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"

  SetOutPath "$INSTDIR\share\sdlBasic"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlBasic\win32\share\sdlBasic\sdlBasic.png"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlBasic\win32\share\sdlBasic\sdlnow.gif"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlBasic\win32\share\sdlBasic\lizard.mod"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlBasic\win32\share\sdlBasic\clickme.sdlbas"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\clickme.lnk" '$INSTDIR\share\sdlBasic\clickme.sdlbas"'

  SetOutPath "$WINDIR\fonts"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\win32\share\fonts\ttf\dejavu\DejaVuSans.ttf"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\win32\share\fonts\ttf\dejavu\DejaVuSansMono-Roman.ttf"
SectionEnd


Section "libraries" SEC03
  SetOutPath "$SYSDIR"
  SetOverwrite ifnewer
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\SDL.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\SDL_image.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\SDL_mixer.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\SDL_net.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\SDL_ttf.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libFLAC-8.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libfreetype-6.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libjpeg-8.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libmikmod-2.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libogg-0.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libpng15-15.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libtiff-5.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libvorbis-0.dll"	
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\libvorbisfile-3.dll"	
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\smpeg.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\zlib.dll"
  File "z:\home\sdlbasic\source\sdlbasic2013\sdlbrt\packages\sdl-win32\zlib1.dll"
SectionEnd


Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"

  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\sdlbrt-Uninstall.lnk" "$INSTDIR\sdlbrt-uninst.exe"
SectionEnd

Section -Post
  ;register association
  WriteRegStr HKCR ".sdlbas" "" "sdlBasicFile"
  WriteRegStr HKCR "sdlBasicFile" "" "sdlBasic program runtime"
  WriteRegStr HKCR "sdlBasicFile\shell" "" "open"
  WriteRegStr HKCR "sdlBasicFile\DefaultIcon" "" "$INSTDIR\bin\sdlbrt.exe,3"
  WriteRegStr HKCR "sdlBasicFile\shell\open\command" "" '$INSTDIR\bin\sdlbrt.exe "%1"'
  #WriteRegStr HKCR "sdlBasicFile\shell\edit\command" "" '$INSTDIR\bin\sdlBasic.exe "%1"'

  WriteRegStr HKCR ".sdlblib" "" "sdlBasicLibrary"
  WriteRegStr HKCR "sdlBasicLibrary" "" "sdlBasic program runtime"
  WriteRegStr HKCR "sdlBasicLibrary\DefaultIcon" "" "$INSTDIR\sdlbrt.exe,2"


  WriteUninstaller "$INSTDIR\sdlbrt-uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\makensis.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\sdlbrt-uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\makensis.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "${PRODUCT_STARTMENU_REGVAL}" "$ICONS_GROUP"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "run time software"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "preliminary documentation (italiano-english available)"
  !insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) has been completely removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all components? " IDYES +2
  Abort
FunctionEnd

Section Uninstall
  ReadRegStr $ICONS_GROUP ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "${PRODUCT_STARTMENU_REGVAL}"
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\sdlbrt-uninst.exe"
  
  Delete "$INSTDIR\share\sdlBasic\clickme.sdlbas"
  Delete "$INSTDIR\share\sdlBasic\lizard.mod"
  Delete "$INSTDIR\share\sdlBasic\sdlBasic.png"
  Delete "$INSTDIR\share\sdlBasic\sdlnow.gif"
  Delete "$INSTDIR\bin\sdlbrt.exe"
  Delete "$INSTDIR\bin\COPYING"
 
  Delete "$WINDIR\fonts\DejaVuSansMono-Roman.ttf"
  Delete "$WINDIR\fonts\DejaVuSans.ttf"
  
  Delete "$SYSDIR\zlib.dll"
  Delete "$SYSDIR\libtiff.dll"
  Delete "$SYSDIR\jpeg.dll"
  Delete "$SYSDIR\libpng1.dll"
  Delete "$SYSDIR\SDL.dll"
  Delete "$SYSDIR\SDL_image.dll"
  Delete "$SYSDIR\smpeg.dll"
  Delete "$SYSDIR\SDL_mixer.dll"
  Delete "$SYSDIR\SDL_net.dll"
  Delete "$SYSDIR\SDL_ttf.dll"
  Delete "$INSTDIR\License.txt"
  Delete "$INSTDIR\makensis.exe"
  
  RMDir  "$INSTDIR\share\sdlBasic"
  RMDir  "$INSTDIR\share"
  RMDir  "$INSTDIR\bin"
  RMDir  "$INSTDIR"


  Delete "$SMPROGRAMS\$ICONS_GROUP\sdlbrt-Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\clickme.lnk"
  
  Delete "$DESKTOP\sdlBasic.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\sdlBasic.lnk"
  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$SMPROGRAMS"
  
  RMDir "$WINDIR\fonts"
  RMDir "$WINDIR"
  RMDir "$SYSDIR"
 
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
