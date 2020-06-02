;	Shadow of the Beast
;		by cbmeeks
;		cbm@signaldev.com
;
;			Long live the Amiga!
;	please vist:		http://metroidclassic.com    and  http://signaldev.com
;
;	This was programmed in about 8 hours (with 5.5 of those just "goofing off")
;	I saw the Shadow of the Beast demo that someone did for the "other" basic
;	and I couldn't let it be the only one.  I think mine is better.  :-P
;
;	Please send me and email and let me know what you think!


;setup

Graphics 640,480,16,1
SetBuffer BackBuffer()
ClsColor 0,0,0
Cls

;load media

Global grass1 = LoadImage("media\grass1.png")
Global grass2 = LoadImage("media\grass2.png")
Global grass3 = LoadImage("media\grass3.png")
Global grass4 = LoadImage("media\grass4.png")
MaskImage grass1,255,0,255
MaskImage grass2,255,0,255
MaskImage grass3,255,0,255
MaskImage grass4,255,0,255

Global clouds1 = LoadImage("media\clouds1.png")
Global clouds2 = LoadImage("media\clouds2.png")
Global clouds3 = LoadImage("media\clouds3.png")
Global clouds4 = LoadImage("media\clouds4.png")
Global clouds5 = LoadImage("media\clouds5.png")
MaskImage clouds1,255,0,255
MaskImage clouds2,255,0,255
MaskImage clouds3,255,0,255
MaskImage clouds4,255,0,255
MaskImage clouds5,255,0,255

Global wall = LoadImage("media\wall.png")
MaskImage wall,255,0,255

Global moon = LoadImage("media\moon.png")
MaskImage moon,255,0,255

Global mountains = LoadImage("media\mountains.png")
MaskImage mountains,255,0,255

Global blimp = LoadImage("media\blimp.png")
Global blimpsmall = LoadImage("media\blimp_small.png")
MaskImage blimp,255,0,255
MaskImage blimpsmall,255,0,255

Global background = LoadImage("media\background.png")

Global splash = LoadImage("media\splash.png")
Global splash2 = LoadImage("media\splash2.png")
MaskImage splash,255,0,255
MaskImage splash2,255,0,255

Global tree = LoadImage("media\tree.png")
MaskImage tree,255,0,255

Global audio1 = PlayMusic("media\b-title.mod",1)

;variables
Global Timer, FPS_Real, FPS_Temp,FPS, fpsok = 0
Global wallspeed = 12
Global wallx = 100

Global grass1speed = 2, grassx1 = 0
Global grass2speed = 5, grassx2 = 0
Global grass3speed = 8, grassx3 = 0
Global grass4speed = 10, grassx4 = 0

Global mountainspeed = 1, mountainx = 0

Global cloud1speed = 5, cloud1x = 0
Global cloud2speed = 4, cloud2x = 0
Global cloud3speed = 3, cloud3x = 0
Global cloud4speed = 2, cloud4x = 0
Global cloud5speed = 1, cloud5x = 0

Global blimpspeed# = .6, blimpx# = -2000
Global blimpsmallspeed# = .4, blimpsmallx#=1700

Global splashspeed = 2, splashx=10, splashpause=500, splashmove = False, splashdir = 1, splashcount=True

Global treespeed = 8, treex = 1000

Repeat

	;background
	DrawImage background,0,0

	;grass
	DrawImage grass4,grassx4,454
	DrawImage grass4,grassx4+640,454
	grassx4 = grassx4 - grass4speed
	If grassx4 < -640 Then grassx4 = 0

	DrawImage grass3,grassx3,435
	DrawImage grass3,grassx3+640,435
	grassx3 = grassx3 - grass3speed
	If grassx3 < -640 Then grassx3 = 0

	DrawImage grass2,grassx2,423
	DrawImage grass2,grassx2+640,423
	grassx2 = grassx2 - grass2speed
	If grassx2 < -640 Then grassx2 = 0

	DrawImage grass1,grassx1,415
	DrawImage grass1,grassx1+640,415
	grassx1 = grassx1 - grass1speed
	If grassx1 < -640 Then grassx1 = 0

	;mountains
	DrawImage mountains,mountainx,245
	DrawImage mountains,mountainx + 640,245
	mountainx = mountainx - mountainspeed
	If mountainx < -640 Then mountainx = 0

	;moon
	DrawImage moon,470,50

	;clouds
	DrawImage clouds1,cloud1x,0
	DrawImage clouds1,cloud1x + 640,0

	DrawImage clouds2,cloud2x,50
	DrawImage clouds2,cloud2x + 640,50

	DrawImage clouds3,cloud3x,131
	DrawImage clouds3,cloud3x + 640,131

	DrawImage clouds4,cloud4x,176
	DrawImage clouds4,cloud4x + 640,176

	DrawImage clouds5,cloud5x,200
	DrawImage clouds5,cloud5x + 640,200
		
	cloud1x = cloud1x - cloud1speed
	cloud2x = cloud2x - cloud2speed
	cloud3x = cloud3x - cloud3speed
	cloud4x = cloud4x - cloud4speed
	cloud5x = cloud5x - cloud5speed
		
	If cloud1x < -640 Then cloud1x = 0
	If cloud2x < -640 Then cloud2x = 0
	If cloud3x < -640 Then cloud3x = 0
	If cloud4x < -640 Then cloud4x = 0
	If cloud5x < -640 Then cloud5x = 0
	
	;blimps
	DrawImage blimp,blimpx#,40
	DrawImage blimpsmall,blimpsmallx#,160
	blimpx# = blimpx# + blimpspeed#
	If blimpx# > 2000 Then blimpx# = -300
	blimpsmallx# = blimpsmallx# - blimpsmallspeed#
	If blimpsmallx# < -400 Then blimpsmallx# = 7000
	
	;tree
	DrawImage tree,treex,139
	treex = treex - treespeed
	If treex < -500 Then treex = 1000

	
	;wall
	DrawImage wall,wallx,429
	wallx = wallx - wallspeed
	If wallx < 0 - ImageWidth(wall) Then wallx = 640

	;splash
	DrawImage splash,splashx,30
	DrawImage splash2,splashx + 640,30
	
	If splashcount = True Then
		splashpause = splashpause - 1
	End If
	
	If splashpause < 0 Then
		splashcount = False
		splashpause = 400
		splashmove = True
	End If
	
	If splashmove = True Then
		If splashdir = 0 Then
			splashx = splashx + splashspeed
			If splashx > 10 Then 
				splashx = 10
				splashcount = True
				splashmove = False
				splashdir = 1 - splashdir
			End If
		End If
		If splashdir = 1 Then
			splashx = splashx - splashspeed
			If splashx < -640 Then 
				splashx = -640
				splashcount = True
				splashmove = False
				splashdir = 1 - splashdir
			End If
		End If		
	End If
		
	If fpsok = 1 Then DisplayFPS(0,0)
	
	If KeyHit(33) Then		;F
		fpsok = 1 - fpsok
	End If
	
	If KeyHit(2) Then 
		StopChannel audio1
		audio1 = PlayMusic("media\b-title.mod",1)
	End If
	If KeyHit(3) Then 
		StopChannel audio1
		audio1 = PlayMusic("media\Beast1_2.mod",1)
	End If
	If KeyHit(4) Then
		StopChannel audio1
		audio1 = PlayMusic("media\Beast1_3.mod",1)
	End If
	If KeyHit(5) Then 
		StopChannel audio1
		audio1 = PlayMusic("media\Beast1_4.mod",1)
	End If
	If KeyHit(6) Then
		StopChannel audio1
		audio1 = PlayMusic("media\Beast1_5.mod",1)
	End If

	
	Flip


Until KeyDown(1)

Function DisplayFPS(x#,y#)
	Color 255,255,255
	If Timer + 1000 <= MilliSecs() Timer = MilliSecs() : FPS_Real = FPS_Temp : FPS_Temp = 0
	FPS_Temp = FPS_Temp + 1 : Text x#,y#,"FPS: " + FPS_Real
End Function
